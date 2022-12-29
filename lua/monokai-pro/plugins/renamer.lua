local M = {}

local renamerBackgroundClear = Config.plugins.renamer.background_clear
M.highlight = {
	RenamerNormal = {
		bg = renamerBackgroundClear and C.editor.background or C.editorHoverWidget.background,
		fg = C.editorHoverWidget.foreground,
	},
	RenamerBorder = {
		bg = C.editor.background,
		fg = renamerBackgroundClear and C.editorSuggestWidget.foreground or C.editorSuggestWidget.background,
	},
	RenamerTitle = renamerBackgroundClear and {
		fg = C.base.yellow,
		bold = true,
	} or {
		bg = C.base.yellow,
		fg = C.base.black,
		bold = true,
	},
}

return M
