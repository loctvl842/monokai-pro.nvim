local filter = require("monokai-pro.config").options.filter
local colors = require("monokai-pro.colorscheme").setup(filter)

local monokai_pro = {}

monokai_pro.normal = {
	left = {
		{ colors.base.black, colors.base.yellow },
		{ colors.base.yellow, colors.editorSuggestWidget.background },
	},
	middle = { { colors.base.black, colors.base.black } },
	right = {
		{ colors.base.black, colors.base.yellow },
		{ colors.base.yellow, colors.editorSuggestWidget.background },
	},
	error = { { colors.base.black, colors.base.red } },
	warning = { { colors.base.black, colors.base.blue } },
}

monokai_pro.insert = {
	left = {
		{ colors.base.black, colors.base.green },
		{ colors.base.green, colors.editorSuggestWidget.background },
	},
}

monokai_pro.visual = {
	left = {
		{ colors.base.black, colors.base.magenta },
		{ colors.base.magenta, colors.editorSuggestWidget.background },
	},
}

monokai_pro.replace = {
	left = {
		{ colors.base.black, colors.base.red },
		{ colors.base.red, colors.editorSuggestWidget.background },
	},
}

monokai_pro.inactive = {
	left = {
		{ colors.base.yellow, colors.base.black },
		{ colors.base.black, colors.base.black },
	},
	middle = {
		{ colors.base.black, colors.base.black },
	},
}

package.loaded["colors"] = nil

return monokai_pro
