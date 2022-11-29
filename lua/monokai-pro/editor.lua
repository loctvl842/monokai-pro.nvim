local editor = {
	ColorColumn = { bg = C.background }, -- used for the columns set with 'colorcolumn'
	-- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { bg = C.red, fg = C.red }, -- character under the cursor
	-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM     = {bg = theme.palette.red}, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = { bg = C.background }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	CursorLine = { bg = C.lineHighlightBackground }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	CursorLineNr = { bg = C.background, fg = C.lineNumberActiveForeground }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	-- CursorLineNrNC = { bg = C.bg, fg = C.lightGray }, -- CursorLineNr for inactive windows
	-- Directory = { fg = C.blue }, -- directory names (and other special names in listings)
	-- DiffAdd = { bg = C.diff_add }, -- diff mode: Added line |diff.txt|
	-- DiffChange = { }, -- diff mode: Changed line |diff.txt|
	-- DiffDelete = { bg = C.diff_delete },
	-- DiffText = { bg = C.diff_text }, -- diff mode: Changed text within a changed line |diff.txt|
	EndOfBuffer = { fg = C.background }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	ErrorMsg = { bg = C.background, fg = C.red }, -- error messages on the command line
	VertSplit = { bg = Config.transparent_background and "NONE" or C.background, fg = C.black }, -- the column separating vertically split windows
	Folded = { bg = C.foldBackground }, -- line used for closed folds
	FoldColumn = { bg = Config.transparent_background and "NONE" or C.background, fg = C.lightGray }, -- 'foldcolumn'
	SignColumn = { bg = Config.transparent_background and "NONE" or C.background }, -- column where |signs| are displayed
	-- Substitute = { bg = C.yellow, fg = C.bg }, -- |:substitute| replacement text highlighting
	LineNr = { bg = Config.transparent_background and "NONE" or C.background, fg = C.lineNumberForeground }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	MatchParen = { fg = C.black, bg = C.blue }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
	MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = C.yellow }, -- |more-prompt| ufo
	NonText = { fg = C.background }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|. Example the character space between words
	Normal = { bg = Config.transparent_background and "NONE" or C.background, fg = C.white }, -- normal text
	NormalNC = { bg = Config.transparent_background and "NONE" or C.background, fg = C.white },
	NormalFloat = { bg = C.hoverWidgetBackground }, -- Normal text in floating windows. example PackerNormal
	FloatBorder = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = C.hoverWidgetBackground,
	},
	Pmenu = { bg = C.suggestWidgetBackground, fg = C.suggestWidgetForeground }, -- Popup menu: normal item.
	PmenuSel = { bg = C.suggestWidgetSelectedBackground },
	PmenuSbar = { bg = C.hoverWidgetBackground }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = C.scrollbarSliderBackground },
	-- Question = { bg = Config.transparent_background and "NONE" or C.bg, fg = C.gray }, -- |hit-enter| prompt and yes/no questions
	-- QuickFixLine = { bg = C.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	-- QuickFixLineNC = { bg = C.bg }, -- QuickFixLine, for inactive windows
	Search = { bg = C.findMatchHighlightBackground, fg = C.lightWhite }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
	-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
	IncSearch = { bg = C.white, fg = C.findMatchBackground }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	-- StatusLine = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg, style = "bold" }, -- status line of current window
	-- StatusLineNC = {
	--     bg = config.options.transparency and "NONE"
	--         or config.options.window_unfocused_color and theme.generated.color_column
	--         or theme.palette.bg,
	--     fg = theme.palette.fg,
	-- }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	-- TabLine = { bg = config.options.transparency and "NONE" or theme.palette.bg }, -- tab pages line, not active tab page label
	-- TabLineFill = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg }, -- tab pages line, where there are no labels
	-- TabLineSel = { bg = theme.palette.purple, fg = theme.palette.bg }, -- tab pages line, active tab page label
	TermCursor = { fg = "#44c9ad" }, -- cursor in a focused terminal
	-- TermCursorNC = { bg = C.gray }, -- cursor in an unfocused terminal
	Title = { fg = C.yellow }, -- titles for output from ":set all", ":autocmd"
	Visual = { bg = C.selectionBackground }, -- Visual mode selection
	VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
	WarningMsg = { fg = C.yellow }, -- warning messages
	WinBar = {
		bg = Config.transparent_background and "NONE" or C.background,
		fg = C.breadcrumbForeground,
		style = "NONE",
	},
	WinSeparator = { bg = Config.transparent_background and "NONE" or C.background, fg = C.black }, -- the column separating windows
	Whitespace = { fg = C.background }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	-- WildMenu = { bg = C.blue, fg = C.black }, -- current match in 'wildmenu' completion

	-- Git
	diffAdded = { fg = C.green },
	diffChanged = { fg = C.yellow },
	diffRemoved = { fg = C.red },
	diffFile = { fg = C.yellow },
	diffNewFile = { fg = C.yellow },
	diffLine = { fg = C.lightCyan },

	-- Spelling
	SpellBad = { fg = C.red, sp = C.red, style = "undercurl" },
	SpellCap = { fg = C.red, sp = C.red, style = "undercurl" },
	SpellLocal = { fg = C.red, sp = C.red, style = "undercurl" },
	SpellRare = { fg = C.red, sp = C.red, style = "undercurl" },

	-- syntax
	Comment = { fg = C.lightBlack, style = Config.italic_comments and "italic" or "NONE" }, -- Comments
	Constant = { fg = C.magenta }, -- (preferred) any constant
	String = { fg = C.yellow }, --   a string constant: "this is a string"
	Character = { fg = C.magenta }, -- a character constant: 'c', '\n'
	Number = { fg = C.magenta }, -- a number constant: 234, 0xff
	Boolean = { fg = C.magenta }, -- a boolean constant: TRUE, false
	Float = { fg = C.magenta }, -- a floating point constant: 2.3e10
	Identifier = { fg = C.white }, -- (preferred) any variable name
	Function = { fg = C.blue }, -- function name (also: methods for classes)
	Statement = { fg = C.magenta }, -- (preferred) any statement
	Conditional = { fg = C.red }, --  if, then, else, endif, switch, etc
	Repeat = { fg = C.red }, -- for, do, while, etc
	Label = { fg = C.red }, -- case, default, etc
	Operator = { fg = C.red }, -- "sizeof", "+", "*", etc
	Keyword = { fg = C.red, style = "italic" }, -- any other keyword
	Exception = { fg = C.red }, -- try, catch, throw
	PreProc = { fg = C.yellow }, -- (preferred) generic Preprocessor
	Include = { fg = C.red }, -- preprocessor #include
	Define = { fg = C.red }, -- preprocessor #define
	Macro = { fg = C.red }, -- same as Define
	PreCondit = { fg = C.red }, -- preprocessor #if, #else, #endif, etc
	Type = { fg = C.cyan, style = "italic" }, -- (preferred) int, long, char, etc
	StorageClass = { fg = C.red, style = "italic" }, -- static, register, volatile, etc
	Structure = { fg = C.cyan, style = "italic" }, -- struct, union, enum, etc
	Typedef = { fg = C.red }, -- A typedef
	Special = { fg = C.blue }, -- (preferred) any special symbol
	SpecialChar = { fg = C.blue }, -- special character in a constant
	-- Tag = {}, -- you can use CTRL-] on this
	Delimiter = { fg = C.white }, -- character that needs attention
	SpecialComment = { fg = C.lightBlack }, -- special things inside a comment
	-- Debug = {}, -- debugging statements
	Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
	Bold = { style = "bold" },
	-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
	Italic = { style = "italic" },
	Error = { fg = C.red }, -- (preferred) any erroneous construct
	Todo = { bg = Config.transparent_background and "None" or C.background, fg = C.magenta, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
}

return editor
