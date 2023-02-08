local util = require("monokai-pro.util")
local config = require("monokai-pro.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiProSelect", function()
    local menu = util.create_menu("Set monokai filter", {
      "classic",
      "octagon",
      "pro",
      "machine",
      "ristretto",
      "spectrum",
    }, function(item)
      local filter = item.value
      config.extend({ filter = filter })
      require("monokai-pro.init").load()
      vim.cmd([[colorscheme monokai-pro]])
    end)
    menu:mount()
  end, { nargs = 0 })

  cmd("MonokaiPro", function(opts)
    local filter = opts.args
    config.extend({ filter = filter })
    vim.cmd([[colorscheme monokai-pro]])
  end, {
    nargs = 1,
    complete = function()
      return {
        "classic",
        "octagon",
        "pro",
        "machine",
        "ristretto",
        "spectrum",
      }
    end,
  })
end

return M
