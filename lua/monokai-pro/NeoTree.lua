local NeoTree = {
	NeoTreeNormal = { fg = C.lightGray, bg = C.black },
	NeoTreeNormalNC = { fg = C.lightGray, bg = C.black },
	NeoTreeSignColumn = { fg = C.lightGray, bg = C.black },
	NeoTreeEndOfBuffer = { fg = C.black, bg = C.black },
	NeoTreeStatusLine = { fg = C.black, bg = "#414339" },
	NeoTreeCursor = { bg = C.neotree_cursorline },
	NeoTreeCursorLine = { bg = C.neotree_cursorline },
	NeoTreeCursorLineSign = { bg = C.neotree_cursorline },
	NeoTreeWinSeparator = {
		bg = Config.transparent_background and "NONE" or C.bg,
		fg = Config.transparent_background and "NONE" or C.bg,
	},
	NeoTreeRootName = { style = "bold" },
	NeoTreeDirectoryIcon = { fg = C.neotree_directory_icon },
	NeoTreeDirectoryName = { fg = C.lightGray },
	NeoTreeGitModified = { fg = C.yellow },
	NeoTreeGitUntracked = { fg = C.green },
	NeoTreeIndentMarker = { fg = C.neotree_indent_marker },
	NeoTreeExpander = { fg = C.neotree_expander },
	NeoTreeFloatNormal = { bg = C.black, fg = C.lightGray },
	NeoTreeFloatBorder = { bg = C.black, fg = C.lightBlack },
	NeoTreeFloatTitle = { bg = C.yellow, fg = C.black, style = "bold" },

	NeoTreeTabActive = { bg = C.bg, fg = C.white },
	NeoTreeTabInactive = { bg = C.black, fg = C.lightBlack },
	NeoTreeTabSeparatorActive = { bg = C.black, fg = C.black },
	NeoTreeTabSeparatorInactive = { bg = C.black, fg = C.black },
}

return NeoTree
