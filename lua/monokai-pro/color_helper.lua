---@class Helper
local M = {}

---@param background? HexColor | "NONE"
local function get_blend_background(background)
  if background ~= nil and background ~= "NONE" then
    return background
  end

  local filter = require("monokai-pro.colorscheme").filter
  ---@type Palette
  local c = require("monokai-pro.colorscheme.palette." .. filter)
  return c.background
end

---@param hex HexColor
---@return RGB
local function hex_to_rgb(hex)
  hex = string.lower(hex)
  return {
    r = tonumber(hex:sub(2, 3), 16),
    g = tonumber(hex:sub(4, 5), 16),
    b = tonumber(hex:sub(6, 7), 16),
  }
end

---@param rgb RGB
---@return HexColor
local function rgb_to_hex(rgb)
  local red = string.format("%02x", rgb.r)
  local green = string.format("%02x", rgb.g)
  local blue = string.format("%02x", rgb.b)
  return "#" .. red .. green .. blue
end

---@param hex HexColor | "NONE"
---@param amt number
M.lighten = function(hex, amt)
  -- stylua: ignore
  if hex == "NONE" then return hex end

  local rgb = hex_to_rgb(hex)
  -- over upper
  rgb.r = (rgb.r + amt > 255) and 255 or (rgb.r + amt)
  rgb.g = (rgb.g + amt > 255) and 255 or (rgb.g + amt)
  rgb.b = (rgb.b + amt > 255) and 255 or (rgb.b + amt)
  -- below bound
  rgb.r = (rgb.r < 0) and 0 or rgb.r
  rgb.g = (rgb.g < 0) and 0 or rgb.g
  rgb.b = (rgb.b < 0) and 0 or rgb.b
  -- rgb to hex
  local red = string.format("%02x", rgb.r)
  local green = string.format("%02x", rgb.g)
  local blue = string.format("%02x", rgb.b)
  return "#" .. red .. green .. blue
end

---@param alpha HexColorAlpha
---@param background HexColor
M.rgba = function(red, green, blue, alpha, background)
  background = get_blend_background(background)
  local bg_rgb = hex_to_rgb(background)
  -- new color
  red = (1 - alpha) * bg_rgb.r + alpha * red
  green = (1 - alpha) * bg_rgb.g + alpha * green
  blue = (1 - alpha) * bg_rgb.b + alpha * blue
  return rgb_to_hex({ r = red, g = green, b = blue })
end

---@param hex HexColor | "NONE"
---@param alpha HexColorAlpha
---@param base? HexColor
M.blend = function(hex, alpha, base)
  -- stylua: ignore
  if hex == "NONE" then return "NONE" end

  base = get_blend_background(base)
  local rgb = hex_to_rgb(hex)
  return M.rgba(rgb.r, rgb.g, rgb.b, alpha, base)
end

---@param hexColor HexColor
---@param base HexColor
M.extend_hex = function(hexColor, base)
  base = get_blend_background(base)
  local hex6 = string.sub(hexColor, 1, 7)
  local alpha = tonumber(string.sub(hexColor, 8, 9), 16) / 255
  return M.blend(hex6, alpha, base)
end

return M
