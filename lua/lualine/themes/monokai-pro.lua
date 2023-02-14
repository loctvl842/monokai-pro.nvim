local colors = require("monokai-pro.colorscheme").colors

local monokai_pro = {}

monokai_pro.normal = {
  a = { bg = colors.base.yellow, fg = colors.base.black, gui = "bold" },
  b = { bg = colors.base.dimmed5, fg = colors.base.yellow },
  c = {
    bg = colors.statusBar.background,
    fg = colors.statusBar.activeForeground,
  },
  x = {
    bg = colors.statusBar.background,
    fg = colors.statusBar.activeForeground,
  },
}

monokai_pro.insert = {
  a = { bg = colors.base.green, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.green },
}

monokai_pro.command = {
  a = { bg = colors.base.yellow, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.yellow },
}

monokai_pro.visual = {
  a = { bg = colors.base.magenta, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.magenta },
}

monokai_pro.replace = {
  a = { bg = colors.base.red, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.red },
}

monokai_pro.inactive = {
  a = { bg = colors.base.black, fg = colors.base.yellow },
  b = { bg = colors.base.black, fg = colors.base.black },
  -- c = { bg = colors.base.black, fg = colors.base.black },
}

return monokai_pro
