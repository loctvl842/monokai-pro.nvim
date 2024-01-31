local Helper = require("monokai-pro.color_helper")
local Util = require("monokai-pro.util")
local Config = require("monokai-pro.config")
local Colorscheme = require("monokai-pro.colorscheme")

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
---@return HighlightGroupTbl
local function get_hl_group_tbl(colorscheme)
  local editor = require("monokai-pro.theme.editor").setup(colorscheme, Config, Helper)
  local syntax = require("monokai-pro.theme.syntax").setup(colorscheme, Config, Helper)
  local semantic_tokens = require("monokai-pro.theme.semantic_tokens").setup(colorscheme, Config, Helper)
  local extra = require("monokai-pro.theme.extra").setup(colorscheme, Config, Helper)
  --  The HlGroups class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @type HighlightGroupTbl
  local hl_group_tbl = {}
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, editor, syntax, semantic_tokens, extra)
  for _, name in ipairs(PLUGINS) do
    local config_ok, plugin = xpcall(require, function(...)
      Util.log("Failed to load highlight group: " .. name .. "\n" .. debug.traceback(...), "error")
      return ...
    end, "monokai-pro.theme.plugins." .. name)
    if config_ok then
      hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.setup(colorscheme, Config, Helper))
    end
  end
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, Config.override and Config.override(colorscheme) or {})
  return hl_group_tbl
end

---@return HighlightGroupTbl
M.setup = function()
  local devicons = require("monokai-pro.devicons")

  local hl_group_tbl = get_hl_group_tbl(Colorscheme(Config.filter))

  if Config.terminal_colors then
    Util.terminal(Colorscheme)
  end

  if Config.devicons then
    devicons.setup(Colorscheme)
  end

  return hl_group_tbl
end

return M
