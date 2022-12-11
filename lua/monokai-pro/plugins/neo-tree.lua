local util = require("monokai-pro.util")
local NeoTree = {
	NeoTreeNormal = { bg = C.sideBarBackground, fg = C.sideBarForeground },
	NeoTreeEndOfBuffer = { bg = C.sideBarBackground, fg = C.sideBarBackground },
	NeoTreeNormalNC = { bg = C.sideBarBackground, fg = C.sideBarForeground },
	NeoTreeSignColumn = { bg = C.sideBarBackground, fg = C.sideBarForeground },
	NeoTreeStatusLine = { bg = "#414339", fg = C.sideBarBackground },
	NeoTreeCursor = { bg = C.listActiveSelectionBackground },
	NeoTreeCursorLine = { bg = C.listActiveSelectionBackground },
	NeoTreeCursorLineSign = { bg = C.listActiveSelectionBackground },
	NeoTreeWinSeparator = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = C.background,
	},
	NeoTreeRootName = { guifg = C.sideBarSectionHeaderForeground, style = "bold" },
	NeoTreeDirectoryIcon = { fg = C.neotree_directory_icon },
	NeoTreeDirectoryName = { fg = C.sideBarForeground },

	NeoTreeGitAdded = { fg = C.gitDecorationAddedResourceForeground },
	NeoTreeGitConflict = { fg = C.gitDecorationConflictingResourceForeground },
	NeoTreeGitDeleted = { fg = C.gitDecorationDeletedResourceForeground },
	NeoTreeGitIgnored = { fg = C.gitDecorationIgnoredResourceForeground },
	NeoTreeGitModified = { fg = C.gitDecorationModifiedResourceForeground },
	NeoTreeGitStaged = { fg = C.gitDecorationStageModifiedResourceForeground },
	NeoTreeGitRenamed = { fg = C.gitDecorationUntrackedResourceForeground },
	NeoTreeGitUntracked = { fg = C.gitDecorationUntrackedResourceForeground, style="NONE" },

	NeoTreeIndentMarker = { link = "IndentBlanklineChar" },
	NeoTreeExpander = { link = "NeoTreeDirectoryIcon" },

	NeoTreeFloatNormal = { bg = C.hoverWidgetBackground, fg = C.sideBarForeground },
	NeoTreeFloatBorder = {
		bg = Config.transparent_background and "None" or C.sideBarBackground,
		fg = C.hoverWidgetBackground,
	},
	NeoTreeFloatTitle = { bg = C.yellow, fg = C.sideBarBackground, style = "bold" },

	NeoTreeTabActive = { bg = C.background, fg = C.white },
	NeoTreeTabInactive = { bg = C.background, fg = util.blend(C.white, C.background, 0.3) },
	NeoTreeTabSeparatorActive = { bg = C.background, fg = C.sideBarBackground },
	NeoTreeTabSeparatorInactive = { bg = C.background, fg = C.sideBarBackground },
}

return NeoTree
