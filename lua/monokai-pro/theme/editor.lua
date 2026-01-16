local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
    local float_win_background_clear = vim.tbl_contains(config.background_clear, "float_win")
    local is_underline_search = config.inc_search == "underline"

    local editor_bg = c.editor.background
    local editor_fg = c.editor.foreground
    local base_yellow = c.base.yellow
    local base_black = c.base.black
    local base_white = c.base.white
    local status_bg = c.statusBar.background
    local status_fg = c.statusBar.foreground

    local normal_float_config = float_win_background_clear and {
        bg = editor_bg,
        fg = c.editorSuggestWidget.foreground,
    } or {
        bg = base_black,
        fg = c.base.dimmed1,
    }

    local float_border_config = float_win_background_clear and {
        bg = editor_bg,
        fg = c.editorSuggestWidget.foreground,
    } or {
        bg = editor_bg,
        fg = base_black,
    }

    local float_title_config = float_win_background_clear and {
        bg = editor_bg,
        fg = base_yellow,
        bold = true,
    } or {
        bg = base_yellow,
        fg = base_black,
    }

    local pmenu_config = float_win_background_clear and {
        bg = editor_bg,
        fg = c.editorSuggestWidget.foreground,
    } or {
        bg = c.editorSuggestWidget.background,
        fg = c.editorSuggestWidget.foreground,
    }

    local pmenu_sel_config = float_win_background_clear and {
        bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.7),
        bold = true,
    } or {
        bg = c.editorSuggestWidget.selectedBackground,
        bold = true,
    }

    local inc_search_config = is_underline_search and {
        bg = c.editor.findMatchBackground,
        sp = c.editor.findMatchBorder,
        underline = true,
        bold = true,
    } or {
        bg = base_yellow,
        fg = base_black,
        bold = true,
    }

    local spell_config = {
        fg = c.base.red,
        sp = c.base.red,
        undercurl = true,
    }

    return {
        ColorColumn = { bg = c.base.dimmed5 },
        Conceal = { bg = editor_bg, fg = c.base.dimmed3 },
        Cursor = { bg = base_white, fg = base_white },
        CursorColumn = { bg = c.editor.lineHighlightBackground },
        CursorLine = { bg = c.editor.lineHighlightBackground },
        CursorLineNr = {
            bg = editor_bg,
            fg = c.editorLineNumber.activeForeground,
            bold = true,
        },
        Directory = {
            bg = c.editorGroupHeader.tabsBackground,
            fg = status_fg,
        },
        CursorLineFold = { bg = editor_bg, fg = base_white },

        DiffAdd = {
            bg = c.diffEditor.insertedLineBackground,
            fg = c.diffEditorOverview.insertedForeground,
        },
        DiffChange = {
            bg = c.diffEditor.modifiedLineBackground,
            fg = c.diffEditorOverview.modifiedForeground,
        },
        DiffDelete = {
            bg = c.diffEditor.removedLineBackground,
            fg = c.diffEditorOverview.removedForeground,
        },
        DiffText = { bg = editor_bg, fg = editor_fg },

        -- Buffer elements
        EndOfBuffer = { fg = editor_bg },
        ErrorMsg = { bg = editor_bg, fg = c.inputValidation.errorForeground },
        VertSplit = { bg = editor_bg, fg = base_black },

        -- Columns and signs
        Folded = { bg = c.editor.foldBackground },
        FoldColumn = { bg = editor_bg, fg = c.editorLineNumber.activeForeground },

        -- Columns and signs
        SignColumn = { bg = editor_bg },
        LineNr = { bg = editor_bg, fg = c.editorLineNumber.foreground },

        -- Matching and parentheses
        MatchParen = {
            fg = base_yellow,
            bold = true,
            underline = true,
        },

        -- Messages and mode
        ModeMsg = { link = "Normal" },
        MsgArea = { link = "ModeMsg" },
        MsgSeparator = { link = "ModeMsg" },
        MoreMsg = { fg = base_yellow },

        -- Text
        NonText = { fg = editor_bg },
        Normal = { bg = editor_bg, fg = editor_fg },
        NormalNC = { bg = editor_bg, fg = editor_fg },

        -- Floating windows
        NormalFloat = normal_float_config,
        FloatBorder = float_border_config,
        FloatTitle = float_title_config,

        -- Popup menus
        Pmenu = pmenu_config,
        PmenuSel = pmenu_sel_config,
        PmenuSbar = { bg = hp.lighten(c.editorSuggestWidget.background, -10) },
        PmenuThumb = {
            bg = c.scrollbarSlider.hoverBackground,
            bg_base = c.editorSuggestWidget.background,
        },

        -- Search
        Search = {
            bg = c.editor.findMatchHighlightBackground,
            fg = nil,  -- Use treesitter color
        },
        IncSearch = inc_search_config,

        -- Status bar
        StatusLine = {
            bg = status_bg,
            fg = c.statusBar.activeForeground,
        },
        StatusLineNC = { bg = status_bg, fg = status_fg },
        StatusLineSeparator = { fg = status_bg },
        StatusLineTerm = { fg = status_bg },
        StatusLineTermNC = { fg = status_bg },

        Tabline = { link = "BufferLineBackground" },
        TablineFill = { link = "BufferLineFill" },
        TablineSel = { link = "BufferLineBufferSelected" },

        -- Titles and selection
        Title = { fg = base_yellow, bold = true },
        Visual = { bg = c.editor.selectionBackground },
        VisualNOS = { link = "Visual" },

        -- Warnings
        WarningMsg = { fg = c.inputValidation.warningForeground },

        -- Partitions and spaces
        WinSeparator = { fg = base_black },
        Whitespace = { fg = c.base.dimmed4 },

        -- Git
        diffAdded = { fg = c.base.green },
        diffChanged = { fg = base_yellow },
        diffRemoved = { fg = c.base.red },
        diffFile = { fg = base_yellow },
        diffNewFile = { fg = base_yellow },
        diffLine = { fg = c.base.cyan },

        -- Spell checking
        SpellBad = spell_config,
        SpellCap = spell_config,
        SpellLocal = spell_config,
        SpellRare = spell_config,

        -- Neovim health
        healthError = { fg = c.base.red },
        healthSuccess = { fg = c.base.green },
        healthWarning = { fg = c.base.blue },
    }
end

return M
