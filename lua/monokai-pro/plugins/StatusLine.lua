local StatusLine = {
	StatusLine = { fg = C.black, bg = C.lightBlack },
	StatusLineNC = { fg = C.black, bg = C.lightBlack },
	StatusLineSeparator = { fg = C.black },
	StatusLineTerm = { fg = C.black },
	StatusLineTermNC = { fg = C.black },
	SLGitIcon = { fg = C.lightGray, bg = C.lualine_floatbg },
	SLBranchName = { fg = C.lightGray, bg = C.lualine_floatbg },
	SLSeparator = { fg = C.lualine_floatbg, bg = C.background },
	SLError = { fg = C.red, bg = C.background },
	SLWarning = { fg = C.yellow, bg = C.background },
	SLPosition = { fg = C.magenta, bg = C.lualine_floatbg },
	SLShiftWidth = { fg = C.yellow, bg = C.lualine_floatbg },
	SLEncoding = { fg = C.green, bg = C.lualine_floatbg },
	SLFiletype = { fg = C.cyan, bg = C.lualine_floatbg },
	SLMode = { fg = C.yellow, bg = C.background },
	SLSeparatorUnused = { fg = C.background, bg = C.lualine_floatbg },
	SLPadding = { fg = C.background, bg = C.background },
}

return StatusLine
