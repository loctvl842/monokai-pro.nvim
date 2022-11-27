local Telescope = {
	TelescopeSelection = { bg = C.lineNumberForeground, fg = C.yellow },

	TelescopeNormal = { bg = C.hoverWidgetBackground },
	TelescopeBorder = { fg = C.hoverWidgetBackground, bg = C.background },
	TelescopePromptCounter = { fg = C.red },

	TelescopePromptTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopePreviewTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopeResultsTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopeMatching = { fg = C.blue, style = "bold" },

	TelescopePreviewLine = { link = "TelescopeSelection" },
	TelescopePromptPrefix = { fg = C.cyan },
}

return Telescope
