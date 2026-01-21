---@type MonokaiPro.PluginSpec
return {
  name = "kevinhwang91/nvim-ufo",
  lazy = { module = "ufo" },

  highlights = function(c)
    return {
      UfoFoldedBg = { bg = c.editor.background },
      FoldColumn = {
        bg = c.editor.background,
        fg = c.button.foreground,
      }, -- 'foldcolumn'
    }
  end,
}
