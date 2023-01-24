local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local float = true
  return {
    StatusLine = { bg = c.editorSuggestWidget.background, fg = c.editorSuggestWidget.foreground },
    StatusLineNC = { bg = c.editorSuggestWidget.foreground, fg = c.editorSuggestWidget.background },
    StatusLineSeparator = { fg = c.base.black },
    StatusLineTerm = { fg = c.base.black },
    StatusLineTermNC = { fg = c.base.black },
    SLDiffAdd = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.gitDecoration.addedResourceForeground,
    },
    SLDiffChange = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.gitDecoration.modifiedResourceForeground,
    },
    SLDiffDelete = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.gitDecoration.deletedResourceForeground,
    },
    SLGitIcon = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.green,
    },
    SLBranchName = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.editorHoverWidget.foreground,
    },
    SLError = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.inputValidation.errorForeground,
    },
    SLWarning = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.inputValidation.warningForeground,
    },
    SLInfo = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.inputValidation.infoForeground,
    },
    SLPosition = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.magenta,
    },
    SLShiftWidth = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.yellow,
    },
    SLEncoding = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.green,
    },
    SLFiletype = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.cyan,
    },
    SLMode = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.base.green,
      bold = true,
    },
    SLSeparatorUnused = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = c.editor.background,
    },
    SLSeparator = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = float and c.editorHoverWidget.background or c.sideBar.background,
    },
    SLPadding = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = c.editor.background,
    },
  }
end

return M
