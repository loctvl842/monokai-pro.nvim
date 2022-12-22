local util = require("monokai-pro.util")

local editor = {
	ColorColumn = {
		bg = C.editor.background,
	}, -- used for the columns set with 'colorcolumn'
	-- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = {
		bg = C.base.white,
		fg = C.base.white,
	}, -- character under the cursor
	-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM     = {bg = theme.palette.red}, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = {
		bg = C.editor.background,
	}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	CursorLine = {
		bg = C.editor.lineHighlightBackground,
	}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	CursorLineNr = {
		bg = C.editor.background,
		fg = C.editorLineNumber.activeForeground,
	}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	-- CursorLineNrNC = { bg = C.bg, fg = C.lightGray }, -- CursorLineNr for inactive windows
	-- Directory = { fg = C.blue }, -- directory names (and other special names in listings)
	DiffAdd = { bg = C.editor.background, fg = C.gitDecoration.addedResourceForeground }, -- diff mode: Added line |diff.txt|
	DiffChange = { bg = C.editor.background, fg = C.gitDecoration.modifiedResourceForeground }, -- diff mode: Changed line |diff.txt|
	DiffDelete = { bg = C.editor.background, fg = C.gitDecoration.deletedResourceForeground },
	DiffText = { bg = C.editor.background, fg = C.editor.foreground }, -- diff mode: Changed text within a changed line |diff.txt|
	EndOfBuffer = {
		fg = C.editor.background,
	}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	ErrorMsg = {
		bg = C.editor.background,
		fg = C.inputValidation.errorForeground,
	}, -- error messages on the command line
	VertSplit = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.base.black,
	}, -- the column separating vertically split windows
	Folded = {
		bg = C.editor.foldBackground,
	}, -- line used for closed folds
	FoldColumn = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.button.foreground,
	}, -- 'foldcolumn'
	SignColumn = {
		bg = Config.transparent_background and nil or C.editor.background,
	}, -- column where |signs| are displayed
	-- Substitute = { bg = C.yellow, fg = C.bg }, -- |:substitute| replacement text highlighting
	LineNr = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editorLineNumber.foreground,
	}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	MatchParen = {
		bg = util.blend(C.base.blue, C.editor.background, 0.7),
		fg = C.base.black,
	}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = {
		link = "Normal",
	}, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = {
		link = "ModeMsg",
	}, -- Area for messages and cmdline
	MsgSeparator = {
		link = "ModeMsg",
	}, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = {
		fg = C.base.yellow,
	}, -- |more-prompt| ufo
	NonText = {
		fg = C.editor.background,
	}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|. Example the character space between words
	Normal = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editor.foreground,
	}, -- normal text
	NormalNC = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editor.foreground,
	},
	NormalFloat = {
		bg = C.editorHoverWidget.background,
	}, -- Normal text in floating windows. example PackerNormal
	FloatBorder = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.editorHoverWidget.background,
	},
	Pmenu = {
		bg = C.editorSuggestWidget.background,
		fg = C.editorSuggestWidget.foreground,
	}, -- Popup menu: normal item.
	PmenuSel = {
		bg = C.editorSuggestWidget.selectedBackground,
	},
	PmenuSbar = {
		bg = C.editorSuggestWidget.background,
	}, -- Popup menu: scrollbar.
	PmenuThumb = {
		bg = C.scrollbarSlider.hoverBackground,
		bg_base = C.editorSuggestWidget.background,
	},
	-- Question = { bg = Config.transparent_background and nil or C.bg, fg = C.gray }, -- |hit-enter| prompt and yes/no questions
	-- QuickFixLine = { bg = C.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	-- QuickFixLineNC = { bg = C.bg }, -- QuickFixLine, for inactive windows
	Search = {
		bg = C.editor.findMatchHighlightBackground,
		fg = nil, -- should set to NONE to use treesitter color
	}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
	-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
	IncSearch = Config.inc_search == "underline" and {
		bg = C.editor.findMatchBackground,
		sp = C.editor.findMatchBorder,
		underline = true,
	} or {
		bg = C.base.yellow,
		fg = C.editor.background,
		underline = false,
	}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	-- StatusLine = { bg = config.options.transparency and nil or theme.palette.bg, fg = theme.palette.fg, style = "bold" }, -- status line of current window
	-- StatusLineNC = {
	--     bg = config.options.transparency andnil
	--         or config.options.window_unfocused_color and theme.generated.color_column
	--         or theme.palette.bg,
	--     fg = theme.palette.fg,
	-- }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	-- TabLine = { bg = config.options.transparency and nil or theme.palette.bg }, -- tab pages line, not active tab page label
	-- TabLineFill = { bg = config.options.transparency and nil or theme.palette.bg, fg = theme.palette.fg }, -- tab pages line, where there are no labels
	-- TabLineSel = { bg = theme.palette.purple, fg = theme.palette.bg }, -- tab pages line, active tab page label
	-- TermCursorNC = { bg = C.gray }, -- cursor in an unfocused terminal
	Title = {
		fg = C.base.yellow,
	}, -- titles for output from ":set all", ":autocmd"
	Visual = {
		bg = C.editor.selectionBackground,
	}, -- Visual mode selection
	VisualNOS = {
		link = "Visual",
	}, -- Visual mode selection when vim is "Not Owning the Selection".
	WarningMsg = {
		fg = C.inputValidation.warningForeground,
	}, -- warning messages
	WinSeparator = {
		bg = Config.transparent_background and nil or C.editor.background,
		fg = C.base.black,
	}, -- the column separating windows
	Whitespace = {
		fg = C.editor.background,
	}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	-- WildMenu = { bg = C.blue, fg = C.black }, -- current match in 'wildmenu' completion

	-- Git
	diffAdded = { fg = C.base.green },
	diffChanged = { fg = C.base.yellow },
	diffRemoved = { fg = C.base.red },
	diffFile = { fg = C.base.yellow },
	diffNewFile = { fg = C.base.yellow },
	diffLine = { fg = C.base.lightCyan },

	-- Spelling
	SpellBad = { fg = C.base.red, sp = C.base.red, undercurl = true },
	SpellCap = { fg = C.base.red, sp = C.base.red, undercurl = true },
	SpellLocal = { fg = C.base.red, sp = C.base.red, undercurl = true },
	SpellRare = { fg = C.base.red, sp = C.base.red, undercurl = true },
}

return editor
