local M = {}

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "monokai-pro"

local util = require("monokai-pro.util")
Config = require("monokai-pro.config")
C = require("monokai-pro.palette")

local function generate(theme)
  C = vim.tbl_deep_extend("force", C, theme)

  local plugins = {
    "Alpha",
    "BufferLine",
    "Cmp",
    "Git",
    "Illuminate",
    "IndentBlankline",
    "LSP",
    "markdown",
    "Misc",
    "NeoTree",
    "Notify",
    "NvimTree",
    "Packer",
    "Quickscope",
    "Renamer",
    "StatusLine",
    "SymbolOutline",
    "Telescope",
    "toggleterm",
    "Treesitter",
    "Whichkey",
    "winbar",
    "loc",
  }

  local editor = require("monokai-pro.editor")
  local skeletons = { editor }

  for _, p in ipairs(plugins) do
    local plugin_ok, pluginConfig = pcall(require, "monokai-pro.plugins." .. p)
    if not plugin_ok then
      goto continue
    end
    table.insert(skeletons, pluginConfig)
    ::continue::
  end

  for _, skeleton in ipairs(skeletons) do
    util.initialise(skeleton)
  end
end

function M.setup(user_config)
  Config = vim.tbl_deep_extend("force", Config, user_config)
  local theme = require('monokai-pro.themes.monokai-' .. Config.theme)
  generate(theme)
  vim.cmd('colorscheme monokai-pro')
end

return M
