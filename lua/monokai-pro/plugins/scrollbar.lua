local M = {}

M.highlight = {
	ScrollbarHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.base.white },
	ScrollbarCursorHandle = { bg = C.scrollbarSlider.hoverBackground },
	ScrollbarCursor = { bg = C.list.activeSelectionBackground, fg = C.list.activeSelectionBackground },

	ScrollbarSearchHandle = { bg = C.scrollbarSlider.hoverBackground },
	ScrollbarSearch = { bg = C.editor.background, fg = C.base.white },

	ScrollbarErrorHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.inputValidation.errorForeground },
	ScrollbarError = { bg = C.editor.background, fg = C.inputValidation.errorForeground },

	ScrollbarWarnHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.inputValidation.warningForeground },
	ScrollbarWarn = { bg = C.editor.background, fg = C.inputValidation.warningForeground },

	ScrollbarInfoHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.inputValidation.infoForeground },
	ScrollbarInfo = { bg = C.editor.background, fg = C.inputValidation.infoForeground },

	ScrollbarHintHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.inputValidation.infoForeground },
	ScrollbarHint = { bg = C.editor.background, fg = C.inputValidation.infoForeground },

	ScrollbarGitAddHandle = { bg = C.scrollbarSlider.hoverBackground, fg = C.gitDecoration.addedResourceForeground },
	ScrollbarGitAdd = { bg = C.editor.background, fg = C.gitDecoration.addedResourceForeground },
	ScrollbarGitChangeHandle = {
		bg = C.scrollbarSlider.hoverBackground,
		fg = C.gitDecoration.modifiedResourceForeground,
	},
	ScrollbarGitChange = { bg = C.editor.background, fg = C.gitDecoration.modifiedResourceForeground },
	ScrollbarGitDeleteHandle = {
		bg = C.scrollbarSlider.hoverBackground,
		fg = C.gitDecoration.deletedResourceForeground,
	},
	ScrollbarGitDelete = { bg = C.editor.background, fg = C.gitDecoration.deletedResourceForeground },
}

return M
