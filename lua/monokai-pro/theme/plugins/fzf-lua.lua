local colors = require("monokai-pro.colors")

---@type MonokaiPro.PluginSpec
return {
  name = "ibhagwan/fzf-lua",
  lazy = { module = { "fzf-lua", "fzf-lua.config", "fzf-lua.actions" } },

  highlights = function(c)
    local transparent_bg = c.editor.background

    local common_fg = colors.lighten(c.sideBar.foreground, 30)

  -- stylua: ignore
  return {
    FzfLuaNormal            = { bg = transparent_bg, fg = common_fg },
    FzfLuaBorder            = { bg = transparent_bg, fg = c.tab.unfocusedActiveBorder },
    FzfLuaTitle             = { bg = c.base.yellow, fg = c.base.black, bold = true },
    FzfLuaBackdrop          = { bg = c.base.dark },
    FzfLuaPreviewNormal     = { bg = transparent_bg },
    FzfLuaPreviewBorder     = { link = "FzfLuaBorder" },
    FzfLuaPreviewTitle      = { bg = colors.lighten(transparent_bg, 3), fg = c.base.blue, bold  = true },
    FzfLuaCursorLine        = { bg = colors.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg), bold = true },
    FzfLuaScrollBorderEmpty = { link = "FzfLuaBorder" },
    FzfLuaScrollBorderFull  = { link = "FzfLuaBorder" },
    FzfLuaHelpNormal        = { bg = transparent_bg, fg = common_fg },
    FzfLuaHelpBorder        = { bg = transparent_bg, fg = c.base.green },
    FzfLuaHeaderBind        = { fg = c.base.cyan },
    FzfLuaHeaderText        = { fg = c.base.green },
    FzfLuaFzfHeader         = { fg = common_fg },
    FzfLuaFzfInfo           = { fg = c.base.dimmed3 },
    FzfLuaFzfPointer        = { fg = c.base.blue },
  }
  end,
}
