local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    CocGitAddedSign = { bg = c.editor.background, fg = c.gitDecoration.addedResourceForeground },
    CocGitChangeRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.deletedResourceForeground },
    CocGitChangedSign = { bg = c.editor.background, fg = c.gitDecoration.modifiedResourceForeground },
    CocGitRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
    CocGitTopRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
  }
end

return M
