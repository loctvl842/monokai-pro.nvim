--- Plugin registry with inline metadata and deferred module loading
---@class MonokaiPro.Theme.Plugins
local M = {}

--- Inline plugin registry: metadata is declared here so we never need to
--- require() a lazy plugin module until its trigger fires.
--- Only "eager" entries (lazy = false/nil) are required at startup.
---
---@class MonokaiPro.PluginEntry
---@field mod string Module path under monokai-pro.theme.plugins
---@field name string Plugin identifier (matches nvim plugin name)
---@field lazy? MonokaiPro.PluginSpec.Lazy|false

-- stylua: ignore
M.registry = {
  -- Eager plugins (loaded at startup)
  { mod = "blink",               name = "saghen/blink.cmp" },
  { mod = "lsp",                 name = "lsp" },
  { mod = "treesitter",          name = "nvim-treesitter/nvim-treesitter" },

  -- Lazy plugins (deferred until trigger)
  { mod = "aerial",              name = "stevearc/aerial.nvim",                lazy = { module = "aerial" } },
  { mod = "alpha",               name = "goolord/alpha-nvim",                  lazy = { module = "alpha" } },
  { mod = "bufferline",          name = "akinsho/bufferline.nvim",             lazy = { module = "bufferline" } },
  { mod = "cmp",                 name = "hrsh7th/nvim-cmp",                    lazy = { module = "cmp", event = { "InsertEnter", "CmdlineEnter" } } },
  { mod = "coc",                 name = "neoclide/coc.nvim",                   lazy = { event = "BufEnter" } },
  { mod = "dashboard",           name = "nvimdev/dashboard-nvim",              lazy = { module = "dashboard", event = "VimEnter" } },
  { mod = "fidget",              name = "j-hui/fidget.nvim",                   lazy = { module = "fidget" } },
  { mod = "fzf-lua",             name = "ibhagwan/fzf-lua",                    lazy = { module = { "fzf-lua", "fzf-lua.config", "fzf-lua.actions" } } },
  { mod = "gitsigns",            name = "lewis6991/gitsigns.nvim",             lazy = { module = "gitsigns" } },
  { mod = "illuminate",          name = "RRethy/vim-illuminate",               lazy = { module = "illuminate" } },
  { mod = "indent-blankline",    name = "lukas-reineke/indent-blankline.nvim", lazy = { module = "ibl" } },
  { mod = "lazy",                name = "folke/lazy.nvim",                     lazy = { module = "lazy" } },
  { mod = "mason",               name = "mason-org/mason.nvim",                lazy = { module = "mason" } },
  { mod = "mini",                name = "nvim-mini/mini.nvim",                 lazy = { event = "VimEnter" } },
  { mod = "neo-tree",            name = "nvim-neo-tree/neo-tree.nvim",         lazy = { module = "neo-tree" } },
  { mod = "noice",               name = "folke/noice.nvim",                    lazy = { module = "noice" } },
  { mod = "notify",              name = "rcarriga/nvim-notify",                lazy = { module = "notify" } },
  { mod = "nvim-navic",          name = "SmiteshP/nvim-navic",                 lazy = { module = "nvim-navic", event = "LspAttach" } },
  { mod = "nvim-tree",           name = "nvim-tree/nvim-tree.lua",             lazy = { module = "nvim-tree" } },
  { mod = "packer",              name = "wbthomason/packer.nvim",              lazy = { module = "packer" } },
  { mod = "rainbow-delimiters",  name = "HiPhish/rainbow-delimiters.nvim",     lazy = { module = "rainbow-delimiters.setup" } },
  { mod = "renamer",             name = "filipdutescu/renamer.nvim",           lazy = { module = "renamer" } },
  { mod = "scrollbar",           name = "petertriho/nvim-scrollbar",           lazy = { module = "scrollbar" } },
  { mod = "snacks",              name = "folke/snacks.nvim",                   lazy = { module = "snacks" } },
  { mod = "telescope",           name = "nvim-telescope/telescope.nvim",       lazy = { module = { "telescope", "telescope.builtin" } } },
  { mod = "toggleterm",          name = "akinsho/toggleterm.nvim",             lazy = { module = "toggleterm" } },
  { mod = "ufo",                 name = "kevinhwang91/nvim-ufo",              lazy = { module = "ufo" } },
  { mod = "which-key",           name = "folke/which-key.nvim",                lazy = { module = "which-key" } },
  { mod = "wilder",              name = "gelguy/wilder.nvim",                  lazy = { module = "wilder" } },
}

--- Check if a plugin is enabled
---@param entry MonokaiPro.PluginEntry
---@param config MonokaiPro.Config
---@return boolean
local function is_enabled(entry, config)
  if config.disabled_plugins and vim.tbl_contains(config.disabled_plugins, entry.name) then
    return false
  end
  return true
end

--- Require a plugin module and return its spec
---@param entry MonokaiPro.PluginEntry
---@return MonokaiPro.PluginSpec|nil
local function load_plugin_module(entry)
  local module_path = "monokai-pro.theme.plugins." .. entry.mod
  local ok, spec = pcall(require, module_path)
  if ok and type(spec) == "table" and spec.highlights then
    return spec
  end
  return nil
end

-- Lazy trigger state (module-level, avoids separate triggers module on warm path)
local lazy_state = {
  module_to_plugin = {}, -- require() module name → registry entry
  applied = {},          -- plugin mod name → true
  scheme = nil,          ---@type MonokaiPro.Scheme|nil
  config = nil,          ---@type MonokaiPro.Config|nil
  searcher_installed = false,
}

--- Apply highlights for a lazy plugin when its trigger fires
---@param entry MonokaiPro.PluginEntry
local function apply_lazy_plugin(entry)
  if lazy_state.applied[entry.mod] then
    return
  end
  lazy_state.applied[entry.mod] = true

  local spec = load_plugin_module(entry)
  if spec and lazy_state.scheme then
    local highlights = spec.highlights(lazy_state.scheme, lazy_state.config)
    local nvim_set_hl = vim.api.nvim_set_hl
    for group, opts in pairs(highlights) do
      nvim_set_hl(0, group, opts)
    end
  end
end

--- Generate all plugin highlights (eager ones only, lazy ones are deferred)
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
function M.generate(scheme, config)
  local highlights = {}

  -- Store scheme/config for lazy application
  lazy_state.scheme = scheme
  lazy_state.config = config

  -- Install module loader and register lazy triggers
  M.setup_triggers(config)

  for _, entry in ipairs(M.registry) do
    if not is_enabled(entry, config) then
      goto continue
    end

    if not entry.lazy or lazy_state.applied[entry.mod] then
      -- Eager: require module and apply immediately
      local spec = load_plugin_module(entry)
      if spec then
        local plugin_highlights = spec.highlights(scheme, config)
        highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights)
        lazy_state.applied[entry.mod] = true
      end
    end

    ::continue::
  end

  return highlights
end

--- Setup lazy triggers for all lazy plugins (must be called even on cache hit)
--- Inlines all trigger logic to avoid requiring separate trigger modules.
---@param config MonokaiPro.Config
function M.setup_triggers(config)
  ---@diagnostic disable-next-line: deprecated
  local searchers = package.searchers or package.loaders

  -- Install module searcher once
  if not lazy_state.searcher_installed then
    table.insert(searchers, 2, function(modname)
      local entry = lazy_state.module_to_plugin[modname]
      if entry then
        apply_lazy_plugin(entry)
      end
      return nil
    end)
    lazy_state.searcher_installed = true
  end

  -- Batch event triggers: event → list of entries
  local event_entries = {}

  for _, entry in ipairs(M.registry) do
    if not is_enabled(entry, config) then
      goto continue
    end

    local lc = entry.lazy
    if not lc or lazy_state.applied[entry.mod] then
      goto continue
    end

    -- Register module triggers (just table assignments, no function calls)
    if lc.module then
      local modules = type(lc.module) == "string" and { lc.module } or lc.module
      for _, mod in ipairs(modules) do
        if package.loaded[mod] then
          apply_lazy_plugin(entry)
          goto continue
        end
        lazy_state.module_to_plugin[mod] = entry
      end
    end

    -- Collect event triggers for batching
    if lc.event and not lazy_state.applied[entry.mod] then
      local events = type(lc.event) == "string" and { lc.event } or lc.event
      for _, event in ipairs(events) do
        if (event == "VimEnter" or event == "UIEnter") and vim.v.vim_did_enter == 1 then
          apply_lazy_plugin(entry)
          goto continue
        end
        event_entries[event] = event_entries[event] or {}
        event_entries[event][#event_entries[event] + 1] = entry
      end
    end

    ::continue::
  end

  -- Create batched event autocmds (one per event type, not per plugin)
  for event, entries in pairs(event_entries) do
    vim.api.nvim_create_autocmd(event, {
      once = true,
      callback = function()
        for _, entry in ipairs(entries) do
          apply_lazy_plugin(entry)
        end
      end,
    })
  end
end

--- Get the lazy trigger state (for external access, e.g. theme/init.lua)
---@return table
function M.get_lazy_state()
  return lazy_state
end

--- Load specs (for backward compatibility with clear_cache and external callers)
---@return MonokaiPro.PluginSpec[]
function M.load_specs()
  local specs = {}
  for _, entry in ipairs(M.registry) do
    local spec = load_plugin_module(entry)
    if spec then
      specs[#specs + 1] = spec
    end
  end
  return specs
end

--- Clear the specs cache
function M.clear_cache()
  -- Clear any cached plugin modules
  for _, entry in ipairs(M.registry) do
    package.loaded["monokai-pro.theme.plugins." .. entry.mod] = nil
  end
  -- Reset lazy trigger state
  lazy_state.module_to_plugin = {}
  lazy_state.applied = {}
  lazy_state.scheme = nil
  lazy_state.config = nil
end

return M
