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
    NoiceFormatProgressDone = { bg = c.base.yellow, fg = c.base.black, bold = true },
    NoiceFormatProgressTodo = { bg = c.base.dimmed4, fg = c.base.dimmed5 },
    NoiceLspProgressTitle = { fg = c.base.dimmed2 },
    NoiceLspProgressClient = { fg = c.base.cyan },
  }
end

return M
