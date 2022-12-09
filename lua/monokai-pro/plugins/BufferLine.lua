local utils = require("monokai-pro.util")

local normalAlpha = 0.6
local visibleAlpha = 0.8

local BufferLine = {
	Offset = { bg = C.black, fg = C.lightGray }, -- Explorer appear in tree setup by bufferline

	BufferLineFill = { bg = C.black },

	BufferLineBackground = {
		bg = C.bufferline_background,
		fg = utils.blend(C.white, C.bufferline_background, normalAlpha),
	},
	BufferLineBufferVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.white, C.background, visibleAlpha),
	},
	BufferLineBufferSelected = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = C.yellow,
		style = "underline",
		sp = C.yellow,
	},

	-- Duplicate
	BufferLineDuplicate = {
		bg = C.bufferline_background,
		fg = utils.blend(C.white, C.bufferline_background, 0.2),
	},
	BufferLineDuplicateVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.white, C.background, 0.3),
	},
	BufferLineDuplicateSelected = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.white, C.background, 0.5),
		style = "underline,bold",
		sp = C.yellow,
	},

	-- CloseButton
	BufferLineCloseButton = {
		bg = C.bufferline_background,
		fg = C.white,
	},
	BufferLineCloseButtonVisible = {
		bg = C.background,
		fg = C.white,
	},
	BufferLineCloseButtonSelected = {
		bg = C.background,
		fg = C.yellow,
		style = "underline",
		sp = C.yellow,
	},

	BufferLineSeparator = {
		bg = C.bufferline_background,
		fg = C.black,
	},
	BufferLineSeparatorVisible = {
		bg = C.background,
		fg = C.black,
	},
	BufferLineSeparatorSelected = {
		bg = C.background,
		fg = C.black,
		style = "underline",
		sp = C.yellow,
	},

	BufferLineModified = {
		bg = C.bufferline_background,
		fg = C.lightGray,
	},
	BufferLineModifiedSelected = {
		bg = C.background,
		fg = C.white,
		style = "underline",
		sp = C.yellow,
	},

	-- Warning
	BufferLineWarning = {
		bg = C.bufferline_background,
		fg = utils.blend(C.blue, C.bufferline_background, normalAlpha),
	},
	BufferLineWarningVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.blue, C.background, visibleAlpha),
	},
	BufferLineWarningSelected = {
		bg = C.background,
		fg = C.blue,
		style = "underline,bold",
		sp = C.yellow,
	},

	BufferLineWarningDiagnostic = { link = "BufferLineWarning" },
	BufferLineWarningDiagnosticVisible = { link = "BufferLineWarningVisible" },
	BufferLineWarningDiagnosticSelected = { link = "BufferLineWarningSelected" },

	-- Error
	BufferLineError = {
		bg = C.bufferline_background,
		fg = utils.blend(C.red, C.bufferline_background, normalAlpha),
	},
	BufferLineErrorVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.red, C.background, visibleAlpha),
	},
	BufferLineErrorSelected = {
		fg = C.red,
		style = "underline,bold",
		sp = C.yellow,
	},

	BufferLineErrorDiagnostic = { link = "BufferLineError" },
	BufferLineErrorDiagnosticVisible = { link = "BufferLineErrorVisible" },
	BufferLineErrorDiagnosticSelected = { link = "BufferLineErrorSelected" },

	-- Hint
	BufferLineHint = {
		bg = C.bufferline_background,
		fg = utils.blend(C.cyan, C.bufferline_background, normalAlpha),
	},
	BufferLineHintVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.cyan, C.background, visibleAlpha),
	},
	BufferLineHintSelected = {
		bg = C.background,
		fg = C.cyan,
		style = "underline,bold",
		sp = C.yellow,
	},

	BufferLineHintDiagnostic = { link = "BufferLineHint" },
	BufferLineHintDiagnosticVisible = { link = "BufferLineHintVisible" },
	BufferLineHintDiagnosticSelected = { link = "BufferLineHintSelected" },

	-- Info
	BufferLineInfo = {
		bg = C.bufferline_background,
		fg = utils.blend(C.cyan, C.bufferline_background, normalAlpha),
	},
	BufferLineInfoVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.cyan, C.background, visibleAlpha),
	},
	BufferLineInfoSelected = {
		bg = C.background,
		fg = C.cyan,
		style = "underline,bold",
		sp = C.yellow,
	},

	BufferLineInfoDiagnostic = { link = "BufferLineInfo" },
	BufferLineInfoDiagnosticVisible = { link = "BufferLineInfoVisible" },
	BufferLineInfoDiagnosticSelected = { link = "BufferLineInfoSelected" },

	BufferLinePick = {
		bg = C.bufferline_background,
		fg = C.red,
		style = "bold",
	},
	BufferLinePickVisible = {
		bg = C.background,
		fg = C.red,
		style = "bold",
	},
	BufferLinePickSelected = {
		bg = C.background,
		fg = C.red,
		style = "underline,bold",
		sp = C.yellow,
	},

	BufferLineTabClose = {
		bg = C.black,
		fg = C.black,
	},

	-- indicator
	BufferLineIndicator = {
		bg = C.bufferline_background,
		fg = C.bufferline_background,
	},
	BufferLineIndicatorVisible = {
		bg = C.background,
		fg = C.background,
	},
	BufferLineIndicatorSelected = {
		bg = C.background,
		fg = C.yellow,
		style = "underline",
		sp = C.yellow,
	},
}

return BufferLine
