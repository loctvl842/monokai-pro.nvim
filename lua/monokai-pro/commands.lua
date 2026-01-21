---@class MonokaiPro.Commands
local M = {}

local config_module = require("monokai-pro.config")

--- Create filter selection menu using vim.ui.select
local function select_filter()
  local filters = config_module.get_filters()
  local current = config_module.get().filter or "pro"

  vim.ui.select(filters, {
    prompt = "Select Monokai Pro Filter:",
    format_item = function(item)
      if item == current then
        return item .. " (current)"
      end
      return item
    end,
  }, function(choice)
    if choice then
      require("monokai-pro").set_filter(choice)
    end
  end)
end

--- Create user commands
function M.create()
  local cmd = vim.api.nvim_create_user_command

  -- MonokaiProSelect: Open filter selection menu
  cmd("MonokaiProSelect", function()
    select_filter()
  end, {
    desc = "Open Monokai Pro filter selection menu",
    nargs = 0,
  })

  -- MonokaiPro: Set a specific filter directly
  cmd("MonokaiPro", function(opts)
    local filter = opts.args
    require("monokai-pro").set_filter(filter)
  end, {
    desc = "Set Monokai Pro filter",
    nargs = 1,
    complete = function()
      return config_module.get_filters()
    end,
  })
end

return M
