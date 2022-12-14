local isBackgroundClear = Config.plugins.toggleterm.background_clear
local toggleterm = {
	TermCursor = {
		bg = C.terminalCursor.foreground,
		fg = C.terminalCursor.background,
	}, -- cursor in a focused terminal
	ToggleTerm = {
		bg = isBackgroundClear and C.editor.background or C.terminal.background,
		fg = C.terminal.foreground,
	},
	ToggleTermBorder = {
		bg = C.editor.background,
		fg = isBackgroundClear and C.tab.unfocusedActiveBorder or C.terminal.background,
	},
}

return toggleterm
