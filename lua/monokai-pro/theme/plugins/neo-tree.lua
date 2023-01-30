local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		NeoTreeNormal = { bg = c.sideBar.background, fg = c.sideBar.foreground },
		NeoTreeEndOfBuffer = { bg = c.sideBar.background, fg = c.sideBar.background },
		NeoTreeNormalNC = { bg = c.sideBar.background, fg = c.sideBar.foreground },
		NeoTreeSignColumn = { bg = c.sideBar.background, fg = c.sideBar.foreground },
		NeoTreeStatusLine = { bg = c.sideBar.background, fg = c.sideBar.background },
		NeoTreeCursor = { bg = c.list.activeSelectionBackground, bg_base = c.sideBar.background },
		NeoTreeCursorLine = { bg = c.list.activeSelectionBackground, bg_base = c.sideBar.background, bold = true },
		NeoTreeCursorLineSign = { bg = c.list.activeSelectionBackground, bg_base = c.sideBar.background },
		NeoTreeWinSeparator = {
			bg = c.editor.background,
			fg = c.base.black,
		},
		NeoTreeRootName = {
			-- bg = C.sideBarSectionHeader.background,
			fg = c.sideBarSectionHeader.foreground,
			bold = true,
		},
		NeoTreeDirectoryIcon = { fg = c.sideBar.foreground },
		NeoTreeDirectoryName = { fg = c.sideBar.foreground },

		NeoTreeGitAdded = { fg = c.gitDecoration.addedResourceForeground },
		NeoTreeGitConflict = { fg = c.gitDecoration.conflictingResourceForeground },
		NeoTreeGitDeleted = { fg = c.gitDecoration.deletedResourceForeground },
		NeoTreeGitIgnored = { fg = c.gitDecoration.ignoredResourceForeground },
		NeoTreeGitModified = { fg = c.gitDecoration.modifiedResourceForeground }, -- unstaged
		NeoTreeGitStaged = { fg = c.gitDecoration.stageModifiedResourceForeground },
		NeoTreeGitRenamed = { fg = c.gitDecoration.untrackedResourceForeground },
		NeoTreeGitUntracked = { fg = c.gitDecoration.untrackedResourceForeground },

		NeoTreeIndentMarker = { link = "IndentBlanklineChar" },
		NeoTreeExpander = { link = "NeoTreeDirectoryIcon" },

		NeoTreeFloatNormal = { bg = c.editorHoverWidget.background, fg = c.sideBar.foreground },
		NeoTreeFloatBorder = {
			bg = c.sideBar.background,
			fg = c.sideBar.background,
		},
		NeoTreeFloatTitle = { bg = c.base.yellow, fg = c.sideBar.background, bold = true },

		NeoTreeTabActive = { bg = c.button.hoverbackground, fg = c.button.foreground, bold = true },
		NeoTreeTabInactive = { bg = c.button.background, fg = c.button.foreground },
		NeoTreeTabSeparatorActive = { bg = c.button.hoverbackground, fg = c.button.separator },
		NeoTreeTabSeparatorInactive = { bg = c.button.background, fg = c.button.separator },
	}
end

return M
