---@type MonokaiPro.PluginSpec
return {
  name = "RRethy/vim-illuminate",
  lazy = { module = "illuminate" },

  highlights = function(c)
    return {
      IlluminatedWordRead  = { bg = c.editor.wordHighlightBackground },
      IlluminatedWordText  = { bg = c.editor.selectionHighlightBackground },
      IlluminatedWordWrite = { bg = c.editor.wordHighlightStrongBackground },
    }
  end,
}
