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

return M
