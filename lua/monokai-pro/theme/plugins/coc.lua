---@type MonokaiPro.PluginSpec
return {
  name = "neoclide/coc.nvim",
  lazy = { event = "BufEnter" },

  highlights = function(c)
    -- stylua: ignore
    return {
      CocGitAddedSign         = { bg = c.editor.background, fg = c.gitDecoration.addedResourceForeground },
      CocGitChangeRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.deletedResourceForeground },
      CocGitChangedSign       = { bg = c.editor.background, fg = c.gitDecoration.modifiedResourceForeground },
      CocGitRemovedSign       = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
      CocGitTopRemovedSign    = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
    }
  end,
}
