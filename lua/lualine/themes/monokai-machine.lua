local colors = require("monokai-pro.themes.monokai-machine")

local monokai_machine = {}

monokai_machine.normal = {
	a = { bg = colors.blue, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.blue },
	c = { bg = colors.black, fg = colors.black },
	x = { bg = colors.black, fg = colors.suggestWidgetForeground },
}

monokai_machine.insert = {
	a = { bg = colors.green, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.green },
}

monokai_machine.command = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.yellow },
}

monokai_machine.visual = {
	a = { bg = colors.magenta, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.magenta },
}

monokai_machine.replace = {
	a = { bg = colors.red, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.red },
}

monokai_machine.inactive = {
	a = { bg = colors.black, fg = colors.blue },
	b = { bg = colors.black, fg = colors.black },
	c = { bg = colors.black, fg = colors.black },
}

return monokai_machine
