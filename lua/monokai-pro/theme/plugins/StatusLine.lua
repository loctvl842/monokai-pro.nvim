local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local float = config.plugins.lualine.float
  local colorful = config.plugins.lualine.colorful
  return {
    StatusLine = { bg = c.statusBar.background, fg = c.statusBar.foreground },
    StatusLineNC = { bg = c.statusBar.background, fg = c.statusBar.foreground },
    StatusLineSeparator = { fg = c.statusBar.background },
    StatusLineTerm = { fg = c.statusBar.background },
    StatusLineTermNC = { fg = c.statusBar.background },
    SLDiffAdd = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.gitDecoration.addedResourceForeground
          or c.statusBar.foreground,
    },
    SLDiffChange = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.gitDecoration.modifiedResourceForeground
          or c.statusBar.foreground,
    },
    SLDiffDelete = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.gitDecoration.deletedResourceForeground
          or c.statusBar.foreground,
    },
    SLGitIcon = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.green or c.statusBar.foreground,
    },
    SLBranchName = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.blue or c.statusBar.foreground,
    },
    SLError = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.inputValidation.errorForeground
          or c.statusBar.foreground,
    },
    SLWarning = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.inputValidation.warningForeground
          or c.statusBar.foreground,
    },
    SLInfo = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = colorful and c.inputValidation.infoForeground
          or c.statusBar.foreground,
    },
    SLPosition = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.magenta or c.statusBar.foreground,
    },
    SLShiftWidth = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.yellow or c.statusBar.foreground,
    },
    SLEncoding = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.green or c.statusBar.foreground,
    },
    SLFiletype = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.cyan or c.statusBar.foreground,
    },
    SLMode = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.base.green or c.statusBar.foreground,
      bold = true,
    },
    SLSeparatorUnused = {
      bg = float and c.editorHoverWidget.background or c.statusBar.background,
      fg = colorful and c.editor.background or c.statusBar.foreground,
    },
    SLSeparator = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = float and c.editorHoverWidget.background or c.statusBar.background,
    },
    SLPadding = {
      bg = float and c.editor.background or c.statusBar.background,
      fg = c.editor.background,
    },
  }
end

return M
