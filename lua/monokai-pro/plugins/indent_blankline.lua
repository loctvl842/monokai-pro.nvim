local IndentBlankline = {
	IndentBlanklineChar = { fg = C.editorIndentGuide.background },
	IndentBlanklineContextChar = { fg = C.editorIndentGuide.activeBackground },
	IndentBlanklineContextStart = { sp = C.editorIndentGuide.activeBackground, underline = true },
	-- IndentBlanklineContextChar = { fg = C.magenta},
	-- IndentBlanklineContextStart = { sp = C.magenta, style = "underline" },

	IndentBlanklineSpaceChar = { fg = C.editor.background }, -- highlight the character Tab
}

return IndentBlankline
