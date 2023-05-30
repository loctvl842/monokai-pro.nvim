local config = require("monokai-pro.config")
local util = require("monokai-pro.util")
local theme = require("monokai-pro.theme")
local command = require("monokai-pro.command")

local M = {}

M.load = function()
  util.load(theme.setup())
end

--- @param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
M._load = function(filter)
  config.extend({ filter = filter })
  M.load()
end

M.setup = function(options)
  config.setup(options)
  command.create_filter_command()
end

M.get_base_color = function()
  local base_color = require("monokai-pro.colorscheme").colors.base
  return base_color
end

return M
