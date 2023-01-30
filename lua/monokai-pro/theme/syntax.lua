local M = {}

M.setup = function(c, config, util)
	return {
		Comment = { fg = c.base.dimmed3, italic = config.italic_comments }, -- Comments
		Constant = { fg = c.base.magenta }, -- (preferred) any constant
		String = { fg = c.base.yellow }, --   a string constant: "this is a string"
		Character = { fg = c.base.magenta }, -- a character constant: 'c', '\n'
		Number = { fg = c.base.magenta }, -- a number constant: 234, 0xff
		Boolean = { fg = c.base.magenta }, -- a boolean constant: TRUE, false
		Float = { fg = c.base.magenta }, -- a floating point constant: 2.3e10
		Identifier = { fg = c.base.white }, -- (preferred) any variable name
		Function = { fg = c.base.blue }, -- function name (also: methods for classes)
		Statement = { fg = c.base.magenta }, -- (preferred) any statement
		Conditional = { fg = c.base.red }, --  if, then, else, endif, switch, etc
		Repeat = { fg = c.base.red }, -- for, do, while, etc
		Label = { fg = c.base.red }, -- case, default, etc
		Operator = { fg = c.base.red }, -- "sizeof", "+", "*", etc
		Keyword = { fg = c.base.red, italic = true }, -- any other keyword
		Exception = { fg = c.base.red }, -- try, catch, throw
		PreProc = { fg = c.base.yellow }, -- (preferred) generic Preprocessor
		Include = { fg = c.base.red }, -- preprocessor #include
		Define = { fg = c.base.red }, -- preprocessor #define
		Macro = { fg = c.base.red }, -- same as Define
		PreCondit = { fg = c.base.red }, -- preprocessor #if, #else, #endif, etc
		Type = { fg = c.base.cyan, italic = true }, -- (preferred) int, long, char, etc
		StorageClass = { fg = c.base.red, italic = true }, -- static, register, volatile, etc
		Structure = { fg = c.base.cyan, italic = true }, -- struct, union, enum, etc
		Typedef = { fg = c.base.red }, -- A typedef
		Special = { fg = c.base.blue }, -- (preferred) any special symbol
		SpecialChar = { fg = c.base.blue }, -- special character in a constant
		-- Tag = {}, -- you can use CTRL-] on this
		Delimiter = { fg = c.base.white }, -- character that needs attention
		SpecialComment = { fg = c.base.dimmed3 }, -- special things inside a comment
		-- Debug = {}, -- debugging statements
		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
		Italic = { italic = true },
		Error = { fg = c.inputValidation.errorForeground }, -- (preferred) any erroneous construct
		Todo = {
			bg = config.transparent_background and "NONE" or c.editor.background,
			fg = c.base.magenta,
			bold = true,
		}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	}
end

return M
