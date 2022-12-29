local M = {}

local whichkeyBackgroundClear = Config.plugins.whichkey.background_clear

M.highlight = {
	WhichKey = { fg = C.base.blue },
	WhichKeySeperator = { fg = C.base.red },
	WhichKeyGroup = { fg = C.base.magenta },
	WhichKeyDesc = { fg = C.base.yellow },
	WhichKeyFloat = whichkeyBackgroundClear and {
		bg = C.editor.background,
		fg = C.editorSuggestWidget.foreground,
	} or {
		bg = C.editorHoverWidget.background,
	},
}

return M
