---@class MonokaiPro.Colors.Convert
local M = {}

---@class MonokaiPro.RGB
---@field r number Red component (0-255)
---@field g number Green component (0-255)
---@field b number Blue component (0-255)

--- Convert hex color to RGB
---@param hex string Hex color string (e.g., "#ff6188")
---@return MonokaiPro.RGB
function M.hex_to_rgb(hex)
  if hex == nil or hex == "NONE" then
    return { r = 0, g = 0, b = 0 }
  end
  hex = string.lower(hex)
  return {
    r = tonumber(hex:sub(2, 3), 16) or 0,
    g = tonumber(hex:sub(4, 5), 16) or 0,
    b = tonumber(hex:sub(6, 7), 16) or 0,
  }
end

--- Convert RGB to hex color
---@param rgb MonokaiPro.RGB
---@return string Hex color string
function M.rgb_to_hex(rgb)
  local r = math.max(0, math.min(255, math.floor(rgb.r + 0.5)))
  local g = math.max(0, math.min(255, math.floor(rgb.g + 0.5)))
  local b = math.max(0, math.min(255, math.floor(rgb.b + 0.5)))
  return string.format("#%02x%02x%02x", r, g, b)
end

--- Parse a hex8 color (with alpha) and return hex6 + alpha
---@param hex8 string Hex color with alpha (e.g., "#ff618880")
---@return string hex6 Hex color without alpha
---@return number alpha Alpha value (0-1)
function M.parse_hex8(hex8)
  if hex8 == nil or #hex8 ~= 9 then
    return hex8 or "#000000", 1.0
  end
  local hex6 = hex8:sub(1, 7)
  local alpha = tonumber(hex8:sub(8, 9), 16) / 255
  return hex6, alpha
end

return M
