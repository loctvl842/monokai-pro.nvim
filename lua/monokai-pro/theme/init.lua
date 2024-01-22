local helper = require("monokai-pro.color_helper")
local util = require("monokai-pro.util")

local M = {}
---@enum SupportedPlugins
local PLUGINS = {
  "Mini",
  "alpha",
  "beacon",
  "breadcrumb",
  "bufferline",
  "cmp",
  "coc",
  "dashboard",
  "gitsign",
  "illuminate",
  "indent_blankline",
  "lazy",
  "lsp",
  "mason",
  "neo-tree",
  "noice",
  "notify",
  "nvim-navic",
  "nvim-tree",
  "nvim-treesitter",
  "nvim-ts-rainbow2",
  "packer",
  "rainbow-delimiters",
  "renamer",
  "scrollbar",
  "telescope",
  "toggleterm",
  "ufo",
  "which-key",
  "wilder",
}

-- Get highlight group dictionary
-- Example:
-- local hl_groups = {
--   Normal = { bg = c.editor.background, fg = c.editor.foreground, }, -- normal text
--   ["@modifier"] = { fg = c.base.red, italic = true },
-- }
---@param colorscheme Colorscheme
---@param config Config
---@return HighlightGroupTbl
local function get_hl_group_dict(colorscheme, config)
  local editor = require("monokai-pro.theme.editor").setup(colorscheme, config, helper)
  local syntax = require("monokai-pro.theme.syntax").setup(colorscheme, config, helper)
  local semantic_tokens = require("monokai-pro.theme.semantic_tokens").setup(colorscheme, config, helper)
  local extra = require("monokai-pro.theme.extra").setup(colorscheme, config, helper)
  --  The HlGroups class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @type HighlightGroupTbl
  local hl_group_tbl = {}
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, editor, syntax, semantic_tokens, extra)
  for _, name in ipairs(PLUGINS) do
    local config_ok, plugin = pcall(require, "monokai-pro.theme.plugins." .. name)
    if not config_ok then
      local msg = "Failed to load highlight group: " .. name
      local level = "error"
      util.log(msg, level)
    else
      hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.setup(colorscheme, config, helper))
    end
  end
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, config.override and config.override(colorscheme) or {})
  return hl_group_tbl
end

---@return HighlightGroupTbl
M.setup = function()
  local config = require("monokai-pro.config")
  local devicons = require("monokai-pro.devicons")
  local colorscheme = require("monokai-pro.colorscheme").setup(config.filter)

  local hl_group_tbl = get_hl_group_dict(colorscheme, config)

  if config.terminal_colors then
    util.terminal(colorscheme)
  end

  if config.devicons then
    devicons.setup(colorscheme)
  end

  return hl_group_tbl
end

return M
