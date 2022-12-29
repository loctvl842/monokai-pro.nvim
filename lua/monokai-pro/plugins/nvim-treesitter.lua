local M = {}

M.highlight = {
	["@include"] = { fg = C.base.red },
	["@variable"] = { fg = C.base.white },
	["@punctuation.delimiter"] = { fg = C.editorSuggestWidget.foreground },
	["@punctuation.bracket"] = { fg = C.base.blue },
	["@constructor"] = { fg = C.base.green },
	["@keyword"] = { fg = C.base.cyan, italic = true },
	["@keyword.return"] = { fg = C.base.red },
	["@keyword.operator"] = { fg = C.base.red },
	["@method.call"] = { fg = C.base.green },
	["@property"] = { fg = C.base.white },
	["@function"] = { fg = C.base.green },
	["@operator"] = { fg = C.base.red, bold = true },
	["@constant.builtin"] = { fg = C.base.magenta },
	["@tag"] = { fg = C.base.red },
	["@tag.delimiter"] = { fg = C.sideBar.foreground },
	["@tag.attribute"] = { fg = C.base.cyan },
	["@attribute"] = { fg = C.base.cyan },
	["@conditional"] = { fg = C.base.red },
	["@repeat"] = { fg = C.base.red },
	["@parameter"] = { fg = C.base.blue, italic = true },
	["@keyword.function"] = { fg = C.base.cyan, bold = true, italic = true },
	["@number"] = { fg = C.base.magenta },
	["@boolean"] = { fg = C.base.magenta },
	["@type.qualifier"] = { fg = C.base.red, italic = true },

	-- scss
	["@keyword.scss"] = { fg = C.base.red },
	["@function.scss"] = { fg = C.base.cyan },
	["@property.scss"] = { fg = C.base.green },
	["@string.scss"] = { fg = C.base.blue, italic = true },
	["@number.scss"] = { fg = C.base.magenta },
	["@type.scss"] = { fg = C.base.cyan },

	-- cpp
	["@keyword.cpp"] = { fg = C.base.cyan, italic = true },
	["@namespace.cpp"] = { fg = C.base.white },
	["@operator.cpp"] = { fg = C.base.red },
	["@type.cpp"] = { fg = C.base.blue, italic = true },
	["@variable.cpp"] = { fg = C.base.white },
	["@constant.cpp"] = { fg = C.base.cyan },
	["@constant.macro.cpp"] = { fg = C.base.red },
	["@punctuation.delimiter.cpp"] = { fg = C.sideBar.foreground },

	-- python
	["@type.python"] = { fg = C.base.cyan },
	["@keyword.python"] = { fg = C.base.cyan, italic = true },
	["@variable.builtin.python"] = { fg = C.editorSuggestWidget.foreground, italic = true },
	["@field.python"] = { fg = C.base.white },
	["@variable.python"] = { fg = C.base.white },
	["@constructor.python"] = { fg = C.base.green },
	["@method.python"] = { fg = C.base.green },
	["@function.builtin.python"] = { fg = C.base.cyan, italic = true },
	["@exception.python"] = { fg = C.base.red, italic = true },
	["@constant.python"] = { fg = C.base.magenta },
	["@keyword.function.python"] = { fg = C.base.cyan, italic = true },
	["@operator.python"] = { fg = C.base.red },
	["@varibale.builtin.python"] = { fg = C.base.blue, italic = true },

	-- lua
	["@variable.lua"] = { fg = C.base.white },
	["@function.builtin.lua"] = { fg = C.base.green },
	["@field.lua"] = { fg = C.base.white },
	["@keyword.lua"] = { fg = C.base.red, italic = true },
	["@keyword.function.lua"] = { fg = C.base.red },
	["@conditional.lua"] = { fg = C.base.red },
	["@namespace.lua"] = { fg = C.base.red },
}

return M
