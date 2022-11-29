local IndentBlankline = {
	IndentBlanklineChar = { fg = C.indentGuideBackground },
	IndentBlanklineContextChar = { fg = C.indentGuideActiveBackground },

	IndentBlanklineContextStart = { style = "underline" },
	IndentBlanklineSpaceChar = { fg = C.background }, -- highlight the character Tab
	-- IndentBlanklineSpaceCharBlankline = { fg = C.yellow },
}

return IndentBlankline
