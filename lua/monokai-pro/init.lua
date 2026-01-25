---@class MonokaiPro
local M = {}

local config_module = require("monokai-pro.config")
local theme_module = require("monokai-pro.theme")

--- Setup the colorscheme with user options
---@param user_config? MonokaiPro.Config
function M.setup(user_config)
  config_module.setup(user_config)

  -- Create user commands
  local commands = require("monokai-pro.commands")
  commands.create()
end

--- Load the colorscheme
function M.load()
  theme_module.load()
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })
end

--- Switch to a specific filter
---@param filter MonokaiPro.Filter
function M.set_filter(filter)
  if not config_module.is_valid_filter(filter) then
    vim.notify(
      -- style: ignore
      string.format("MonokaiPro: Invalid filter '%s'. Valid options: %s", filter, table.concat(config_module.get_filters(), ", ")),
      vim.log.levels.WARN
    )
    return
  end

  config_module.extend({ filter = filter })
  theme_module.clear_cache()
  M.load()
end

--- Get the current configuration
---@return MonokaiPro.Config
function M.get_config()
  return config_module.get()
end

--- Get the current scheme
---@return MonokaiPro.Scheme
function M.get_scheme()
  return theme_module.get_scheme()
end

--- Get color utilities
---@return MonokaiPro.Colors
function M.get_colors()
  return require("monokai-pro.colors")
end

--- Get a palette by filter name
---@param filter? MonokaiPro.Filter
---@return MonokaiPro.Palette
function M.get_palette(filter)
  local palette_module = require("monokai-pro.palette")
  return palette_module.load(filter or config_module.get().filter or "pro")
end

return M
