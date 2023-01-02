local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		CocGitAddedSign = { bg = c.editor.background, fg = c.gitDecoration.addedResourceForeground },
		CocGitChangeRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.deletedResourceForeground },
		CocGitChangedSign = { bg = c.editor.background, fg = c.gitDecoration.modifiedResourceForeground },
		CocGitRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
		CocGitTopRemovedSign = { bg = c.editor.background, fg = c.gitDecoration.stageDeletedResourceForeground },
	}
end

return M
