local filter = vim.g.monokai_pro_filter
local colors = require("monokai-pro.themes.monokai-" .. filter)

local monokai_pro = {}

monokai_pro.normal = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.yellow },
	c = { bg = colors.black, fg = colors.black },
	x = { bg = colors.black, fg = colors.suggestWidgetForeground },
}

monokai_pro.insert = {
	a = { bg = colors.green, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.green },
}

monokai_pro.command = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.yellow },
}

monokai_pro.visual = {
	a = { bg = colors.magenta, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.magenta },
}

monokai_pro.replace = {
	a = { bg = colors.red, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.red },
}

monokai_pro.inactive = {
	a = { bg = colors.black, fg = colors.yellow },
	b = { bg = colors.black, fg = colors.black },
	c = { bg = colors.black, fg = colors.black },
}

return monokai_pro
