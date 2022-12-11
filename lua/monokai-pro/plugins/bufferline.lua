local utils = require("monokai-pro.util")

local normalAlpha = 0.6
local visibleAlpha = 0.8
local isSelectedUnderlined = Config.plugins.bufferline.underline_selected

local BufferLine = {
	Offset = {
		bg = C.sideBar.background,
		fg = C.sideBarTitle.foreground,
	}, -- Explorer appear in tree setup by bufferline

	BufferLineFill = {
		bg = C.editorGroupHeader.tabsBackground,
		sp = C.editorGroupHeader.tabsBorder,
		style = "underline",
	},

	BufferLineBufferSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineBackground = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.base.white, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineBufferVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.base.white, C.editor.background, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	-- Duplicate
	BufferLineDuplicateSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = utils.blend(C.base.white, C.tab.activeBackground, normalAlpha),
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineDuplicate = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.base.white, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineDuplicateVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.base.white, C.tab.unfocusedActiveBackground, normalAlpha),
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	-- CloseButton
	BufferLineCloseButtonSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineCloseButton = {
		bg = C.tab.inactiveBackground,
		fg = C.base.white,
	},
	BufferLineCloseButtonVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = C.base.white,
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	-- separator
	BufferLineSeparatorSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.editorGroupHeader.tabsBackground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineSeparator = {
		bg = C.tab.inactiveBackground,
		fg = C.editorGroupHeader.tabsBackground,
	},
	BufferLineSeparatorVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = C.editorGroupHeader.tabsBackground,
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	-- Modified
	BufferLineModifiedSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineModified = {
		bg = C.tab.inactiveBackground,
		fg = C.base.white,
	},
	BufferLineModifiedVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = C.base.white,
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	-- Warning
	BufferLineWarningSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.inputValidation.warningForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineWarning = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.warningForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineWarningVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.warningForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	BufferLineWarningDiagnosticSelected = { link = "BufferLineWarningSelected" },
	BufferLineWarningDiagnostic = { link = "BufferLineWarning" },
	BufferLineWarningDiagnosticVisible = { link = "BufferLineWarningVisible" },

	-- Error
	BufferLineErrorSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.inputValidation.errorForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineError = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.errorForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineErrorVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.errorForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	BufferLineErrorDiagnosticSelected = { link = "BufferLineErrorSelected" },
	BufferLineErrorDiagnostic = { link = "BufferLineError" },
	BufferLineErrorDiagnosticVisible = { link = "BufferLineErrorVisible" },

	-- Info
	BufferLineInfoSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.inputValidation.infoForeground,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineInfo = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.infoForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineInfoVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.infoForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	BufferLineInfoDiagnosticSelected = { link = "BufferLineInfoSelected" },
	BufferLineInfoDiagnostic = { link = "BufferLineInfo" },
	BufferLineInfoDiagnosticVisible = { link = "BufferLineInfoVisible" },

	-- Hint
	BufferLineHintSelected = { link = "BufferLineInfoSelected" },
	BufferLineHint = { link = "BufferLineInfo" },
	BufferLineHintVisible = { link = "BufferLineInfoVisible" },

	BufferLineHintDiagnosticSelected = { link = "BufferLineHintSelected" },
	BufferLineHintDiagnostic = { link = "BufferLineHint" },
	BufferLineHintDiagnosticVisible = { link = "BufferLineHintVisible" },

	-- Pick
	BufferLinePickSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.base.red,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLinePick = {
		bg = C.tab.inactiveBackground,
		fg = C.base.red,
		style = "bold",
	},
	BufferLinePickVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = C.base.red,
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},

	BufferLineTabClose = {
		bg = C.editorGroupHeader.tabsBackground,
		fg = C.editorGroupHeader.tabsBackground,
	},

	-- indicator
	BufferLineIndicatorSelected = {
		bg = Config.transparent_background and "NONE" or C.tab.activeBackground,
		fg = C.tab.activeBorder,
		sp = C.tab.activeBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
	BufferLineIndicator = {
		bg = C.tab.inactiveBackground,
		fg = C.tab.inactiveBackground,
	},
	BufferLineIndicatorVisible = {
		bg = Config.transparent_background and "NONE" or C.tab.unfocusedActiveBackground,
		fg = C.tab.unfocusedActiveBackground,
		sp = C.tab.unfocusedActiveBorder,
		style = isSelectedUnderlined and "underline" or "NONE",
	},
}

return BufferLine
