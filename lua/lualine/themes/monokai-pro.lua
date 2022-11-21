local colors = {
	blue = "#569cd6",
	green = "#6a9955",
	purple = "#c586c0",
	-- red1 = "#d16969",
	red = "#d16969",
	yellow = "#dcdcaa",
	orange = "#ce9178",
	fg = "#ffffff",
	bg = C.bg,
	gray1 = "#5c6370",
	gray2 = "#2c323d",
	gray3 = "#3e4452",
}
-- LuaFormatter on
return {
	normal = {
		a = { fg = colors.bg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.bg, bg = colors.bg },
		c = { fg = colors.bg, bg = colors.bg },
	},
	insert = { a = { fg = colors.bg, bg = colors.bg, gui = "bold" } },
	visual = { a = { fg = colors.bg, bg = colors.bg, gui = "bold" } },
	command = { a = { fg = colors.bg, bg = colors.bg, gui = "bold" } },
	replace = { a = { fg = colors.bg, bg = colors.bg, gui = "bold" } },
	inactive = {
		a = { fg = colors.bg, bg = colors.bg },
		b = { fg = colors.bg, bg = colors.bg },
		c = { fg = colors.bg, bg = colors.bg },
	},
}
