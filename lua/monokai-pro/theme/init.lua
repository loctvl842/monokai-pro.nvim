local config_module = require("monokai-pro.config")
local colors = require("monokai-pro.colors")

---@class MonokaiPro.ThemeModule
local M = {}

---@type MonokaiPro.Scheme|nil
local cached_scheme = nil

--- Disk cache helpers
local cache = {}

---@param filter string
---@return string
function cache.file(filter)
  return vim.fn.stdpath("cache") .. "/monokai-pro-" .. filter .. ".json"
end

---@param filter string
---@return table|nil
function cache.read(filter)
  local ok, ret = pcall(function()
    local fd = assert(io.open(cache.file(filter), "r"))
    local data = fd:read("*a")
    fd:close()
    return vim.json.decode(data, { luanil = { object = true, array = true } })
  end)
  return ok and ret or nil
end

---@param filter string
---@param data table
function cache.write(filter, data)
  pcall(function()
    local path = cache.file(filter)
    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    local fd = assert(io.open(path, "w+"))
    fd:write(vim.json.encode(data))
    fd:close()
  end)
end

function cache.clear()
  for _, filter in ipairs({ "pro", "classic", "octagon", "machine", "ristretto", "spectrum", "light" }) do
    pcall(os.remove, cache.file(filter))
  end
end

--- Build cache inputs for validation (must match to use cached highlights)
--- Uses lightweight config fingerprint to avoid rebuilding scheme for validation
---@param config MonokaiPro.Config
---@return table
local function cache_inputs(config)
  return {
    filter = config.filter or "pro",
    styles = config.styles,
    transparent_background = config.transparent_background,
    inc_search = config.inc_search,
    background_clear = config.background_clear,
    disabled_plugins = config.disabled_plugins,
    plugins = config.plugins,
    -- override functions invalidate cache (can't be serialized/compared)
    has_override = config.override ~= nil,
    has_override_palette = config.override_palette ~= nil,
    has_override_scheme = config.override_scheme ~= nil,
  }
end

--- Extract terminal color values from scheme for caching
---@param scheme MonokaiPro.Scheme
---@return table<string, string>
local function extract_terminal_colors(scheme)
  return {
    black = scheme.base.black,
    dimmed3 = scheme.base.dimmed3,
    white = scheme.base.white,
    red = scheme.base.red,
    green = scheme.base.green,
    yellow = scheme.base.yellow,
    blue = scheme.base.blue,
    magenta = scheme.base.magenta,
    cyan = scheme.base.cyan,
  }
end

--- Set terminal colors from a scheme or cached terminal colors table
---@param tc table Terminal colors (either a scheme with base.* or a flat table)
local function set_terminal_colors(tc)
  vim.g.terminal_color_0 = tc.black
  vim.g.terminal_color_8 = tc.dimmed3

  vim.g.terminal_color_7 = tc.white
  vim.g.terminal_color_15 = tc.white

  vim.g.terminal_color_1 = tc.red
  vim.g.terminal_color_9 = tc.red

  vim.g.terminal_color_2 = tc.green
  vim.g.terminal_color_10 = tc.green

  vim.g.terminal_color_3 = tc.yellow
  vim.g.terminal_color_11 = tc.yellow

  vim.g.terminal_color_4 = tc.blue
  vim.g.terminal_color_12 = tc.blue

  vim.g.terminal_color_5 = tc.magenta
  vim.g.terminal_color_13 = tc.magenta

  vim.g.terminal_color_6 = tc.cyan
  vim.g.terminal_color_14 = tc.cyan
end

--- Build palette and scheme for the current config (lazy-requires palette/scheme modules)
---@param config MonokaiPro.Config
---@return MonokaiPro.Scheme scheme
local function build_scheme(config)
  local filter = config.filter or "pro"
  local palette_module = require("monokai-pro.palette")
  local palette = palette_module.load(filter)

  if config.override_palette then
    local palette_overrides = config.override_palette(filter)
    if palette_overrides then
      palette = vim.tbl_deep_extend("force", palette, palette_overrides)
    end
  end

  local scheme_module = require("monokai-pro.theme.scheme")
  local scheme = scheme_module.build(palette, config)

  if config.override_scheme then
    local scheme_overrides = config.override_scheme(scheme, palette, colors)
    if scheme_overrides then
      scheme = vim.tbl_deep_extend("force", scheme, scheme_overrides)
    end
  end

  return scheme
end

--- Build the complete highlight table (expensive — requires all group/plugin modules)
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

--- Build the theme (with disk + memory caching)
---@return table<string, vim.api.keyset.highlight>
function M.build()
  local config = config_module.get()
  local filter = config.filter or "pro"

  -- Try disk cache (no scheme build needed for validation)
  local inputs = cache_inputs(config)
  local disk = cache.read(filter)
  if disk and disk.scheme and vim.deep_equal(inputs, disk.inputs) then
    return disk.highlights
  end

  -- Cache miss: build scheme + highlights
  local scheme = build_scheme(config)
  cached_scheme = scheme
  local highlights = build_highlights(scheme, config)

  cache.write(filter, {
    highlights = highlights,
    inputs = inputs,
    scheme = scheme,
    terminal_colors = extract_terminal_colors(scheme),
  })

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
  local filter = config.filter or "pro"

  -- Try disk cache first (avoids requiring palette/scheme/groups/plugins modules)
  local inputs = cache_inputs(config)
  local disk = cache.read(filter)
  local highlights
  if disk and disk.scheme and vim.deep_equal(inputs, disk.inputs) then
    highlights = disk.highlights
    -- Restore scheme from cache (avoids build_scheme)
    cached_scheme = disk.scheme
  else
    disk = nil
    -- Cache miss: full build
    local scheme = build_scheme(config)
    cached_scheme = scheme
    highlights = build_highlights(scheme, config)
    cache.write(filter, {
      highlights = highlights,
      inputs = inputs,
      scheme = scheme,
      terminal_colors = extract_terminal_colors(scheme),
    })
  end

  colors.apply_highlights(highlights)

  -- Always setup lazy plugin triggers (even on cache hit) so that plugin
  -- highlights are applied when plugins like neo-tree, telescope, etc. load
  local plugins = require("monokai-pro.theme.plugins")
  plugins.setup_triggers(config)
  local state = require("monokai-pro.theme.triggers")
  state.scheme = cached_scheme
  state.config = config

  -- Set terminal colors (use cached values on cache hit, no scheme rebuild)
  if config.terminal_colors then
    if disk and disk.terminal_colors then
      set_terminal_colors(disk.terminal_colors)
    else
      set_terminal_colors(extract_terminal_colors(cached_scheme))
    end
  end

  -- Apply devicons (Defers if UI hasn't entered yet)
  if config.devicons then
    local function apply_devicons()
      local ok, devicons = pcall(require, "monokai-pro.integrations.devicons")
      if ok then
        devicons.setup()
      end
    end

    if vim.v.vim_did_enter == 1 then
      -- UI already ready, apply on next event loop tick to avoid blocking
      vim.schedule(apply_devicons)
    else
      vim.api.nvim_create_autocmd("UIEnter", {
        once = true,
        callback = apply_devicons,
      })
    end
  end
end

--- Clear the highlight cache (both memory and disk)
function M.clear_cache()
  cached_scheme = nil
  cache.clear()

  require("monokai-pro.palette").clear_cache()

  -- Clear registry caches
  local groups = require("monokai-pro.theme.groups")
  local plugins = require("monokai-pro.theme.plugins")
  groups.clear_cache()
  plugins.clear_cache()
end

--- Get the current scheme for the active filter
---@return MonokaiPro.Scheme
function M.get_scheme()
  if cached_scheme then
    return cached_scheme
  end

  local config = config_module.get()
  local scheme = build_scheme(config)
  cached_scheme = scheme
  return scheme
end

return M
