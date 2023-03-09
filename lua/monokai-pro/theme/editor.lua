local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local float_winBackgroundClear = vim.tbl_contains(config.background_clear, "float_win")
  return {
    ColorColumn = {
      bg = c.editor.background,
    }, -- used for the columns set with 'colorcolumn'
    Conceal = { bg = c.editor.background, fg = c.base.dimmed3 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = {
      bg = c.base.white,
      fg = c.base.white,
    }, -- character under the cursor
    -- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     = {bg = theme.palette.red}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = {
      bg = c.editor.background,
    }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = {
      bg = c.editor.lineHighlightBackground,
    }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLineNr = {
      bg = c.editor.background,
      fg = c.editorLineNumber.activeForeground,
      bold = true,
    }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineNrNC = { bg = C.bg, fg = C.lightGray }, -- CursorLineNr for inactive windows
    Directory = {
      bg = c.editorGroupHeader.tabsBackground,
      fg = c.statusBar.foreground,
    }, -- directory names (and other special names in listings)
    CursorLineFold = {
      bg = c.editor.background,
      fg = c.base.white,
    },
    DiffAdd = {
      bg = c.diffEditor.insertedLineBackground,
      fg = c.diffEditorOverview.insertedForeground,
    }, -- diff mode: Added line |diff.txt|
    DiffChange = {
      bg = c.diffEditor.modifiedLineBackground,
      fg = c.diffEditorOverview.modifiedForeground,
    }, -- diff mode: Changed line |diff.txt|
    DiffDelete = {
      bg = c.diffEditor.removedLineBackground,
      fg = c.diffEditorOverview.removedForeground,
    },
    DiffText = { bg = c.editor.background, fg = c.editor.foreground }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = {
      fg = c.editor.background,
    }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = {
      bg = c.editor.background,
      fg = c.inputValidation.errorForeground,
    }, -- error messages on the command line
    VertSplit = {
      bg = c.editor.background,
      fg = c.base.black,
    }, -- the column separating vertically split windows
    Folded = {
      bg = c.editor.foldBackground,
    }, -- line used for closed folds
    FoldColumn = {
      bg = c.editor.background,
      fg = c.editorLineNumber.activeForeground,
    }, -- 'foldcolumn'
    SignColumn = {
      bg = c.editor.background,
    }, -- column where |signs| are displayed
    -- Substitute = { bg = C.yellow, fg = C.bg }, -- |:substitute| replacement text highlighting
    LineNr = {
      bg = c.editor.background,
      fg = c.editorLineNumber.foreground,
    }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    MatchParen = {
      fg = c.base.yellow,
      bold = true,
      underline = true,
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
      fg = c.base.yellow,
    }, -- |more-prompt| ufo
    NonText = {
      fg = c.editor.background,
    }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|. Example the character space between words
    Normal = {
      bg = c.editor.background,
      fg = c.editor.foreground,
    }, -- normal text
    NormalNC = {
      bg = c.editor.background,
      fg = c.editor.foreground,
    },
    NormalFloat = float_winBackgroundClear and {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    } or {
      -- bg = c.editorHoverWidget.background,
      bg = c.base.black,
      fg = c.base.dimmed1,
    }, -- Normal text in floating windows. example PackerNormal
    FloatBorder = float_winBackgroundClear and {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    } or {
      bg = c.editor.background,
      fg = c.base.black,
    },
    FloatTitle = float_winBackgroundClear and {
      bg = c.editor.background,
      fg = c.base.yellow,
      bold = true,
    } or {
      bg = c.base.yellow,
      fg = c.base.black,
    },
    Pmenu = float_winBackgroundClear and {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    } or {
      bg = c.editorSuggestWidget.background,
      fg = c.editorSuggestWidget.foreground,
    }, -- Popup menu: normal item.
    PmenuSel = float_winBackgroundClear and {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.7),
      bold = true,
    } or {
      bg = c.editorSuggestWidget.selectedBackground,
      bold = true,
    },
    PmenuSbar = {
      bg = hp.lighten(c.editorSuggestWidget.background, -10),
    }, -- Popup menu: scrollbar.
    PmenuThumb = {
      bg = c.scrollbarSlider.hoverBackground,
      bg_base = c.editorSuggestWidget.background,
    },
    -- Question = { bg = C.bg, fg = C.gray }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine = { bg = C.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- QuickFixLineNC = { bg = C.bg }, -- QuickFixLine, for inactive windows
    Search = {
      bg = c.editor.findMatchHighlightBackground,
      fg = nil, -- should set to NONE to use treesitter color
    }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    IncSearch = config.inc_search == "underline" and {
      bg = c.editor.findMatchBackground,
      sp = c.editor.findMatchBorder,
      underline = true,
      bold = true,
    } or {
      bg = c.base.yellow,
      fg = c.base.black,
      underline = false,
      bold = true,
    }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    StatusLine = {
      bg = c.statusBar.background,
      fg = c.statusBar.activeForeground,
      reverse = false,
    }, -- status line of current window
    StatusLineNC = {
      bg = c.statusBar.background,
      fg = c.statusBar.foreground,
    }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineSeparator = { fg = c.statusBar.background },
    StatusLineTerm = { fg = c.statusBar.background },
    StatusLineTermNC = { fg = c.statusBar.background },
    Tabline = { link = "BufferLineBackground" }, -- tab pages line, not active tab page label
    TablineFill = { link = "BufferLineFill" }, -- tab pages line, where there are no labels
    TablineSel = { link = "BufferLineBufferSelected" }, -- tab pages line, active tab page label
    Title = {
      fg = c.base.yellow,
      bold = true,
    }, -- titles for output from ":set all", ":autocmd"
    Visual = {
      bg = c.editor.selectionBackground,
    }, -- Visual mode selection
    VisualNOS = {
      link = "Visual",
    }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = {
      fg = c.inputValidation.warningForeground,
    }, -- warning messages
    WinSeparator = {
      -- bg = c.editor.background,
      fg = c.base.black,
    }, -- the column separating windows
    Whitespace = {
      fg = c.base.dimmed4,
    }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu = { bg = C.blue, fg = C.black }, -- current match in 'wildmenu' completion

    -- Git
    diffAdded = { fg = c.base.green },
    diffChanged = { fg = c.base.yellow },
    diffRemoved = { fg = c.base.red },
    diffFile = { fg = c.base.yellow },
    diffNewFile = { fg = c.base.yellow },
    diffLine = { fg = c.base.cyan },
    -- Spelling
    SpellBad = { fg = c.base.red, sp = c.base.red, undercurl = true },
    SpellCap = { fg = c.base.red, sp = c.base.red, undercurl = true },
    SpellLocal = { fg = c.base.red, sp = c.base.red, undercurl = true },
    SpellRare = { fg = c.base.red, sp = c.base.red, undercurl = true },
    -- Neovim
    healthError = { fg = c.base.red },
    healthSuccess = { fg = c.base.green },
    healthWarning = { fg = c.base.blue },
  }
end

return M
