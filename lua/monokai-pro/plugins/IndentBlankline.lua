local IndentBlankline = {
	IndentBlanklineChar = { fg = C.indent_blankline_char },
	IndentBlanklineContextChar = { fg = C.indent_blankline_contextchar },

	IndentBlanklineContextStart = { style = "underline" },
	IndentBlanklineSpaceChar = { fg = C.background }, -- highlight the character Tab
	-- IndentBlanklineSpaceCharBlankline = { fg = C.yellow },
}

return IndentBlankline
