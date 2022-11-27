local utils = require("monokai-pro.util")

local normalAlpha = 0.5
local visibleAlpha = 0.5

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
		fg = C.white,
		style = "bold",
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
		style = "bold",
	},

	BufferLineCloseButton = { bg = C.bufferline_background, fg = C.white },
	BufferLineCloseButtonSelected = { bg = C.background, fg = C.yellow },

	BufferLineSeparator = { bg = C.bufferline_background, fg = C.black },
	BufferLineSeparatorSelected = { bg = C.background, fg = C.black },
	BufferLineSeparatorVisible = { bg = C.background, fg = C.black },

	BufferLineIndicatorSelected = { bg = C.background, fg = C.yellow },
	BufferLineModified = { bg = C.bufferline_background, fg = C.lightGray },
	BufferLineModifiedSelected = { bg = C.background, fg = C.white },

	-- Warning
	BufferLineWarning = {
		bg = C.bufferline_background,
		fg = utils.blend(C.yellow, C.bufferline_background, normalAlpha),
	},
	BufferLineWarningVisible = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = utils.blend(C.yellow, C.background, visibleAlpha),
	},
	BufferLineWarningSelected = { bg = C.background, fg = C.yellow, style = "bold" },

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
	BufferLineErrorSelected = { fg = C.red, style = "bold" },

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
	BufferLineHintSelected = { bg = C.background, fg = C.cyan, style = "bold" },

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
	BufferLineInfoSelected = { bg = C.background, fg = C.cyan, style = "bold" },

	BufferLineInfoDiagnostic = { link = "BufferLineInfo" },
	BufferLineInfoDiagnosticVisible = { link = "BufferLineInfoVisible" },
	BufferLineInfoDiagnosticSelected = { link = "BufferLineInfoSelected" },
}

return BufferLine
