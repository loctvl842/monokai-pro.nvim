local ufo = {
	UfoFoldedBg = { bg = C.editor.background },
	FoldColumn = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.button.foreground,
	}, -- 'foldcolumn'
}
return ufo
