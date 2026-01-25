---@alias MonokaiPro.Filter "pro" | "classic" | "octagon" | "machine" | "ristretto" | "spectrum" | "light"

---@class MonokaiPro.PluginSpec.Lazy
---@field event? string|string[] Event(s) to trigger highlight application
---@field module? string|string[] Module name(s) to trigger on require()

---@class MonokaiPro.PluginSpec
---@field name string Plugin identifier (matches nvim plugin name)
---@field lazy? MonokaiPro.PluginSpec.Lazy|false Lazy config (false = eager, nil/absent = eager)
---@field enabled? boolean|fun(config: MonokaiPro.Config): boolean
---@field highlights fun(scheme: MonokaiPro.Scheme, config: MonokaiPro.Config): table<string, vim.api.keyset.highlight>

---@class MonokaiPro.GroupSpec
---@field name string Group identifier (editor, syntax, semantic)
---@field highlights fun(scheme: MonokaiPro.Scheme, config: MonokaiPro.Config): table<string, vim.api.keyset.highlight>
---@field extra? fun(scheme: MonokaiPro.Scheme, config: MonokaiPro.Config): table<string, vim.api.keyset.highlight>

---@class MonokaiPro.Config.Styles
---@field comment? vim.api.keyset.highlight
---@field keyword? vim.api.keyset.highlight
---@field type? vim.api.keyset.highlight
---@field storageclass? vim.api.keyset.highlight
---@field structure? vim.api.keyset.highlight
---@field parameter? vim.api.keyset.highlight
---@field annotation? vim.api.keyset.highlight
---@field tag_attribute? vim.api.keyset.highlight

---@class MonokaiPro.Config.DayNight
---@field enable boolean
---@field day_filter MonokaiPro.Filter
---@field night_filter MonokaiPro.Filter

---@class MonokaiPro.Config.Plugins.Bufferline
---@field underline_selected? boolean
---@field underline_visible? boolean
---@field underline_fill? boolean
---@field bold? boolean

---@class MonokaiPro.Config.Plugins.IndentBlankline
---@field context_highlight? "default" | "pro"
---@field context_start_underline? boolean

---@class MonokaiPro.Config.Plugins
---@field bufferline? MonokaiPro.Config.Plugins.Bufferline
---@field indent_blankline? MonokaiPro.Config.Plugins.IndentBlankline

---@class MonokaiPro.Config
---@field transparent_background? boolean
---@field terminal_colors? boolean
---@field devicons? boolean
---@field styles? MonokaiPro.Config.Styles
---@field filter? MonokaiPro.Filter
---@field day_night? MonokaiPro.Config.DayNight
---@field inc_search? "underline" | "background"
---@field background_clear? string[]
---@field disabled_plugins? string[] List of plugin names to disable highlight generation for
---@field plugins? MonokaiPro.Config.Plugins
---@field override? fun(scheme: MonokaiPro.Scheme): table<string, vim.api.keyset.highlight>
---@field override_palette? fun(filter: MonokaiPro.Filter): MonokaiPro.Palette
---@field override_scheme? fun(scheme: MonokaiPro.Scheme, palette: MonokaiPro.Palette, colors: MonokaiPro.Colors): MonokaiPro.Scheme

---@type MonokaiPro.Config
local defaults = {
  transparent_background = false,
  terminal_colors = true,
  devicons = false,
  styles = {
    comment = { italic = true },
    keyword = { italic = true },
    type = { italic = true },
    storageclass = { italic = true },
    structure = { italic = true },
    parameter = { italic = true },
    annotation = { italic = true },
    tag_attribute = { italic = true },
  },
  filter = "pro",
  day_night = {
    enable = false,
    day_filter = "pro",
    night_filter = "spectrum",
  },
  inc_search = "background",
  background_clear = {
    "toggleterm",
    "telescope",
    "renamer",
    "notify",
  },
  disabled_plugins = {},
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "pro",
      context_start_underline = false,
    },
  },
  override = nil,
  override_palette = nil,
  override_scheme = nil,
}

return defaults
