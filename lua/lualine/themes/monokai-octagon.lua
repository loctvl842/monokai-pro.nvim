local colors = {
	background = "#282a3a",
	foreground = "#eaf2f1",
}
-- LuaFormatter on
return {
	normal = {
		a = { fg = colors.background, bg = colors.background, gui = "bold" },
		b = { fg = colors.background, bg = colors.background },
		c = { fg = colors.background, bg = colors.background },
	},
	insert = { a = { fg = colors.background, bg = colors.background, gui = "bold" } },
	visual = { a = { fg = colors.background, bg = colors.background, gui = "bold" } },
	command = { a = { fg = colors.background, bg = colors.background, gui = "bold" } },
	replace = { a = { fg = colors.background, bg = colors.background, gui = "bold" } },
	inactive = {
		a = { fg = colors.background, bg = colors.background },
		b = { fg = colors.background, bg = colors.background },
		c = { fg = colors.background, bg = colors.background },
	},
}
