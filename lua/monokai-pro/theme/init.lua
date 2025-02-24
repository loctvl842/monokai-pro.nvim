local Helper = require("monokai-pro.color_helper")
local Util = require("monokai-pro.util")
local Config = require("monokai-pro.config")
local Colorscheme = require("monokai-pro.colorscheme")

---@class MonokaiProTheme
---@field mini monokai-pro.theme.plugins.mini
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local plugin = require("monokai-pro.theme.plugins" .. k)
    return plugin
  end,
})

---@enum SupportedPlugins
local PLUGINS = {
  "mini",
  "aerial",
  "alpha",
  "beacon",
  "blink",
  "breadcrumb",
  "bufferline",
  "cmp",
  "coc",
  "dashboard",
  "fidget",
  "fzf-lua",
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
  "snacks",
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
      hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.get(colorscheme, Config, Helper))
    end
  end
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, Config.override and Config.override(colorscheme) or {})
  return hl_group_tbl
end

---@return HighlightGroupTbl
M.setup = function()
  local devicons = require("monokai-pro.devicons")

  local colorscheme = Colorscheme(Config.filter)
  -- print(colorscheme.editor.background)
  -- print(colorscheme.tab.activeBackground)
  local hl_group_tbl = get_hl_group_tbl(colorscheme)
  -- print(Helper.lighten(colorscheme.tab.activeBackground, 10))
  -- M.temp = vim.tbl_deep_extend("force", colorscheme.tab or {}, true and {
  --   activeBackground = Helper.lighten(colorscheme.tab.activeBackground, 10),
  --   inactiveBackground = Helper.lighten(colorscheme.tab.inactiveBackground, 10),
  --   unfocusedActiveBackground = Helper.lighten(colorscheme.tab.unfocusedActiveBackground, 10),
  -- } or {})
  -- print(vim.inspect(M.temp))

  if Config.terminal_colors then
    Util.extra.terminal(Colorscheme)
  end

  if Config.devicons then
    devicons.setup(Colorscheme)
  end

  return hl_group_tbl
end

return M
