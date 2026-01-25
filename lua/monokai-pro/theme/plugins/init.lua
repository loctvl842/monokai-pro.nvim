--- Plugin registry with auto-discovery and lazy loading support
---@class MonokaiPro.Theme.Plugins
local M = {}

local state = require("monokai-pro.theme.triggers")
local event_trigger = require("monokai-pro.theme.triggers.event")
local module_trigger = require("monokai-pro.theme.triggers.module")

--- Cache for loaded specs
---@type MonokaiPro.PluginSpec[]|nil
local specs_cache = nil

--- Discover and load all plugin specs from this directory
---@return MonokaiPro.PluginSpec[]
function M.load_specs()
  if specs_cache then
    return specs_cache
  end

  local specs = {}
  local plugin_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

  for _, file in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", false, true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      local module_path = "monokai-pro.theme.plugins." .. name
      local ok, spec = pcall(require, module_path)
      if ok and type(spec) == "table" and spec.highlights then
        table.insert(specs, spec)
      end
    end
  end

  specs_cache = specs
  return specs
end

--- Check if a plugin is enabled
---@param spec MonokaiPro.PluginSpec
---@param config MonokaiPro.Config
---@return boolean
local function is_enabled(spec, config)
  -- Check disabled_plugins list
  if config.disabled_plugins and vim.tbl_contains(config.disabled_plugins, spec.name) then
    return false
  end

  -- Check spec.enabled
  local enabled = spec.enabled
  if enabled == nil or enabled == true then
    return true
  end
  if enabled == false then
    return false
  end
  if type(enabled) == "function" then
    return enabled(config)
  end
  return true
end

--- Generate all plugin highlights (eager ones only, lazy ones are deferred)
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
function M.generate(scheme, config)
  local highlights = {}

  -- Store scheme/config for lazy application
  state.scheme = scheme
  state.config = config

  -- Install module loader once
  module_trigger.install()

  for _, spec in ipairs(M.load_specs()) do
    if not is_enabled(spec, config) then
      goto continue
    end

    local lazy_config = spec.lazy
    local eager = lazy_config == false or lazy_config == nil or state.applied_plugins[spec.name] == true

    if eager then
      -- Eager: apply immediately
      local plugin_highlights = spec.highlights(scheme, config)
      highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights)
      state.applied_plugins[spec.name] = true
    else
      assert(lazy_config ~= nil, "Lazy config should not be nil here")
      -- Lazy: setup triggers
      state.pending_specs[spec.name] = spec

      if lazy_config.event then
        event_trigger.setup(spec, lazy_config.event)
      end

      if lazy_config.module then
        module_trigger.setup(spec, lazy_config.module)
      end
    end

    ::continue::
  end

  return highlights
end

--- Clear the specs cache
function M.clear_cache()
  specs_cache = nil
end

return M
