local M = {}
M.highlight = {
	StatusLine = { bg = C.editorSuggestWidget.background, fg = C.editorSuggestWidget.foreground },
	StatusLineNC = { bg = C.editorSuggestWidget.foreground, fg = C.editorSuggestWidget.background },
	StatusLineSeparator = { fg = C.base.black },
	StatusLineTerm = { fg = C.base.black },
	StatusLineTermNC = { fg = C.base.black },
	SLDiffAdd = {
		bg = C.editor.background,
		fg = C.gitDecoration.addedResourceForeground,
	},
	SLDiffChange = {
		bg = C.editor.background,
		fg = C.gitDecoration.modifiedResourceForeground,
	},
	SLDiffDelete = {
		bg = C.editor.background,
		fg = C.gitDecoration.deletedResourceForeground,
	},
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
	SLInfo = {
		bg = C.editor.background,
		fg = C.inputValidation.infoForeground,
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
		fg = C.base.green,
		bg = C.editorHoverWidget.background,
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

return M
