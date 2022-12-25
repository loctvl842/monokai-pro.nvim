local M = {}

vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
  vim.api.nvim_command("syntax reset")
end

local util = require("monokai-pro.util")
Config = require("monokai-pro.config")
C = require("monokai-pro.palette")

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "monokai-pro"
vim.g.monokai_pro_filter = "pro"

local function highlightBufferLineIcon(theme_palette, config)
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
          ["BufferLine" .. icon_name .. "Selected"] = {
            bg = config.transparent_background and "NONE" or theme_palette.tab.activeBackground,
            fg = icon_color,
            sp = theme_palette.tab.activeBorder,
            underline = config.plugins.bufferline.underline_selected
          },
          ["BufferLine" .. icon_name] = {
            bg = theme_palette.tab.inactiveBackground,
            fg = icon_color,
          },
          ["BufferLine" .. icon_name .. "Inactive"] = {
            bg = config.transparent_background and "NONE" or theme_palette.tab.unfocusedActiveBackground,
            fg = icon_color,
            sp = theme_palette.tab.unfocusedActiveBorder,
            underline = config.plugins.bufferline.underline_selected
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

  local editor = require("monokai-pro.editor")
  local syntax = require("monokai-pro.syntax")
  local semantic_tokens = require("monokai-pro.semantic_tokens")
  local special = require("monokai-pro.special")
  local skeletons = {
    ["editor"] = editor,
    ["syntax"] = syntax,
    ["special"] = special,
    ["semantic_tokens"] = semantic_tokens,
  }

  for _, p in ipairs(plugins) do
    local plugin_ok, pluginConfig = pcall(require, "monokai-pro.plugins." .. p)
    if not plugin_ok then
      local msg = "There is no highlight config named " .. p
      local level = "warn"
      util.notify(msg, level)
      goto continue
    end
    skeletons[p] = pluginConfig
    ::continue::
  end

  for skeleton_name, skeleton_config in pairs(skeletons) do
    local status_ok, _ = pcall(util.initialise, skeleton_config)
    if not status_ok then
      local msg = "Highlight failed in skeleton " .. skeleton_name
      local level = "error"
      util.notify(msg, level)
      goto continue
    end
    ::continue::
  end
  highlightBufferLineIcon(C, Config)
end

local function create_filter_command()
  local cmd = vim.api.nvim_create_user_command
  cmd("MonokaiProSelect", function()
    local menu = util.create_menu("Set monokai filter",
      { "classic", "octagon", "pro", "machine", "ristretto", "spectrum" },
      function(item)
        local filter = item.value
        Config.filter = filter
        vim.g.monokai_pro_filter = filter
        M.setup(Config)
      end)
    menu:mount()
  end, { nargs = 0 })
  cmd("MonokaiPro", function(opts)
    local filter = opts.args
    Config.filter = filter
    vim.g.monokai_pro_filter = filter
    M.setup(Config)
  end, { nargs = 1 })
end

function M.setup(user_config)
  os.execute('dunstify ' .. 'loc')
  Config = vim.tbl_deep_extend("force", Config, user_config)
  local filter = Config.filter == "" and "pro" or Config.filter
  local theme_palette = require('monokai-pro.themes.monokai-' .. filter)
  vim.g.monokai_pro_filter = filter
  generate(theme_palette)
  create_filter_command()
  vim.cmd([[colorscheme monokai-pro]])
end

function M.get_base_color()
  local filter = vim.g.monokai_pro_filter
  local theme_palette = require('monokai-pro.themes.monokai-' .. filter)
  return theme_palette.base
end

return M
