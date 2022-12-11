local IndentBlankline = {
	IndentBlanklineChar = { fg = C.indentGuideBackground },
	IndentBlanklineContextChar = { fg = C.indentGuideActiveBackground },
	IndentBlanklineContextStart = { sp = C.indentGuideActiveBackground, style = "underline" },
	-- IndentBlanklineContextChar = { fg = C.magenta},
	-- IndentBlanklineContextStart = { sp = C.magenta, style = "underline" },

	IndentBlanklineSpaceChar = { fg = C.background }, -- highlight the character Tab
}

return IndentBlankline
