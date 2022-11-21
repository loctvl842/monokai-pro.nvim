local IndentBlankline = {
	IndentBlanklineChar = { fg = C.indent_blankline_char },
	IndentBlanklineContextChar = { fg = C.indent_blankline_contextchar },

	IndentBlanklineContextStart = { style = "underline" },
	IndentBlanklineSpaceChar = { fg = C.bg }, -- highlight the character Tab
	-- IndentBlanklineSpaceCharBlankline = { fg = C.yellow },
}

return IndentBlankline
