local util = require("monokai-pro.util")

local normalAlpha = 0.6
local visibleAlpha = 0.8
local duplicateAlpha = 0.8
local countAlpha = 0.75
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
		fg = util.blend(C.base.white, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineBufferVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.base.white, C.editor.background, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},

	-- Duplicate
	BufferLineDuplicateSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = util.blend(C.base.white, C.tab.activeBackground, duplicateAlpha),
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineDuplicate = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.base.white, C.tab.inactiveBackground, normalAlpha * duplicateAlpha),
	},
	BufferLineDuplicateVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.base.white, C.tab.unfocusedActiveBackground, visibleAlpha * duplicateAlpha),
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
		fg = util.blend(C.inputValidation.warningForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineWarningVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.inputValidation.warningForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},
	-- Warning count
	BufferLineWarningDiagnosticSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = util.blend(C.inputValidation.warningForeground, C.editor.background, countAlpha),
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},
	BufferLineWarningDiagnostic = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.inputValidation.warningForeground, C.tab.inactiveBackground, normalAlpha * countAlpha),
		bold = true,
	},
	BufferLineWarningDiagnosticVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(
			C.inputValidation.warningForeground,
			C.tab.unfocusedActiveBackground,
			visibleAlpha * countAlpha
		),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},

	-- Error
	BufferLineErrorSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.inputValidation.errorForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineError = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.inputValidation.errorForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineErrorVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.inputValidation.errorForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},
	-- Error count
	BufferLineErrorDiagnosticSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = util.blend(C.inputValidation.errorForeground, C.editor.background, countAlpha),
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},
	BufferLineErrorDiagnostic = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.inputValidation.errorForeground, C.tab.inactiveBackground, normalAlpha * countAlpha),
		bold = true,
	},
	BufferLineErrorDiagnosticVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.inputValidation.errorForeground, C.tab.unfocusedActiveBackground, visibleAlpha * countAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},

	-- Info
	BufferLineInfoSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = C.inputValidation.infoForeground,
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
	},
	BufferLineInfo = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.inputValidation.infoForeground, C.tab.inactiveBackground, normalAlpha),
	},
	BufferLineInfoVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.inputValidation.infoForeground, C.tab.unfocusedActiveBackground, visibleAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
	},
	-- Info count
	BufferLineInfoDiagnosticSelected = {
		bg = Config.transparent_background and nil or C.tab.activeBackground,
		fg = util.blend(C.inputValidation.infoForeground, C.editor.background, countAlpha),
		sp = C.tab.activeBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},
	BufferLineInfoDiagnostic = {
		bg = C.tab.inactiveBackground,
		fg = util.blend(C.inputValidation.infoForeground, C.tab.inactiveBackground, normalAlpha * countAlpha),
		bold = true,
	},
	BufferLineInfoDiagnosticVisible = {
		bg = Config.transparent_background and nil or C.tab.unfocusedActiveBackground,
		fg = util.blend(C.inputValidation.infoForeground, C.tab.unfocusedActiveBackground, visibleAlpha * countAlpha),
		sp = C.tab.unfocusedActiveBorder,
		underline = isSelectedUnderlined,
		bold = true,
	},

	-- Hint
	BufferLineHintSelected = { link = "BufferLineInfoSelected" },
	BufferLineHint = { link = "BufferLineInfo" },
	BufferLineHintVisible = { link = "BufferLineInfoVisible" },
	-- Hint count
	BufferLineHintDiagnosticSelected = { link = "BufferLineInfoDiagnosticSelected" },
	BufferLineHintDiagnostic = { link = "BufferLineInfoDiagnostic" },
	BufferLineHintDiagnosticVisible = { link = "BufferLineInfoDiagnosticVisible" },

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
		bold = true,
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

for _, v in pairs(BufferLine) do
	v["bold"] = true
end

return BufferLine
