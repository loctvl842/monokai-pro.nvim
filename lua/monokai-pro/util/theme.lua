local Util = require("monokai-pro.util")
local Helper = require("monokai-pro.color_helper")

---@class monokai-pro.util.theme
local M = {}

local function load_autocmds()
  local ok, _ = pcall(require, "monokai-pro.autocmds")
  if not ok then
    Util.log("Failed to load monokai-pro.autocmds", "error")
  end
end

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
    base = Helper.extend_hex(base, c.background)
  end
  return Helper.extend_hex(hex_color, base)
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

---@param hl_group_tbl? HighlightGroupTbl
function M.draw(hl_group_tbl)
  if hl_group_tbl == nil then
    return
  end
  for hl_group, value in pairs(hl_group_tbl) do
    highlight(hl_group, value)
  end
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
