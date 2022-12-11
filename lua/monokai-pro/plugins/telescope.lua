local Telescope = {
	TelescopeSelection = { bg = C.editorLineNumber.foreground, fg = C.base.yellow },

	TelescopeNormal = { bg = C.editorHoverWidget.background },
	TelescopeBorder = { fg = C.editorHoverWidget.background, bg = C.editor.background },
	TelescopePromptCounter = { fg = C.base.red },

	TelescopePromptTitle = { bg = C.base.yellow, fg = C.base.black, style = "bold" },
	TelescopePreviewTitle = { bg = C.base.yellow, fg = C.base.black, style = "bold" },
	TelescopeResultsTitle = { bg = C.base.yellow, fg = C.base.black, style = "bold" },
	TelescopeMatching = { fg = C.base.blue, style = "bold" },

	TelescopePreviewLine = { link = "TelescopeSelection" },
	TelescopePromptPrefix = { fg = C.base.cyan },
}

return Telescope
