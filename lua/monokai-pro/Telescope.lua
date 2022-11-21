local Telescope = {
	TelescopeSelection = { bg = C.lineNr, fg = C.yellow },

	TelescopeNormal = { bg = C.float_bg },
	TelescopeBorder = { fg = C.float_bg, bg = Config.transparent_background and "None" or C.bg },
	TelescopePromptCounter = { fg = C.red },

	TelescopePromptTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopePreviewTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopeResultsTitle = { bg = C.yellow, fg = C.black, style = "bold" },
	TelescopeMatching = { fg = C.blue, style = "bold" },

	TelescopePreviewLine = { link = "TelescopeSelection" },
}

return Telescope
