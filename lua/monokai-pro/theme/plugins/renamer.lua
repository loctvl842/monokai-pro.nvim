---@type MonokaiPro.PluginSpec
return {
  name = "filipdutescu/renamer.nvim",
  lazy = { module = "renamer" },

  highlights = function(c, config)
    local isBackgroundClear = vim.tbl_contains(config.background_clear, "renamer")
    -- stylua: ignore
    return {
      RenamerNormal = { bg = isBackgroundClear and c.editor.background or c.editorHoverWidget.background, fg = c.editorSuggestWidget.foreground },
      RenamerBorder = { bg = c.editor.background, fg = isBackgroundClear and c.editorSuggestWidget.foreground or c.editorSuggestWidget.background },
      RenamerTitle = isBackgroundClear and { fg = c.base.yellow, bold = true } or { bg = c.base.yellow, fg = c.base.black, bold = true },
    }
  end,
}
