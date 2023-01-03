local helper = require("monokai-pro.color_helper")
local util = require("monokai-pro.util")

local M = {}
local plugins = {
  "StatusLine",
  "alpha",
  "breadcrumb",
  "bufferline",
  "cmp",
  "coc",
  "gitsign",
  "illuminate",
  "indent_blankline",
  "lsp",
  "neo-tree",
  "notify",
  "nvim-navic",
  "nvim-tree",
  "nvim-treesitter",
  "packer",
  "renamer",
  "scrollbar",
  "telescope",
  "toggleterm",
  "ufo",
  "which-key",
  "wilder",
}

---@return Slices
local function generateSlices()
  local editor = require("monokai-pro.theme.editor")
  local syntax = require("monokai-pro.theme.syntax")
  local semantic_tokens = require("monokai-pro.theme.semantic_tokens")
  local extra = require("monokai-pro.extra")
  --  The Slices class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @class Slices
  local hl_groups = {
    ["editor"] = editor.setup(M.colorscheme, M.config, helper),
    ["syntax"] = syntax.setup(M.colorscheme, M.config, helper),
    ["semantic_tokens"] = semantic_tokens.setup(M.colorscheme, M.config, helper),
    ["extra"] = extra.setup(M.colorscheme, M.config, helper),
  }
  for _, name in ipairs(plugins) do
    local config_ok, plugin = pcall(require, "monokai-pro.theme.plugins." .. name)
    if not config_ok then
      local msg = "Failed to load highlight group: " .. name
      local level = "error"
      util.notify(msg, level)
      goto continue
    end
    local hl_config = plugin.setup(M.colorscheme, M.config, helper)
    hl_groups[name] = hl_config
    ::continue::
  end
  return hl_groups
end

---@param config Config
---@return Slices
M.setup = function(config)
  --- @module "monokai-pro.palette.pro"
  M.colorscheme = require("monokai-pro.palette." .. config.filter)
  M.config = config
  local slices = generateSlices()
  return slices
end

return M
