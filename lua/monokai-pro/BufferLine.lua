local BufferLine = {
	BufferLineFill = { bg = C.base03 },
	BufferLineBackground = { bg = C.base05, fg = C.base17 },
	BufferLineBufferSelected = { fg = C.base1F, bg = C.base00, style = "bold" },
	BufferLineBufferVisible = { fg = C.base1F, bg = C.base00, style = "bold,italic" },

	BufferLineCloseButton = { fg = C.base1F, bg = C.base05 },

	BufferLineSeparator = { fg = C.base03, bg = C.base05 },
	BufferLineSeparatorSelected = { fg = C.base03, bg = C.base00 },
	BufferLineSeparatorVisible = { fg = C.base03, bg = C.base00 },

	BufferLineIndicatorSelected = { fg = C.base16, bg = C.base00 },
	BufferLineModified = { fg = C.base17, bg = C.base05 },
	BufferLineModifiedSelected = { fg = C.base1F, bg = C.base00 },

	BufferLineDuplicate = { fg = C.base0E, bg = C.base05 },
	BufferLineDuplicateSelected = { fg = C.base1A, bg = C.base00, style = "bold" },
	BufferLineDuplicateVisible = { fg = C.base1A, bg = C.base00, style = "bold,italic" },

	BufferLineWarning = { fg = C.base12, bg = C.base05, style = "bold,italic" },
	BufferLineWarningVisible = { fg = C.base12, style = "bold,italic" },
	BufferLineWarningSelected = { fg = C.base12, style = "bold" },
	BufferLineWarningDiagnostic = { fg = C.base12, bg = C.base05, style = "bold,italic" },
	BufferLineWarningDiagnosticVisible = { fg = C.base12, style = "bold,italic" },
	BufferLineWarningDiagnosticSelected = { fg = C.base12, style = "bold" },

	BufferLineError = { fg = C.base0D, bg = C.base05, style = "bold,italic" },
	BufferLineErrorSelected = { fg = C.base0D, style = "bold" },
	BufferLineErrorVisible = { fg = C.base0D, style = "bold,italic" },
	BufferLineErrorDiagnostic = { fg = C.base0D, bg = C.base05, style = "bold,italic" },
	BufferLineErrorDiagnosticVisible = { fg = C.base0D, style = "bold,italic" },
	BufferLineErrorDiagnosticSelected = { fg = C.base0D, style = "bold" },

	BufferLineHint = { fg = C.base19, bg = C.base05, style = "bold,italic" },
	BufferLineHintVisible = { fg = C.base19, style = "bold,italic" },
	BufferLineHintSelected = { fg = C.base19, style = "bold" },
	BufferLineHintDiagnostic = { fg = C.base19, bg = C.base05, style = "bold,italic" },
	BufferLineHintDiagnosticVisible = { fg = C.base19, style = "bold,italic" },
	BufferLineHintDiagnosticSelected = { fg = C.base19, style = "bold" },
}

return BufferLine
