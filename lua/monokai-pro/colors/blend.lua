---@class MonokaiPro.Colors.Blend
local M = {}

local convert = require("monokai-pro.colors.convert")

--- Blend a foreground color with a background color
---@param foreground string Hex color for foreground
---@param alpha number Alpha value (0-1), where 0 is fully background and 1 is fully foreground
---@param background string Hex color for background (defaults to black)
---@return string Blended hex color
function M.blend(foreground, alpha, background)
  if foreground == "NONE" then
    return "NONE"
  end

  background = background or "#000000"
  if background == "NONE" then
    background = "#000000"
  end

  local fg = convert.hex_to_rgb(foreground)
  local bg = convert.hex_to_rgb(background)

  local blended = {
    r = (1 - alpha) * bg.r + alpha * fg.r,
    g = (1 - alpha) * bg.g + alpha * fg.g,
    b = (1 - alpha) * bg.b + alpha * fg.b,
  }

  return convert.rgb_to_hex(blended)
end

--- Lighten a color by adding to RGB values
---@param hex string Hex color
---@param amount number Amount to add (positive = lighter, negative = darker)
---@return string Lightened hex color
function M.lighten(hex, amount)
  if hex == "NONE" then
    return hex
  end

  local rgb = convert.hex_to_rgb(hex)

  return convert.rgb_to_hex({
    r = rgb.r + amount,
    g = rgb.g + amount,
    b = rgb.b + amount,
  })
end

--- Darken a color by subtracting from RGB values
---@param hex string Hex color
---@param amount number Amount to subtract (positive = darker)
---@return string Darkened hex color
function M.darken(hex, amount)
  return M.lighten(hex, -amount)
end

--- Blend RGBA color with background
---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@param alpha number Alpha (0-1)
---@param background string Hex color for background
---@return string Blended hex color
function M.rgba(r, g, b, alpha, background)
  local bg = convert.hex_to_rgb(background or "#000000")

  local blended = {
    r = (1 - alpha) * bg.r + alpha * r,
    g = (1 - alpha) * bg.g + alpha * g,
    b = (1 - alpha) * bg.b + alpha * b,
  }

  return convert.rgb_to_hex(blended)
end

--- Extend a hex8 color (with embedded alpha) to a solid hex6 color
---@param hex8 string Hex color with alpha (e.g., "#ff618880")
---@param background string Background color to blend against
---@return string Solid hex6 color
function M.extend_hex8(hex8, background)
  if hex8 == nil or #hex8 ~= 9 then
    return hex8 or "#000000"
  end
  local hex6, alpha = convert.parse_hex8(hex8)
  return M.blend(hex6, alpha, background)
end

return M
