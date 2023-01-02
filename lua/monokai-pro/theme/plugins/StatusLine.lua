local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		StatusLine = { bg = c.editorSuggestWidget.background, fg = c.editorSuggestWidget.foreground },
		StatusLineNC = { bg = c.editorSuggestWidget.foreground, fg = c.editorSuggestWidget.background },
		StatusLineSeparator = { fg = c.base.black },
		StatusLineTerm = { fg = c.base.black },
		StatusLineTermNC = { fg = c.base.black },
		SLDiffAdd = {
			bg = c.editor.background,
			fg = c.gitDecoration.addedResourceForeground,
		},
		SLDiffChange = {
			bg = c.editor.background,
			fg = c.gitDecoration.modifiedResourceForeground,
		},
		SLDiffDelete = {
			bg = c.editor.background,
			fg = c.gitDecoration.deletedResourceForeground,
		},
		SLGitIcon = {
			fg = c.base.green,
			bg = c.editorHoverWidget.background,
		},
		SLBranchName = {
			fg = c.editorHoverWidget.foreground,
			bg = c.editorHoverWidget.background,
		},
		SLSeparator = {
			fg = c.editorHoverWidget.background,
			bg = c.editor.background,
		},
		SLError = {
			fg = c.inputValidation.errorForeground,
			bg = c.editor.background,
		},
		SLWarning = {
			fg = c.inputValidation.warningForeground,
			bg = c.editor.background,
		},
		SLInfo = {
			bg = c.editor.background,
			fg = c.inputValidation.infoForeground,
		},
		SLPosition = {
			fg = c.base.magenta,
			bg = c.editorHoverWidget.background,
		},
		SLShiftWidth = {
			fg = c.base.yellow,
			bg = c.editorHoverWidget.background,
		},
		SLEncoding = {
			fg = c.base.green,
			bg = c.editorHoverWidget.background,
		},
		SLFiletype = {
			fg = c.base.cyan,
			bg = c.editorHoverWidget.background,
		},
		SLMode = {
			fg = c.base.green,
			bg = c.editorHoverWidget.background,
			bold = true,
		},
		SLSeparatorUnused = {
			fg = c.editor.background,
			bg = c.editorHoverWidget.background,
		},
		SLPadding = {
			fg = c.editor.background,
			bg = c.editor.background,
		},
	}
end

return M
