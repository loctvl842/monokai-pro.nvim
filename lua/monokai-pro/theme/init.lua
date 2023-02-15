local helper = require("monokai-pro.color_helper")
local util = require("monokai-pro.util")

local M = {}
local plugins = {
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
  "neo-tree",
  "noice",
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

---@param colorscheme Colorscheme
---@param config Config
---@return HlGroups
local function generateHlGroups(colorscheme, config)
  local editor = require("monokai-pro.theme.editor").setup(colorscheme, config, helper)
  local syntax = require("monokai-pro.theme.syntax").setup(colorscheme, config, helper)
  local semantic_tokens = require("monokai-pro.theme.semantic_tokens").setup(colorscheme, config, helper)
  local extra = require("monokai-pro.theme.extra").setup(colorscheme, config, helper)
  --  The HlGroups class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @class HlGroups
  local hl_groups = {}
  hl_groups = vim.tbl_deep_extend("force", hl_groups, editor, syntax, semantic_tokens, extra)
  for _, name in ipairs(plugins) do
    local config_ok, plugin = pcall(require, "monokai-pro.theme.plugins." .. name)
    if not config_ok then
      local msg = "Failed to load highlight group: " .. name
      local level = "error"
      util.notify(msg, level)
      goto continue
    end
    hl_groups = vim.tbl_deep_extend("force", hl_groups, plugin.setup(colorscheme, config, helper))
    ::continue::
  end
  hl_groups = vim.tbl_deep_extend("force", hl_groups, config.override(colorscheme) or {})
  return hl_groups
end

---@param colors Colorscheme
M.terminal = function(colors)
  -- dark
  vim.g.terminal_color_0 = colors.base.black
  vim.g.terminal_color_8 = colors.base.dimmed3

  -- light
  vim.g.terminal_color_7 = colors.base.white
  vim.g.terminal_color_15 = colors.base.white

  -- colors
  vim.g.terminal_color_1 = colors.base.red
  vim.g.terminal_color_9 = colors.base.red

  vim.g.terminal_color_2 = colors.base.green
  vim.g.terminal_color_10 = colors.base.green

  vim.g.terminal_color_3 = colors.base.yellow
  vim.g.terminal_color_11 = colors.base.yellow

  vim.g.terminal_color_4 = colors.base.blue
  vim.g.terminal_color_12 = colors.base.blue

  vim.g.terminal_color_5 = colors.base.magenta
  vim.g.terminal_color_13 = colors.base.magenta

  vim.g.terminal_color_6 = colors.base.cyan
  vim.g.terminal_color_14 = colors.base.cyan
end

---@return HlGroups
M.setup = function()
  local config = require("monokai-pro.config").options
  local colorscheme = require("monokai-pro.colorscheme").setup(config.filter)
  local hl_groups = generateHlGroups(colorscheme, config)

  if config.terminal_colors then
    M.terminal(colorscheme)
  end

  return hl_groups
end

return M
