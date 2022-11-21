local StatusLine = {
	StatusLine = { fg = C.black, bg = C.lightBlack },
	StatusLineNC = { fg = C.black, bg = C.lightBlack },
	StatusLineSeparator = { fg = C.black },
	StatusLineTerm = { fg = C.black },
	StatusLineTermNC = { fg = C.black },
	SLGitIcon = { fg = C.lightGray, bg = C.lualine_floatbg },
	SLBranchName = { fg = C.lightGray, bg = C.lualine_floatbg },
	SLSeparator = { fg = C.lualine_floatbg, bg = C.bg },
	SLError = { fg = C.red, bg = C.bg },
	SLWarning = { fg = C.orange, bg = C.bg },
	SLPosition = { fg = C.magenta, bg = C.lualine_floatbg },
	SLShiftWidth = { fg = C.orange, bg = C.lualine_floatbg },
	SLEncoding = { fg = C.green, bg = C.lualine_floatbg },
	SLFiletype = { fg = C.cyan, bg = C.lualine_floatbg },
	SLMode = { fg = C.yellow, bg = C.bg },
	SLSeparatorUnused = { fg = C.bg, bg = C.lualine_floatbg },
	SLPadding = { fg = C.bg, bg = C.bg },
}

return StatusLine
