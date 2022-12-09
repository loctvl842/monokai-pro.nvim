local StatusLine = {
	StatusLine = { fg = C.black, bg = C.lightBlack },
	StatusLineNC = { fg = C.black, bg = C.lightBlack },
	StatusLineSeparator = { fg = C.black },
	StatusLineTerm = { fg = C.black },
	StatusLineTermNC = { fg = C.black },
	SLGitIcon = { fg = C.suggestWidgetForeground, bg = C.hoverWidgetBackground },
	SLBranchName = { fg = C.suggestWidgetForeground, bg = C.hoverWidgetBackground },
	SLSeparator = { fg = C.hoverWidgetBackground, bg = C.background },
	SLError = { fg = C.inputValidationErrorForeground, bg = C.background },
	SLWarning = { fg = C.inputValidationWarningForeground, bg = C.background },
	SLPosition = { fg = C.magenta, bg = C.hoverWidgetBackground },
	SLShiftWidth = { fg = C.yellow, bg = C.hoverWidgetBackground },
	SLEncoding = { fg = C.green, bg = C.hoverWidgetBackground },
	SLFiletype = { fg = C.cyan, bg = C.hoverWidgetBackground },
	SLMode = { fg = C.yellow, bg = C.background, style = "bold" },
	SLSeparatorUnused = { fg = C.background, bg = C.hoverWidgetBackground },
	SLPadding = { fg = C.background, bg = C.background },
}

return StatusLine
