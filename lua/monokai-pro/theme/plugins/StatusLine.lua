local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local float = config.plugins.lualine.float
  local colorful = config.plugins.lualine.colorful
  return {
    StatusLine = { bg = c.editorSuggestWidget.background, fg = c.editorSuggestWidget.foreground },
    StatusLineNC = { bg = c.editorSuggestWidget.foreground, fg = c.editorSuggestWidget.background },
    StatusLineSeparator = { fg = c.base.black },
    StatusLineTerm = { fg = c.base.black },
    StatusLineTermNC = { fg = c.base.black },
    SLDiffAdd = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.gitDecoration.addedResourceForeground or c.base.dimmed3,
    },
    SLDiffChange = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.gitDecoration.modifiedResourceForeground or c.base.dimmed3,
    },
    SLDiffDelete = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.gitDecoration.deletedResourceForeground or c.base.dimmed3,
    },
    SLGitIcon = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.green or c.base.dimmed3,
    },
    SLBranchName = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.editorHoverWidget.foreground or c.base.dimmed3,
    },
    SLError = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.inputValidation.errorForeground or c.base.dimmed3,
    },
    SLWarning = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.inputValidation.warningForeground or c.base.dimmed3,
    },
    SLInfo = {
      bg = float and c.editor.background or c.sideBar.background,
      fg = colorful and c.inputValidation.infoForeground or c.base.dimmed3,
    },
    SLPosition = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.magenta or c.base.dimmed3,
    },
    SLShiftWidth = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.yellow or c.base.dimmed3,
    },
    SLEncoding = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.green or c.base.dimmed3,
    },
    SLFiletype = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.cyan or c.base.dimmed3,
    },
    SLMode = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.base.green or c.base.dimmed3,
      bold = true,
    },
    SLSeparatorUnused = {
      bg = float and c.editorHoverWidget.background or c.sideBar.background,
      fg = colorful and c.editor.background or c.base.dimmed3,
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
