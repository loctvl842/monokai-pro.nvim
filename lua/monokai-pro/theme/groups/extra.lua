---@type MonokaiPro.PluginSpec
return {
  name = "goolord/alpha-nvim",

  highlights = function(c)
    -- stylua: ignore
    return {
      SPNormalFloat = { bg = c.editorSuggestWidget.background, fg = c.editorSuggestWidget.foreground },
      SPFloatBorder = { bg = c.editor.background, fg = c.editorSuggestWidget.background },
      SPCursorLine  = { bg = c.editorLineNumber.foreground, fg = c.base.yellow, bold = true },
      SPTitle       = { bg = c.base.yellow, fg = c.base.black, bold  = true },
    }
  end,
}
