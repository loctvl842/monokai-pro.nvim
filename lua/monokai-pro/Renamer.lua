local Renamer = {
	RenamerNormal = { fg = C.white, bg = C.float_bg },
	RenamerBorder = { fg = C.float_bg, bg = Config.transparent_background and "NONE" or C.bg },
	RenamerTitle = { bg = C.yellow, fg = C.black, style = "bold" },
}

return Renamer
