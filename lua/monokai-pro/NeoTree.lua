local NeoTree = {
	NeoTreeNormal = { bg = Config.transparent_background and "None" or C.black, fg = C.lightGray },
	NeoTreeNormalNC = { bg = C.black, fg = C.lightGray },
	NeoTreeSignColumn = { bg = C.black, fg = C.lightGray },
	NeoTreeEndOfBuffer = { bg = C.black, fg = C.black },
	NeoTreeStatusLine = { bg = "#414339", fg = C.black },
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

	NeoTreeFloatNormal = { bg = C.float_bg, fg = C.lightGray },
	NeoTreeFloatBorder = { bg = Config.transparent_background and "None" or C.black, fg = C.float_bg },
	NeoTreeFloatTitle = { bg = C.yellow, fg = C.black, style = "bold" },

	NeoTreeTabActive = { bg = C.color_column, fg = C.yellow },
	NeoTreeTabInactive = { bg = C.color_column, fg = C.lightBlack },
	NeoTreeTabSeparatorActive = { bg = C.color_column, fg = C.black },
	NeoTreeTabSeparatorInactive = { bg = C.color_column, fg = C.black },
}

return NeoTree
