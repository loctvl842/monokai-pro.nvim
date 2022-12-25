local isTelescopeBackgroundClear = Config.plugins.telescope.background_clear

local Telescope = {
	TelescopeSelection = { bg = C.editorLineNumber.foreground, fg = C.base.yellow, bold = true },

	TelescopeNormal = { bg = isTelescopeBackgroundClear and C.editor.background or C.editorHoverWidget.background },
	TelescopeBorder = { fg = isTelescopeBackgroundClear and C.tab.unfocusedActiveBorder or C.editorHoverWidget.background, bg = C.editor.background },
	TelescopePromptCounter = { fg = C.base.red },

	TelescopePromptTitle = { bg = C.base.yellow, fg = C.base.black, bold = true },
	TelescopePreviewTitle = { bg = C.base.yellow, fg = C.base.black, bold = true },
	TelescopeResultsTitle = { bg = C.base.yellow, fg = C.base.black, bold = true },
	TelescopeMatching = { fg = C.base.blue, bold = true },

	TelescopePreviewLine = { link = "TelescopeSelection" },
	TelescopePromptPrefix = { fg = C.base.cyan },
}

return Telescope
