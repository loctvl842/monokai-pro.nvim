---@class MonokaiProIcon
---@field hl_name string
---@field color string

---@class Style
---@field italic boolean

---@class StyleTblConfig
---@field comment Style
---@field keyword Style
---@field type Style
---@field storageclass Style
---@field structure Style
---@field parameter Style
---@field annotation Style
---@field tag_attribute Style

--- Available filters
---@alias Filter
---| '"classic"'
---| '"octagon"'
---| '"pro"'
---| '"machine"'
---| '"ristretto"'
---| '"spectrum"'

--- Automatically change filter for day/night
---@class DayNightConfig
---@field enable boolean
---@field day_filter Filter
---@field night_filter Filter

--- Highlight on incremental search
---@alias IncSearchConfig
---| '"underline"'
---| '"background"'

---@alias BackgroundClearConfig
---| '"float_win"'
---| '"toggleterm"'
---| '"telescope"'
---| '"which-key"'
---| '"renamer"'
---| '"notify"'
---| '"nvim-tree"'
---| '"neo-tree"'
---| '"bufferline"'

--- Extra config for `bufferline`
---@class BufferlinePluginConfig
---@field underline_selected boolean
---@field underline_visible boolean
---@field underline_fill boolean
---@field bold boolean

--- Extra config for `indent_blankline`
---@class IndentBlanklineConfig
---@field context_highlight "default"|"pro"
---@field context_start_underline boolean

---@class PluginConfig
---@field bufferline BufferlinePluginConfig
---@field indent_blankline IndentBlanklineConfig

---@class Config
---@field transparent_background? boolean
---@field terminal_colors? boolean
---@field devicons? boolean
---@field override? fun(colors: Colorscheme) A function to override highlight groups
---@field styles? StyleTblConfig
---@field filter? Filter
---@field day_night? DayNightConfig
---@field inc_search? IncSearchConfig
---@field background_clear? BackgroundClearConfig[]
---@field plugins? PluginConfig
---@field overridePalette? fun(filter: Filter) A function to override palette

---@alias HexColor string A hex color in the format "#RRGGBB" or "#RRGGBBAA"
---@alias HexColorAlpha integer A number between 0 and 1

---@class Palette
---@field dark2 HexColor
---@field dark1 HexColor
---@field background HexColor
---@field text HexColor
---@field accent1 HexColor
---@field accent2 HexColor
---@field accent3 HexColor
---@field accent4 HexColor
---@field accent5 HexColor
---@field accent6 HexColor
---@field dimmed1 HexColor
---@field dimmed2 HexColor
---@field dimmed3 HexColor
---@field dimmed4 HexColor
---@field dimmed5 HexColor

---@class RGB
---@field r number A number between 0 and 255
---@field g number A number between 0 and 255
---@field b number A number between 0 and 255

---@class HighlightGroupOpt
---@field bg_base? HexColor The base color of `bg`. This is used to calculate the RGBA color.
---@field fg_base? HexColor The base color of `fg`. This is used to calculate the RGBA color.
---@field fg? HexColor foreground: color name or "#RRGGBB", see note.
---@field bg? HexColor background: color name or "#RRGGBB", see note.
---@field sp? HexColor special: color name or "#RRGGBB"
---@field blend? integer between 0 and 100
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean
---@field nocombine? boolean
---@field link? string name of another highlight group to link to

---@alias HighlightGroup string

---@class HighlightGroupTbl: { [HighlightGroup]: HighlightGroupOpt }
