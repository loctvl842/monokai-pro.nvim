local config = require("monokai-pro.config")
local util = require("monokai-pro.util")
local theme = require("monokai-pro.theme")
local command = require("monokai-pro.command")

local M = {}

M.load = function()
	util.load(theme.setup(config.options))
end

M.setup = function(options)
	config.setup(options)
  command.create_filter_command()
end

M.get_base_color = function ()
  local filter = config.options.filter or "pro"
  --- @module "monokai-pro.palette.pro"
  local palette = require("monokai-pro.palette." .. filter)
  local base_color = palette.base
  return base_color
end

return M
