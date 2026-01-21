-- Lualine theme for Monokai Pro
-- This file is auto-discovered by lualine at lua/lualine/themes/

local monokai = require("monokai-pro")
local scheme = monokai.get_scheme()

local M = {}

M.normal = {
  a = { bg = scheme.base.yellow, fg = scheme.base.black, gui = "bold" },
  b = { bg = scheme.base.dimmed5, fg = scheme.base.yellow },
  c = { bg = scheme.statusBar.background, fg = scheme.statusBar.activeForeground },
  x = { bg = scheme.statusBar.background, fg = scheme.statusBar.activeForeground },
}

M.insert = {
  a = { bg = scheme.base.green, fg = scheme.base.black },
  b = { bg = scheme.base.dimmed5, fg = scheme.base.green },
}

M.command = {
  a = { bg = scheme.base.yellow, fg = scheme.base.black },
  b = { bg = scheme.base.dimmed5, fg = scheme.base.yellow },
}

M.visual = {
  a = { bg = scheme.base.magenta, fg = scheme.base.black },
  b = { bg = scheme.base.dimmed5, fg = scheme.base.magenta },
}

M.replace = {
  a = { bg = scheme.base.red, fg = scheme.base.black },
  b = { bg = scheme.base.dimmed5, fg = scheme.base.red },
}

M.inactive = {
  a = { bg = scheme.base.black, fg = scheme.base.yellow },
  b = { bg = scheme.base.black, fg = scheme.base.black },
}

return M
