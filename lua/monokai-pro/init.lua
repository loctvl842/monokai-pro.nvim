local M = {}

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "monokai-pro"

local util = require("monokai-pro.util")
Config = require("monokai-pro.config")
C = require("monokai-pro.palette")

local function highlightBufferLineIcon(theme_palette)
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if icon_ok then
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        local ft = vim.bo.filetype
        local _, icon_name = webDevicons.get_icon_by_filetype(ft, { default = true })
        local _, icon_color = webDevicons.get_icon_color_by_filetype(ft, { default = true })
        if not icon_name then
          return
        end
        local iconSkeleton = {
          ["BufferLine" .. icon_name] = {
            bg = theme_palette.bufferline_background,
            fg = icon_color,
          },
          ["BufferLine" .. icon_name .. "Inactive"] = {
            bg = theme_palette.background,
            fg = icon_color,
          },
          ["BufferLine" .. icon_name .. "Selected"] = {
            bg = theme_palette.background,
            fg = icon_color,
            style = "underline",
            sp = theme_palette.yellow,
          },
        }
        util.initialise(iconSkeleton)
      end,
    })
  end
end

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
    "breadcrumb",
    "Scrollbar",
  }

  local editor = require("monokai-pro.editor")
  local skeletons = { editor }

  for _, p in ipairs(plugins) do
    local plugin_ok, pluginConfig = pcall(require, "monokai-pro.plugins." .. p)
    if not plugin_ok then
      local msg = "There is no highlight config named " .. p
      local level = "warn"
      util.notify(msg, level)
      goto continue
    end
    table.insert(skeletons, pluginConfig)
    ::continue::
  end

  for _, skeleton in ipairs(skeletons) do
    util.initialise(skeleton)
  end
  highlightBufferLineIcon(C)
end

function M.setup(user_config)
  Config = vim.tbl_deep_extend("force", Config, user_config)
  local theme_palette = require('monokai-pro.themes.monokai-' .. Config.theme)
  vim.g.monokai_pro_filter = Config.theme
  generate(theme_palette)
  vim.cmd('colorscheme monokai-pro')
end

return M
