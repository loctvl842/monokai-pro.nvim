local hp = require("monokai-pro.color_helper")
local nui_ok, _ = pcall(require, "nui.menu")

---@class Util
local M = {}

---@param hex_color HexColor
---@param base? HexColor
---@return HexColor?
local function get_real_color(hex_color, base)
  if hex_color == nil or string.len(hex_color) ~= 9 then
    return hex_color
  end

  local filter = require("monokai-pro.colorscheme").filter
  ---@module "monokai-pro.colorscheme.palette.pro"
  local c = require("monokai-pro.colorscheme.palette." .. filter)
  if base == nil then
    base = c.background
  end
  if string.len(base) == 9 then
    base = hp.extend_hex(base, c.background)
  end
  return hp.extend_hex(hex_color, base)
end

---@param hl_group_opt HighlightGroupOpt
local get_highlight_value = function(hl_group_opt)
  local bg_value = get_real_color(hl_group_opt.bg, hl_group_opt.bg_base)
  local fg_value = get_real_color(hl_group_opt.fg, hl_group_opt.fg_base)
  local sp_value = get_real_color(hl_group_opt.sp, bg_value)
  hl_group_opt.bg = bg_value
  hl_group_opt.fg = fg_value
  hl_group_opt.sp = sp_value
  hl_group_opt.bg_base = nil
  hl_group_opt.fg_base = nil
  return hl_group_opt
end

---@param group HighlightGroup
---@param hl_group_opt HighlightGroupOpt
local highlight = function(group, hl_group_opt)
  local link = hl_group_opt.link
  if link ~= nil then
    local cmd = "hi! link " .. group .. " " .. link
    vim.api.nvim_command(cmd)
    return
  end
  local hl_value = get_highlight_value(hl_group_opt)
  vim.api.nvim_set_hl(0, group, hl_value)
end

function M.create_menu(title, items, handler)
  if not nui_ok then
    return
  end

  local Menu = require("nui.menu")
  local NuiText = require("nui.text")
  local menuItems = {
    Menu.separator("", {
      char = "-",
      text_align = "right",
    }),
  }
  for _, it in ipairs(items) do
    table.insert(menuItems, Menu.item("   " .. it, { value = it }))
  end
  local popup_border_text = NuiText(" " .. title .. " ", "SPTitle")
  local menu = Menu({
    position = "50%",
    size = {
      width = 25,
      height = #items + 1,
    },
    relative = "editor",
    border = {
      style = {
        "█",
        "█",
        "█",
        "█",
        "▀",
        "▀",
        "▀",
        "█",
      },
      text = {
        top = popup_border_text,
        top_align = "center",
        text_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:SPNormalFloat,FloatBorder:SPFloatBorder,CursorLine:SPCursorLine",
    },
  }, {
    lines = menuItems,
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = handler,
  })
  return menu
end

---@param hl_group_tbl? HighlightGroupTbl
function M.draw(hl_group_tbl)
  if hl_group_tbl == nil then
    return
  end
  for hl_group, value in pairs(hl_group_tbl) do
    highlight(hl_group, value)
  end
end

--- A logging function
--- @param msg string
--- @param level "debug"|"info"|"warn"|"error"
--- @param opts table|nil
function M.log(msg, level, opts)
  opts = opts or {}
  level = vim.log.levels[level:upper()]
  if type(msg) == "table" then
    msg = table.concat(msg, "\n")
  end
  local nopts = { title = "Monokai-pro" }
  if opts.once then
    return vim.schedule(function()
      vim.notify_once(msg, level, nopts)
    end)
  end
  vim.schedule(function()
    vim.notify(msg, level, nopts)
  end)
end

---@param colors Colorscheme
function M.terminal(colors)
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

local function load_autocmds()
  local ok, _ = pcall(require, "monokai-pro.autocmds")
  if not ok then
    M.log("Failed to load monokai-pro.autocmds", "error")
  end
end

function M.is_daytime()
  local current_time = os.time()
  local current_hour = tonumber(os.date("%H", current_time))
  return current_hour >= 6 and current_hour < 18
end

--- Get the web-devicon
---@param extension string example: "txt", "lua", "python"
---@return MonokaiProIcon?
function M.get_devicon(filename, extension)
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    return
  end
  local _, icon_hl_name = webDevicons.get_icon(filename, extension, { default = true })
  local _, icon_color = webDevicons.get_icon_color(filename, extension, { default = true })

  return {
    hl_name = icon_hl_name,
    color = icon_color,
  }
end

---@param hl_group_tbl HighlightGroupTbl
function M.load(hl_group_tbl)
  if vim.g.colors_name then
    vim.cmd([[hi clear]])
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "monokai-pro"

  M.draw(hl_group_tbl)

  local bufferline_icon_hl_group_tbl = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
  M.draw(bufferline_icon_hl_group_tbl)
  load_autocmds()
end

return M
