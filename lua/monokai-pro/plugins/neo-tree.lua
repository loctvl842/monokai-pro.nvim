local NeoTree = {
	NeoTreeNormal = { bg = C.sideBar.background, fg = C.sideBar.foreground },
	NeoTreeEndOfBuffer = { bg = C.sideBar.background, fg = C.sideBar.background },
	NeoTreeNormalNC = { bg = C.sideBar.background, fg = C.sideBar.foreground },
	NeoTreeSignColumn = { bg = C.sideBar.background, fg = C.sideBar.foreground },
	NeoTreeStatusLine = { bg = C.sideBar.background, fg = C.sideBar.background },
	NeoTreeCursor = { bg = C.list.activeSelectionBackground, bg_base = C.sideBar.background },
	NeoTreeCursorLine = { bg = C.list.activeSelectionBackground, bg_base = C.sideBar.background },
	NeoTreeCursorLineSign = { bg = C.list.activeSelectionBackground, bg_base = C.sideBar.background },
	NeoTreeWinSeparator = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editor.background,
	},
	NeoTreeRootName = {
		bg = C.sideBarSectionHeader.background,
		fg = C.sideBarSectionHeader.foreground,
		bold = true,
	},
	NeoTreeDirectoryIcon = { fg = C.neotree_directory_icon },
	NeoTreeDirectoryName = { fg = C.sideBar.foreground },

	NeoTreeGitAdded = { fg = C.gitDecoration.addedResourceForeground },
	NeoTreeGitConflict = { fg = C.gitDecoration.conflictingResourceForeground },
	NeoTreeGitDeleted = { fg = C.gitDecoration.deletedResourceForeground },
	NeoTreeGitIgnored = { fg = C.gitDecoration.ignoredResourceForeground },
	NeoTreeGitModified = { fg = C.gitDecoration.modifiedResourceForeground },
	NeoTreeGitStaged = { fg = C.gitDecoration.stageModifiedResourceForeground },
	NeoTreeGitRenamed = { fg = C.gitDecoration.untrackedResourceForeground },
	NeoTreeGitUntracked = { fg = C.gitDecoration.untrackedResourceForeground },

	NeoTreeIndentMarker = { link = "IndentBlanklineChar" },
	NeoTreeExpander = { link = "NeoTreeDirectoryIcon" },

	NeoTreeFloatNormal = { bg = C.editorHoverWidget.background, fg = C.sideBar.foreground },
	NeoTreeFloatBorder = {
		bg = Config.transparent_background and nil or C.sideBar.background,
		fg = C.editorHoverWidget.background,
	},
	NeoTreeFloatTitle = { bg = C.base.yellow, fg = C.sideBar.background, bold = true },

	NeoTreeTabActive = { bg = C.button.hoverbackground, fg = C.button.foreground },
	NeoTreeTabInactive = { bg = C.button.background, fg = C.button.foreground },
	NeoTreeTabSeparatorActive = { bg = C.button.hoverbackground, fg = C.button.separator },
	NeoTreeTabSeparatorInactive = { bg = C.button.background, fg = C.button.separator },
}

return NeoTree
