local scrollbar = {
	ScrollbarHandle = { bg = C.scrollbarSliderHoverBackground },
	ScrollbarCursorHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.white },
	ScrollbarCursor = { bg = C.lineHighlightBackground, fg = C.lineHighlightBackground },
	ScrollbarSearchHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.white },
	ScrollbarSearch = { bg = C.background, fg = C.white },

	ScrollbarErrorHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.inputValidationErrorForeground },
	ScrollbarError = { bg = C.background, fg = C.inputValidationErrorForeground },

	ScrollbarWarnHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.inputValidationWarningForeground },
	ScrollbarWarn = { bg = C.background, fg = C.inputValidationWarningForeground },

	ScrollbarInfoHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.inputValidationInfoForeground },
	ScrollbarInfo = { bg = C.background, fg = C.inputValidationInfoForeground },

	ScrollbarHintHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.inputValidationInfoForeground },
	ScrollbarHint = { bg = C.background, fg = C.inputValidationInfoForeground },

	ScrollbarGitAddHandle = { bg = C.scrollbarSliderHoverBackground, fg = C.gitDecorationAddedResourceForeground },
	ScrollbarGitAdd = { bg = C.background, fg = C.gitDecorationAddedResourceForeground },
	ScrollbarGitChangeHandle = {
		bg = C.scrollbarSliderHoverBackground,
		fg = C.gitDecorationModifiedResourceForeground,
	},
	ScrollbarGitChange = {
		bg = C.background,
		fg = C.gitDecorationModifiedResourceForeground,
	},
	ScrollbarGitDeleteHandle = {
		bg = C.scrollbarSliderHoverBackground,
		fg = C.gitDecorationDeletedResourceForeground,
	},
	ScrollbarGitDelete = {
		bg = C.background,
		fg = C.gitDecorationDeletedResourceForeground,
	},
}

return scrollbar
