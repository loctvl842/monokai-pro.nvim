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
		underline = isSelectedUnderlined,
	},

	BufferLineBufferSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineBackground = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.base.white, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineBufferVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.base.white, C.editor.background, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- Duplicate
	BufferLineDuplicateSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = utils.blend(C.base.white, C.tab.activeBackground, normalAlpha),
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineDuplicate = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.base.white, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineDuplicateVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.base.white, C.tab.unfocusedActiveBackground, normalAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- CloseButton
	BufferLineCloseButtonSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineCloseButton = {
		bg = C.tab.inactiveBackground,
		fg = C.base.white,
	},
	BufferLineCloseButtonVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = C.base.white,
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- separator
	BufferLineSeparatorSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.editorGroupHeader.tabsBackground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineSeparator = {
		bg = C.tab.inactiveBackground,
		fg = C.editorGroupHeader.tabsBackground,
	},
	BufferLineSeparatorVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = C.editorGroupHeader.tabsBackground,
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- Modified
	BufferLineModifiedSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.tab.activeForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineModified = {
		bg = C.tab.inactiveBackground,
		fg = C.base.white,
	},
	BufferLineModifiedVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = C.base.white,
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- Warning
	BufferLineWarningSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.inputValidation.warningForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineWarning = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.warningForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineWarningVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.warningForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	BufferLineWarningDiagnosticSelected = { link = "BufferLineWarningSelected" },
	BufferLineWarningDiagnostic = { link = "BufferLineWarning" },
	BufferLineWarningDiagnosticVisible = { link = "BufferLineWarningVisible" },

	-- Error
	BufferLineErrorSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.inputValidation.errorForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineError = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.errorForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineErrorVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.errorForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	BufferLineErrorDiagnosticSelected = { link = "BufferLineErrorSelected" },
	BufferLineErrorDiagnostic = { link = "BufferLineError" },
	BufferLineErrorDiagnosticVisible = { link = "BufferLineErrorVisible" },

	-- Info
	BufferLineInfoSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.inputValidation.infoForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineInfo = {
		bg = C.tab.inactiveBackground,
		fg = utils.blend(C.inputValidation.infoForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineInfoVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = utils.blend(C.inputValidation.infoForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
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
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.base.red,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLinePick = {
		bg = C.tab.inactiveBackground,
		fg = C.base.red,
		style = "bold",
	},
	BufferLinePickVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = C.base.red,
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	BufferLineTabClose = {
		bg = C.editorGroupHeader.tabsBackground,
		fg = C.editorGroupHeader.tabsBackground,
	},

	-- indicator
	BufferLineIndicatorSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.tab.activeBorder,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineIndicator = {
		bg = C.tab.inactiveBackground,
		fg = C.tab.inactiveBackground,
	},
	BufferLineIndicatorVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = C.tab.unfocusedActiveBackground,
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},
}

return BufferLine
