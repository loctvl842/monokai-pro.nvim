local M = {}

M.highlight = {
	NvimTreeFolderIcon = { fg = C.neotree_directory_icon },

	NvimTreeIndentMarker = { link = "IndentBlanklineChar" },

	NvimTreeNormal = { bg = C.sideBar.background, fg = C.sideBar.foreground },
	NvimTreeEndOfBuffer = { bg = C.sideBar.background, fg = C.sideBar.background },
	NvimTreeWinSeparator = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editor.background,
	},

	NvimTreeFolderName = { fg = C.sideBar.foreground },
	NvimTreeOpenedFolderName = { fg = C.sideBar.foreground, italic = true },
	NvimTreeEmptyFolderName = { fg = C.sideBar.foreground, italic = true },
	NvimTreeImageFile = { fg = C.base.lightWhite },
	NvimTreeSpecialFile = { fg = C.base.white },
	NvimTreeCursorLine = { bg = C.list.activeSelectionBackground, bg_base = C.sideBar.background },

	NvimTreeGitIgnored = { fg = C.gitDecoration.ignoredResourceForeground },
	NvimTreeGitignoreIcon = { fg = C.gitDecoration.ignoredResourceForeground },
	NvimTreeGitStaged = { fg = C.gitDecoration.stageModifiedResourceForeground },
	NvimTreeGitDirty = { fg = C.gitDecoration.modifiedResourceForeground }, -- unstaged/modified
	NvimTreeGitNew = { fg = C.gitDecoration.untrackedResourceForeground },
	NvimTreeGitRenamed = { fg = C.gitDecoration.untrackedResourceForeground },
	NvimTreeGitDeleted = { fg = C.gitDecoration.deletedResourceForeground },
	NvimTreeGitMerge = { fg = C.gitDecoration.conflictingResourceForeground },

	NvimTreeSymlink = { fg = C.base.white },
	NvimTreeRootFolder = {
		fg = C.sideBarSectionHeader.foreground,
		bold = true,
	},
	NvimTreeExecFile = { fg = C.base.green },
}

return M
