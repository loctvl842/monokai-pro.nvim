local config_module = require("monokai-pro.config")
local palette_module = require("monokai-pro.palette")
local scheme_module = require("monokai-pro.theme.scheme")
local colors = require("monokai-pro.colors")

---@class MonokaiPro.ThemeModule
local M = {}

--- Cached highlight table and the filter it was built for
---@type table<string, vim.api.keyset.highlight>|nil
local highlights_cache = nil
---@type string|nil
local cache_filter = nil
---@type MonokaiPro.Scheme|nil
local cached_scheme = nil

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

--- Build palette and scheme for the current config
---@param config MonokaiPro.Config
---@return MonokaiPro.Scheme scheme
local function build_scheme(config)
  local filter = config.filter or "pro"
  local palette = palette_module.load(filter)

  if config.override_palette then
    local palette_overrides = config.override_palette(filter)
    if palette_overrides then
      palette = vim.tbl_deep_extend("force", palette, palette_overrides)
    end
  end

  local scheme = scheme_module.build(palette, config)

  if config.override_scheme then
    local scheme_overrides = config.override_scheme(scheme, palette, colors)
    if scheme_overrides then
      scheme = vim.tbl_deep_extend("force", scheme, scheme_overrides)
    end
  end

  return scheme
end

--- Build the complete highlight table
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
local function build_highlights(scheme, config)
  local highlights = {}

  -- Load core highlight groups via static registry
  local groups = require("monokai-pro.theme.groups")
  highlights = vim.tbl_deep_extend("force", highlights, groups.generate(scheme, config))

  -- Load plugin highlights via static registry
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

--- Build the theme (with caching)
---@return table<string, vim.api.keyset.highlight>
function M.build()
  local config = config_module.get()
  local filter = config.filter or "pro"

  -- Return cached highlights if filter hasn't changed
  if highlights_cache and cache_filter == filter then
    return highlights_cache
  end

  local scheme = build_scheme(config)
  local highlights = build_highlights(scheme, config)

  -- Cache results
  highlights_cache = highlights
  cache_filter = filter
  cached_scheme = scheme

  return highlights
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

  -- Build scheme and highlights (cached on repeated loads with same filter)
  local scheme = build_scheme(config)
  local filter = config.filter or "pro"

  local highlights
  if highlights_cache and cache_filter == filter then
    highlights = highlights_cache
  else
    highlights = build_highlights(scheme, config)
    highlights_cache = highlights
    cache_filter = filter
  end
  cached_scheme = scheme

  colors.apply_highlights(highlights)

  -- Set terminal colors (reuse scheme, no rebuild)
  if config.terminal_colors then
    set_terminal_colors(scheme)
  end

  -- Defer devicons to UIEnter to avoid blocking startup
  if config.devicons then
    vim.api.nvim_create_autocmd("UIEnter", {
      once = true,
      callback = function()
        local ok, devicons = pcall(require, "monokai-pro.integrations.devicons")
        if ok then
          devicons.setup()
        end
      end,
    })
  end
end

--- Clear the highlight cache
function M.clear_cache()
  highlights_cache = nil
  cache_filter = nil
  cached_scheme = nil

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
  -- Return cached scheme if available
  if cached_scheme then
    return cached_scheme
  end

  local config = config_module.get()
  local scheme = build_scheme(config)
  cached_scheme = scheme
  return scheme
end

return M
