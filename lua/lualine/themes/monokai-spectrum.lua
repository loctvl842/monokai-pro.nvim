local colors = require("monokai-pro.themes.monokai-spectrum")

local monokai_spectrum = {}

monokai_spectrum.normal = {
	a = { bg = colors.blue, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.blue },
	c = { bg = colors.black, fg = colors.black },
	x = { bg = colors.black, fg = colors.suggestWidgetForeground },
}

monokai_spectrum.insert = {
	a = { bg = colors.green, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.green },
}

monokai_spectrum.command = {
	a = { bg = colors.yellow, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.yellow },
}

monokai_spectrum.visual = {
	a = { bg = colors.magenta, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.magenta },
}

monokai_spectrum.replace = {
	a = { bg = colors.red, fg = colors.black },
	b = { bg = colors.suggestWidgetBackground, fg = colors.red },
}

monokai_spectrum.inactive = {
	a = { bg = colors.black, fg = colors.blue },
	b = { bg = colors.black, fg = colors.black },
	c = { bg = colors.black, fg = colors.black },
}

return monokai_spectrum
