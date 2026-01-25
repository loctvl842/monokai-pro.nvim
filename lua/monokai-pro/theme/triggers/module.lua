--- Module-based lazy loading trigger (require() interception)
local state = require("monokai-pro.theme.triggers")

local M = {}

M._installed = false

--- Custom module loader for lazy plugin highlights
---@param modname string The module being required
---@return nil
function M.loader(modname)
  local plugin_name = state.module_to_plugin[modname]
  if not plugin_name then
    return nil
  end

  if state.applied_plugins[plugin_name] then
    return nil
  end

  state.apply(plugin_name)
  return nil -- Let normal loaders find the module
end

--- Install the module loader into package.searchers
function M.install()
  if M._installed then
    return
  end

  ---@diagnostic disable-next-line: deprecated
  local searchers = package.searchers or package.loaders
  table.insert(searchers, 2, M.loader)
  M._installed = true
end

--- Register a module -> plugin mapping
---@param module_name string The module name (e.g., "telescope")
---@param plugin_name string The plugin name (e.g., "telescope")
function M.register(module_name, plugin_name)
  state.module_to_plugin[module_name] = plugin_name
end

--- Setup module trigger for a plugin
---@param spec MonokaiPro.PluginSpec Plugin spec
---@param modules string|string[] Module(s) to trigger on
function M.setup(spec, modules)
  if type(modules) == "string" then
    modules = { modules }
  end

  for _, mod in ipairs(modules) do
    if package.loaded[mod] ~= nil then
      state.apply(spec.name)
      goto continue
    end
  end

  for _, mod in ipairs(modules) do
    M.register(mod, spec.name)
  end

  ::continue::
end

return M
