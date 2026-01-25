local config_module = require("monokai-pro.config")
local palette_module = require("monokai-pro.palette")
local scheme_module = require("monokai-pro.theme.scheme")
local colors = require("monokai-pro.colors")

---@class MonokaiPro.ThemeModule
local M = {}

--- Set terminal colors
---@param scheme MonokaiPro.Scheme
local function set_terminal_colors(scheme)
  vim.g.terminal_color_0 = scheme.base.black
  vim.g.terminal_color_8 = scheme.base.dimmed3

  vim.g.terminal_color_7 = scheme.base.white
  vim.g.terminal_color_15 = scheme.base.white

  vim.g.terminal_color_1 = scheme.base.red
  vim.g.terminal_color_9 = scheme.base.red

  vim.g.terminal_color_2 = scheme.base.green
  vim.g.terminal_color_10 = scheme.base.green

  vim.g.terminal_color_3 = scheme.base.yellow
  vim.g.terminal_color_11 = scheme.base.yellow

  vim.g.terminal_color_4 = scheme.base.blue
  vim.g.terminal_color_12 = scheme.base.blue

  vim.g.terminal_color_5 = scheme.base.magenta
  vim.g.terminal_color_13 = scheme.base.magenta

  vim.g.terminal_color_6 = scheme.base.cyan
  vim.g.terminal_color_14 = scheme.base.cyan
end

--- Build the complete highlight table
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
local function build_highlights(scheme, config)
  local highlights = {}

  -- Load core highlight groups via registry (auto-discovery)
  local groups = require("monokai-pro.theme.groups")
  highlights = vim.tbl_deep_extend("force", highlights, groups.generate(scheme, config))

  -- Load plugin highlights via registry (auto-discovery)
  local plugins = require("monokai-pro.theme.plugins")
  highlights = vim.tbl_deep_extend("force", highlights, plugins.generate(scheme, config))

  -- Apply user overrides
  if config.override then
    local user_overrides = config.override(scheme)
    if user_overrides then
      highlights = vim.tbl_deep_extend("force", highlights, user_overrides)
    end
  end

  return highlights
end

--- Build the theme
---@return table<string, vim.api.keyset.highlight>
function M.build()
  local config = config_module.get()
  local filter = config.filter or "pro"

  -- Load palette (with potential user overrides)
  local palette = palette_module.load(filter)
  if config.override_palette then
    local palette_overrides = config.override_palette(filter)
    if palette_overrides then
      palette = vim.tbl_deep_extend("force", palette, palette_overrides)
    end
  end

  -- Build scheme
  local scheme = scheme_module.build(palette, config)

  -- Apply user scheme overrides
  if config.override_scheme then
    local scheme_overrides = config.override_scheme(scheme, palette, colors)
    if scheme_overrides then
      scheme = vim.tbl_deep_extend("force", scheme, scheme_overrides)
    end
  end

  return build_highlights(scheme, config)
end

--- Load the theme
function M.load()
  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd([[hi clear]])
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "monokai-pro"

  local config = config_module.get()
  local filter = config.filter or "pro"

  -- Build and apply highlights
  local highlights = M.build()
  colors.apply_highlights(highlights)

  -- Set terminal colors
  if config.terminal_colors then
    local palette = palette_module.load(filter)
    local scheme = scheme_module.build(palette, config)
    set_terminal_colors(scheme)
  end

  -- Apply devicons if enabled
  if config.devicons then
    local ok, devicons = pcall(require, "monokai-pro.integrations.devicons")
    if ok then
      devicons.setup()
    end
  end
end

--- Clear the highlight cache
function M.clear_cache()
  palette_module.clear_cache()

  -- Clear registry caches
  local groups = require("monokai-pro.theme.groups")
  local plugins = require("monokai-pro.theme.plugins")
  groups.clear_cache()
  plugins.clear_cache()
end

--- Get the current scheme for the active filter
---@return MonokaiPro.Scheme
function M.get_scheme()
  local config = config_module.get()
  local filter = config.filter or "pro"
  local palette = palette_module.load(filter)
  return scheme_module.build(palette, config)
end

return M
