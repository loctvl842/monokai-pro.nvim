---@type MonokaiPro.PluginSpec
return {
  name = "lewis6991/gitsigns.nvim",
  lazy = { module = "gitsigns" },

  highlights = function(c)
    -- stylua: ignore
    return {
      SignAdd                  = { fg = c.editorGutter.addedBackground },
      SignChange               = { fg = c.editorGutter.modifiedBackground },
      SignDelete               = { fg = c.editorGutter.deletedBackground },
      GitSignsAdd              = { link = "SignAdd" },
      GitSignsChange           = { link = "SignChange" },
      GitSignsDelete           = { link = "SignDelete" },
      GitSignsCurrentLineBlame = { fg = c.base.dimmed4 },
      GitSignsAddInline        = { link = "DiffAdd" },
      GitSignsChangeInline     = { link = "DiffChange" },
      GitSignsDeleteInline     = { link = "DiffDelete" },
    }
  end,
}
