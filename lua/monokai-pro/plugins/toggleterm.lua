local toggleterm = {
	TermCursor = {
		bg = C.terminalCursor.background,
		fg = C.terminalCursor.foreground,
	}, -- cursor in a focused terminal
	ToggleTerm = {
		bg = C.terminal.background,
		fg = C.terminal.foreground,
	},
	ToggleTermBorder = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.terminal.background,
	},
}

return toggleterm
