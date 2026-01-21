-- Lightline theme for Monokai Pro
-- This file is auto-discovered by lightline

local monokai = require("monokai-pro")
local scheme = monokai.get_scheme()

local M = {}

M.normal = {
  left = {
    { scheme.base.black, scheme.base.yellow },
    { scheme.base.yellow, scheme.editorSuggestWidget.background },
  },
  middle = { { scheme.base.black, scheme.base.black } },
  right = {
    { scheme.base.black, scheme.base.yellow },
    { scheme.base.yellow, scheme.editorSuggestWidget.background },
  },
  error = { { scheme.base.black, scheme.base.red } },
  warning = { { scheme.base.black, scheme.base.blue } },
}

M.insert = {
  left = {
    { scheme.base.black, scheme.base.green },
    { scheme.base.green, scheme.editorSuggestWidget.background },
  },
}

M.visual = {
  left = {
    { scheme.base.black, scheme.base.magenta },
    { scheme.base.magenta, scheme.editorSuggestWidget.background },
  },
}

M.replace = {
  left = {
    { scheme.base.black, scheme.base.red },
    { scheme.base.red, scheme.editorSuggestWidget.background },
  },
}

M.inactive = {
  left = {
    { scheme.base.yellow, scheme.base.black },
    { scheme.base.black, scheme.base.black },
  },
  middle = {
    { scheme.base.black, scheme.base.black },
  },
}

return M
