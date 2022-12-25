local whichkeyBackgroundClear = Config.plugins.whichkey.background_clear

local Whichkey = {
	WhichKey = { fg = C.base.blue },
	WhichKeySeperator = { fg = C.base.red },
	WhichKeyGroup = { fg = C.base.magenta },
	WhichKeyDesc = { fg = C.base.yellow },
	WhichKeyFloat = whichkeyBackgroundClear and {
		bg = C.editor.background,
		fg = C.editorSuggestWidget.border,
	} or {
		bg = C.editorHoverWidget.background,
	},
}

return Whichkey
