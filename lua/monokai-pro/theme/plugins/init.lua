--- Plugin registry with inline metadata and deferred module loading
---@class MonokaiPro.Theme.Plugins
local M = {}

local state = require("monokai-pro.theme.triggers")
local event_trigger = require("monokai-pro.theme.triggers.event")
local module_trigger = require("monokai-pro.theme.triggers.module")

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

--- Generate all plugin highlights (eager ones only, lazy ones are deferred)
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
function M.generate(scheme, config)
  local highlights = {}

  -- Store scheme/config for lazy application
  state.scheme = scheme
  state.config = config

  -- Install module loader once
  module_trigger.install()

  for _, entry in ipairs(M.registry) do
    if not is_enabled(entry, config) then
      goto continue
    end

    local lazy_config = entry.lazy
    local eager = not lazy_config or state.applied_plugins[entry.name] == true

    if eager then
      -- Eager: require module and apply immediately
      local spec = load_plugin_module(entry)
      if spec then
        local plugin_highlights = spec.highlights(scheme, config)
        highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights)
        state.applied_plugins[entry.name] = true
      end
    else
      -- Lazy: register triggers without requiring the module
      local pending_spec = {
        name = entry.name,
        lazy = lazy_config,
        highlights = function(s, c)
          local spec = load_plugin_module(entry)
          return spec and spec.highlights(s, c) or {}
        end,
      }
      state.pending_specs[entry.name] = pending_spec

      if lazy_config.event then
        event_trigger.setup(pending_spec, lazy_config.event)
      end

      -- Only setup module trigger if the event trigger didn't already apply it
      if lazy_config.module and not state.applied_plugins[entry.name] then
        module_trigger.setup(pending_spec, lazy_config.module)
      end
    end

    ::continue::
  end

  return highlights
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
end

return M
