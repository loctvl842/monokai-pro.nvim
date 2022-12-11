local syntax = {
	Comment = { fg = C.base.lightBlack, style = Config.italic_comments and "italic" or "NONE" }, -- Comments
	Constant = { fg = C.base.magenta }, -- (preferred) any constant
	String = { fg = C.base.yellow }, --   a string constant: "this is a string"
	Character = { fg = C.base.magenta }, -- a character constant: 'c', '\n'
	Number = { fg = C.base.magenta }, -- a number constant: 234, 0xff
	Boolean = { fg = C.base.magenta }, -- a boolean constant: TRUE, false
	Float = { fg = C.base.magenta }, -- a floating point constant: 2.3e10
	Identifier = { fg = C.base.white }, -- (preferred) any variable name
	Function = { fg = C.base.blue }, -- function name (also: methods for classes)
	Statement = { fg = C.base.magenta }, -- (preferred) any statement
	Conditional = { fg = C.base.red }, --  if, then, else, endif, switch, etc
	Repeat = { fg = C.base.red }, -- for, do, while, etc
	Label = { fg = C.base.red }, -- case, default, etc
	Operator = { fg = C.base.red }, -- "sizeof", "+", "*", etc
	Keyword = { fg = C.base.red, style = "italic" }, -- any other keyword
	Exception = { fg = C.base.red }, -- try, catch, throw
	PreProc = { fg = C.base.yellow }, -- (preferred) generic Preprocessor
	Include = { fg = C.base.red }, -- preprocessor #include
	Define = { fg = C.base.red }, -- preprocessor #define
	Macro = { fg = C.base.red }, -- same as Define
	PreCondit = { fg = C.base.red }, -- preprocessor #if, #else, #endif, etc
	Type = { fg = C.base.cyan, style = "italic" }, -- (preferred) int, long, char, etc
	StorageClass = { fg = C.base.red, style = "italic" }, -- static, register, volatile, etc
	Structure = { fg = C.base.cyan, style = "italic" }, -- struct, union, enum, etc
	Typedef = { fg = C.base.red }, -- A typedef
	Special = { fg = C.base.blue }, -- (preferred) any special symbol
	SpecialChar = { fg = C.base.blue }, -- special character in a constant
	-- Tag = {}, -- you can use CTRL-] on this
	Delimiter = { fg = C.base.white }, -- character that needs attention
	SpecialComment = { fg = C.base.lightBlack }, -- special things inside a comment
	-- Debug = {}, -- debugging statements
	Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
	Bold = { style = "bold" },
	-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
	Italic = { style = "italic" },
	Error = { fg = C.inputValidation.errorForeground }, -- (preferred) any erroneous construct
	Todo = { bg = Config.transparent_background and "None" or C.editor.background, fg = C.base.magenta, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
}
return syntax
