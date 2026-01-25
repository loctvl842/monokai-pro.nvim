---@class MonokaiPro.NvChad
local M = {}

--- Get monokai-pro colors in NvChad's base46 theme format
---@param filter? MonokaiPro.Filter
---@return table NvChad base46 theme table with base_30, base_16, and type
function M.get(filter)
  local config = require("monokai-pro.config").get()
  local palette_module = require("monokai-pro.palette")
  local colors = require("monokai-pro.colors")

  filter = filter or config.filter or "pro"
  local p = palette_module.load(filter)

  local is_light = filter == "light"

  -- Color utilities
  local blend = colors.blend
  local lighten = colors.lighten
  local darken = colors.darken

  return {
    base_30 = {
      white = p.text,
      darker_black = p.dark2,
      black = p.dark1, -- nvim bg
      black2 = p.dimmed5,
      one_bg = p.background, -- real bg of monokai
      one_bg2 = blend(p.text, 0.05, p.background),
      one_bg3 = blend(p.text, 0.1, p.background),
      grey = p.dimmed4,
      grey_fg = p.dimmed3,
      grey_fg2 = p.dimmed2,
      light_grey = p.dimmed1,
      red = p.accent1,
      baby_pink = lighten(p.accent1, 30),
      pink = p.accent1,
      line = p.dimmed5, -- for lines like vertsplit
      green = p.accent4,
      vibrant_green = p.accent4,
      nord_blue = p.accent5,
      blue = p.accent2,
      yellow = p.accent3,
      sun = p.accent3,
      purple = p.accent6,
      dark_purple = darken(p.accent6, 30),
      teal = p.accent5,
      orange = p.accent2,
      cyan = p.accent5,
      statusline_bg = p.dark2,
      lightbg = p.dimmed5,
      pmenu_bg = p.accent2,
      folder_bg = p.accent2,
    },
    base_16 = {
      base00 = p.background, -- Default Background
      base01 = p.dark1, -- Lighter Background
      base02 = p.dimmed5, -- Selection Background
      base03 = p.dimmed4, -- Comments
      base04 = p.dimmed3, -- Dark Foreground
      base05 = p.text, -- Default Foreground
      base06 = p.dimmed1, -- Light Foreground
      base07 = p.text, -- Light Background
      base08 = p.accent1, -- Variables, Red
      base09 = p.accent2, -- Integers, Orange
      base0A = p.accent3, -- Classes, Yellow
      base0B = p.accent4, -- Strings, Green
      base0C = p.accent5, -- Support, Cyan
      base0D = p.accent2, -- Functions, Blue
      base0E = p.accent6, -- Keywords, Purple
      base0F = p.accent1, -- Deprecated, Brown
    },
    type = is_light and "light" or "dark",
  }
end

return M
