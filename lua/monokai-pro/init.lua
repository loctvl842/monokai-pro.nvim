local config = require("monokai-pro.config")
local util = require("monokai-pro.util")
local theme = require("monokai-pro.theme")
local command = require("monokai-pro.command")

---@class MonokaiPro
local M = {}

M.load = function()
  util.theme.load(theme.setup())
end

--- @param filter "light" | "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
M._load = function(filter)
  config.extend({ filter = filter })
  M.load()
end

M.setup = function(options)
  config.setup(options)
  command.create_filter_command()
end
return M
