local toggleterm = {
	ToggleTerm = { bg = C.bg, fg = C.foreground },
	ToggleTermBorder = { bg = Config.transparent_background and "NONE" or C.background, fg = C.lineNumberForeground},
}

return toggleterm
