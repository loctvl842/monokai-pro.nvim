local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  local transparent_bg = c.editor.background

  local common_fg = hp.lighten(c.sideBar.foreground, 30)

  return {
    FzfLuaNormal = { bg = transparent_bg, fg = common_fg },
    FzfLuaBorder = { bg = transparent_bg, fg = c.tab.unfocusedActiveBorder },
    FzfLuaTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
    FzfLuaBackdrop = { bg = c.base.dark },
    FzfLuaPreviewNormal = { bg = transparent_bg },
    FzfLuaPreviewBorder = { link = "FzfLuaBorder" },
    FzfLuaPreviewTitle = { bg = hp.lighten(transparent_bg, 3), fg = c.base.blue, bold = true },
    FzfLuaCursorLine = { bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg), bold = true },
    FzfLuaScrollBorderEmpty = { link = "FzfLuaBorder" },
    FzfLuaScrollBorderFull = { link = "FzfLuaBorder" },
    FzfLuaHelpNormal = { bg = transparent_bg, fg = common_fg },
    FzfLuaHelpBorder = { bg = transparent_bg, fg = c.base.green },
    FzfLuaHeaderBind = { fg = c.base.cyan },
    FzfLuaHeaderText = { fg = c.base.green },
    FzfLuaFzfHeader = { fg = common_fg },
    FzfLuaFzfInfo = { fg = c.base.dimmed3 },
    FzfLuaFzfPointer = { fg = c.base.blue },
  }
end

return M
