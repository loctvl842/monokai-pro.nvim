---@class Util
---@field class monokai-pro.util.class
---@field devicons monokai-pro.util.devicons
---@field extra monokai-pro.util.extra
---@field theme monokai-pro.util.theme
---@field ui monokai-pro.util.ui
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local mod = require("monokai-pro.util." .. k)
    return mod
  end,
})

--- A logging function
--- @param msg string
--- @param level "debug"|"info"|"warn"|"error"
--- @param opts table|nil
function M.log(msg, level, opts)
  opts = opts or {}
  local log_level = vim.log.levels[level:upper()]
  if type(msg) == "table" then
    msg = table.concat(msg, "\n")
  end
  local nopts = { title = "Monokai-pro" }
  if opts.once then
    return vim.schedule(function()
      vim.notify_once(msg, log_level, nopts)
    end)
  end
  vim.schedule(function()
    vim.notify(msg, log_level, nopts)
  end)
end

return M
