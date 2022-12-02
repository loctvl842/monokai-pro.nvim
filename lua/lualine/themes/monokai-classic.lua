local colors = require("monokai-pro.themes.monokai-classic")

local monokai_classic = {}

monokai_classic.normal = {
	a = { bg = colors.blue, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.blue },
	c = { bg = colors.black, fg = colors.black },
	x = { bg = colors.black, fg = colors.suggestWidgetForeground },
}

monokai_classic.insert = {
	a = { bg = colors.green, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.green },
}

monokai_classic.command = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.yellow },
}

monokai_classic.visual = {
	a = { bg = colors.magenta, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.magenta },
}

monokai_classic.replace = {
	a = { bg = colors.red, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.red },
}

monokai_classic.inactive = {
	a = { bg = colors.black, fg = colors.blue },
	b = { bg = colors.black, fg = colors.black },
	c = { bg = colors.black, fg = colors.black },
}

return monokai_classic
