---@class MonokaiPro.Util
local M = {}

--- Log a message with the MonokaiPro title
---@param msg string|string[]
---@param level "debug"|"info"|"warn"|"error"
---@param opts? { once?: boolean }
function M.log(msg, level, opts)
  opts = opts or {}
  local log_level = vim.log.levels[level:upper()]

  if type(msg) == "table" then
    msg = table.concat(msg, "\n")
  end

  local notify_opts = { title = "Monokai Pro" }

  if opts.once then
    vim.schedule(function()
      vim.notify_once(msg, log_level, notify_opts)
    end)
  else
    vim.schedule(function()
      vim.notify(msg, log_level, notify_opts)
    end)
  end
end

--- Log an error message
---@param msg string|string[]
function M.error(msg)
  M.log(msg, "error")
end

--- Log a warning message
---@param msg string|string[]
function M.warn(msg)
  M.log(msg, "warn")
end

--- Log an info message
---@param msg string|string[]
function M.info(msg)
  M.log(msg, "info")
end

--- Safely execute a function with error handling
---@param fn fun()
---@param opts? { msg?: string, on_error?: fun(err: string) }
---@return any
function M.try(fn, opts)
  local ok, result = xpcall(fn, function(error)
    local msg = (opts and opts.msg or "") .. (opts and opts.msg and "\n\n" or "") .. error
    local handler = opts and opts.on_error or M.error
    handler(msg)
    return error
  end)
  return ok and result or nil
end

return M
