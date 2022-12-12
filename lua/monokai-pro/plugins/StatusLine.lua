local StatusLine = {
	StatusLine = { fg = C.base.black, bg = C.base.black},
	StatusLineNC = { fg = C.base.black, bg = C.base.lightBlack },
	StatusLineSeparator = { fg = C.base.black },
	StatusLineTerm = { fg = C.base.black },
	StatusLineTermNC = { fg = C.base.black },
	SLGitIcon = {
		fg = C.base.green,
		bg = C.editorHoverWidget.background,
	},
	SLBranchName = {
		fg = C.editorHoverWidget.foreground,
		bg = C.editorHoverWidget.background,
	},
	SLSeparator = {
		fg = C.editorHoverWidget.background,
		bg = C.editor.background,
	},
	SLError = {
		fg = C.inputValidation.errorForeground,
		bg = C.editor.background,
	},
	SLWarning = {
		fg = C.inputValidation.warningForeground,
		bg = C.editor.background,
	},
	SLPosition = {
		fg = C.base.magenta,
		bg = C.editorHoverWidget.background,
	},
	SLShiftWidth = {
		fg = C.base.yellow,
		bg = C.editorHoverWidget.background,
	},
	SLEncoding = {
		fg = C.base.green,
		bg = C.editorHoverWidget.background,
	},
	SLFiletype = {
		fg = C.base.cyan,
		bg = C.editorHoverWidget.background,
	},
	SLMode = {
		fg = C.base.yellow,
		bg = C.editor.background,
		bold = true,
	},
	SLSeparatorUnused = {
		fg = C.editor.background,
		bg = C.editorHoverWidget.background,
	},
	SLPadding = {
		fg = C.editor.background,
		bg = C.editor.background,
	},
}

return StatusLine
