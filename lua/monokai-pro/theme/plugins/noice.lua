local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    NoiceCmdlinePopup = { bg = c.editor.background },
    NoiceCmdlinePopupBorder = {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    },
    NoiceCmdlinePopupBorderSearch = {
      bg = c.editor.background,
      fg = c.base.blue,
    },
    NoiceCmdlineIconSearch = { fg = c.base.blue },
  }
end

return M
