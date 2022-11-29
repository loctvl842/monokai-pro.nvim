local colors = {
	background = "#2c2525",
	foreground = "#fff1f3",
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
