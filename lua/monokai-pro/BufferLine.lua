local BufferLine = {
	Offset = { fg = C.lightGray, bg = C.black }, -- Explorer appear in tree setup by bufferline

	BufferLineFill = { bg = C.black },
	BufferLineBackground = { bg = C.bufferline_background, fg = C.lightGray },
	BufferLineBufferSelected = { fg = C.yellow, bg = C.bg, style = "bold" },
	BufferLineBufferVisible = { fg = C.white, bg = C.bg, style = "bold,italic" },

	BufferLineCloseButton = { fg = C.white, bg = C.bufferline_background },
	BufferLineCloseButtonSelected = { fg = C.yellow, bg = C.bg },

	BufferLineSeparator = { fg = C.black, bg = C.bufferline_background },
	BufferLineSeparatorSelected = { fg = C.black, bg = C.bg },
	BufferLineSeparatorVisible = { fg = C.black, bg = C.bg },

	BufferLineIndicatorSelected = { fg = C.yellow, bg = C.bg },
	BufferLineModified = { fg = C.lightGray, bg = C.bufferline_background },
	BufferLineModifiedSelected = { fg = C.white, bg = C.bg },

	BufferLineDuplicate = { fg = C.lightBlack, bg = C.bufferline_background },
	BufferLineDuplicateSelected = { fg = C.lightYellow, bg = C.bg, style = "bold" },
	BufferLineDuplicateVisible = { fg = C.lightWhite, bg = C.bg, style = "bold,italic" },

	BufferLineWarning = { fg = C.orange, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineWarningVisible = { fg = C.orange, style = "bold,italic" },
	BufferLineWarningSelected = { fg = C.orange, style = "bold" },
	BufferLineWarningDiagnostic = { fg = C.orange, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineWarningDiagnosticVisible = { fg = C.orange, style = "bold,italic" },
	BufferLineWarningDiagnosticSelected = { fg = C.orange, style = "bold" },

	BufferLineError = { fg = C.red, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineErrorSelected = { fg = C.red, style = "bold" },
	BufferLineErrorVisible = { fg = C.red, style = "bold,italic" },
	BufferLineErrorDiagnostic = { fg = C.red, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineErrorDiagnosticVisible = { fg = C.red, style = "bold,italic" },
	BufferLineErrorDiagnosticSelected = { fg = C.red, style = "bold" },

	BufferLineHint = { fg = C.cyan, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineHintVisible = { fg = C.cyan, style = "bold,italic" },
	BufferLineHintSelected = { fg = C.cyan, style = "bold" },
	BufferLineHintDiagnostic = { fg = C.cyan, bg = C.bufferline_background, style = "bold,italic" },
	BufferLineHintDiagnosticVisible = { fg = C.cyan, style = "bold,italic" },
	BufferLineHintDiagnosticSelected = { fg = C.cyan, style = "bold" },
}

return BufferLine
