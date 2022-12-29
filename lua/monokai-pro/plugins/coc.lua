local M = {}

M.highlight = {
	CocGitAddedSign = { bg = C.editor.background, fg = C.gitDecoration.addedResourceForeground },
	CocGitChangeRemovedSign = { bg = C.editor.background, fg = C.gitDecoration.deletedResourceForeground },
	CocGitChangedSign = { bg = C.editor.background, fg = C.gitDecoration.modifiedResourceForeground },
	CocGitRemovedSign = { bg = C.editor.background, fg = C.gitDecoration.stageDeletedResourceForeground },
	CocGitTopRemovedSign = { bg = C.editor.background, fg = C.gitDecoration.stageDeletedResourceForeground },
}

return M
