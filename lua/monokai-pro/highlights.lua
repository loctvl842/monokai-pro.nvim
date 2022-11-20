local highlights = {
	ColorColumn = { bg = C.color_column }, -- used for the columns set with 'colorcolumn'
	Cursor = { bg = C.red, fg = C.red }, -- character under the cursor
	-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM     = {bg = theme.palette.red}, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = { bg = C.bg }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	CursorLineNr = {
		bg = C.bg,
		fg = C.lightGray,
	}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	-- CursorLineNrNC = { bg = C.bg, fg = C.lightGray }, -- CursorLineNr for inactive windows
	-- Directory = { fg = C.blue }, -- directory names (and other special names in listings)
	-- DiffAdd = { bg = C.diff_add }, -- diff mode: Added line |diff.txt|
	-- DiffChange = { }, -- diff mode: Changed line |diff.txt|
	-- DiffDelete = { bg = C.diff_delete },
	-- DiffText = { bg = C.diff_text }, -- diff mode: Changed text within a changed line |diff.txt|
	EndOfBuffer = { fg = C.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	ErrorMsg = { bg = C.bg, fg = C.red }, -- error messages on the command line
	VertSplit = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.black }, -- the column separating vertically split windows
	Folded = { bg = C.folded }, -- line used for closed folds
	FoldColumn = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.lightGray }, -- 'foldcolumn'
	SignColumn = { bg = Config.transparent_background and "NONE" or C.bg }, -- column where |signs| are displayed
	-- Substitute = { bg = C.yellow, fg = C.bg }, -- |:substitute| replacement text highlighting
	LineNr = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	MatchParen = { fg = C.black, bg = C.lightCyan }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	-- ModeMsg = { fg = C.white, bg = C.bg }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { fg = C.white, bg = C.bg }, -- Area for messages and cmdline
	MsgSeparator = { fg = C.white, bg = C.bg }, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = C.green }, -- |more-prompt|
	NonText = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	Normal = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.fg }, -- normal text
	NormalNC = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.fg },
	NormalFloat = { bg = Config.transparent_background and "NONE" or C.float_bg }, -- Normal text in floating windows. example PackerNormal
	FloatBorder = {
		bg = Config.transparent_background and "NONE" or C.float_bg,
		fg = C.float_bg,
	},

	CursorLine = { bg = C.cursorLine },
  Pmenu = { bg = C.float_bg }, -- Popup menu: normal item.
	PmenuSel = { bg = C.lightBlack },

	PmenuThumb = { bg = C.base0F },
	Visual = { bg = C.base04 },
	Offset = { fg = C.base1C, bg = C.base03 },
	illuminatedWord = { bg = C.base07 },
	TermBorder = { fg = C.base13, bg = C.base00 },
	TermNormal = { bg = C.base00 },
	InlayHint = { fg = C.base0A, style = "italic" },

	SpellBad = { fg = C.base0D, style = "underline" },
	SpellCap = { fg = C.base18, style = "underline" },
	SpellLocal = { fg = C.base14, style = "underline" },
	SpellRare = { fg = C.base10, style = "underline" },
	WildMenu = { fg = C.base1F, bg = C.base0A },
	Comment = { fg = C.base0E, style = "italic" },
	WhiteEspace = { fg = C.base00 },
	VisualNOS = { bg = C.base03 },
	WarningMsg = { fg = C.base0D, bg = C.base00 },
	DiffChange = { fg = C.base03, bg = C.base11, style = "underline" },
	QuickFixLine = { bg = C.base0A },
	PmenuSbar = { bg = C.base03 },
	MatchWord = { style = "underline" },
	MatchWordCur = { style = "underline" },
	MatchParenCur = { style = "underline" },
	TermCursor = { fg = C.base19, bg = C.base08 },
	TermCursorNC = { fg = C.base08, bg = C.base08 },
	Conceal = { fg = C.base1C },
	SpecialKey = { fg = C.base19, style = "bold" },
	Title = { fg = C.base19, style = "bold" },
	Search = { fg = C.base1E, bg = "#603113" },
	IncSearch = { fg = "#603113", bg = C.base1E },
	Question = { fg = C.base12 },
	Variable = { fg = C.base19 },
	String = { fg = C.base12 },
	Character = { fg = C.base12 },
	Constant = { fg = C.base16 },
	Number = { fg = C.base15 },
	Boolean = { fg = C.base19 },
	Float = { fg = C.base05 },
	Identifier = { fg = C.base19 },
	Function = { fg = C.base18 },
	Operator = { fg = C.base1F },
	Type = { fg = C.base19 },
	StorageClass = { fg = C.base19 },
	Structure = { fg = C.base19 },
	Typedef = { fg = C.base19 },
	Keyword = { fg = C.base19 },
	Statement = { fg = C.base10 },
	Conditional = { fg = C.base19 },
	Repeat = { fg = C.base10 },
	Label = { fg = C.base10 },
	Exception = { fg = C.base10 },
	Include = { fg = C.base10 },
	PreProc = { fg = C.base10 },
	Define = { fg = C.base10 },
	Macro = { fg = C.base10 },
	PreCondit = { fg = C.base10 },
	Special = { fg = C.base12 },
	SpecialChar = { fg = C.base1E },
	Tag = { fg = C.base19 },
	Debug = { fg = C.base0D },
	Delimiter = { fg = C.base0E },
	SpecialComment = { fg = C.base0E, style = "italic" },
	Underlined = { style = "underline" },
	Bold = { style = "bold" },
	Italic = { style = "italic" },
	Ignore = { fg = C.base19, bg = C.base00, style = "bold" },
	Todo = { fg = "#D16D9E", bg = C.base00, style = "bold" },
	Error = { fg = C.base0D, bg = C.base00, style = "bold" },
	TabLine = { fg = C.base1E, bg = C.base03 },
	TabLineSel = { fg = C.base1E, bg = C.base03 },
	TabLineFill = { fg = C.base03, bg = C.base03 },
}

return highlights
