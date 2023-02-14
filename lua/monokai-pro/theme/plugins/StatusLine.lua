local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  local float = config.plugins.lualine.float
  local colorful = config.plugins.lualine.colorful
  local float_background = c.editorSuggestWidget.background
  -- local float_background =statusBarBg 
  local alt_float_background = c.editor.background
  local statusbar_bg = c.statusBar.background
  return {
    SLDiffAdd = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.gitDecoration.addedResourceForeground
        or c.statusBar.foreground,
    },
    SLDiffChange = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.gitDecoration.modifiedResourceForeground
        or c.statusBar.foreground,
    },
    SLDiffDelete = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.gitDecoration.deletedResourceForeground
        or c.statusBar.foreground,
    },
    SLGitIcon = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.yellow or c.statusBar.foreground,
    },
    SLBranchName = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.white or c.statusBar.foreground,
    },
    SLError = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.inputValidation.errorForeground
        or c.statusBar.foreground,
    },
    SLWarning = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.inputValidation.warningForeground
        or c.statusBar.foreground,
    },
    SLInfo = {
      bg = float and alt_float_background or statusbar_bg,
      fg = colorful and c.inputValidation.infoForeground
        or c.statusBar.foreground,
    },
    SLPosition = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.magenta or c.statusBar.foreground,
    },
    SLShiftWidth = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.yellow or c.statusBar.foreground,
    },
    SLEncoding = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.green or c.statusBar.foreground,
    },
    SLFiletype = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.cyan or c.statusBar.foreground,
    },
    SLMode = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.base.green or c.statusBar.foreground,
      bold = true,
    },
    SLSeparatorUnused = {
      bg = float and float_background or statusbar_bg,
      fg = colorful and c.editor.background or c.statusBar.foreground,
    },
    SLSeparator = {
      bg = float and c.editor.background or statusbar_bg,
      fg = float and float_background or statusbar_bg,
    },
    SLPadding = {
      bg = float and c.editor.background or statusbar_bg,
      fg = c.editor.background,
    },
  }
end

return M
