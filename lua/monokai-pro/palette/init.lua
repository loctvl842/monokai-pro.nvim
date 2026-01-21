---@class MonokaiPro.Palette
---@field dark2 string Darkest background
---@field dark1 string Dark background (sidebar)
---@field background string Main editor background
---@field text string Main text color
---@field accent1 string Red/Pink accent
---@field accent2 string Orange accent
---@field accent3 string Yellow accent
---@field accent4 string Green accent
---@field accent5 string Cyan/Blue accent
---@field accent6 string Purple accent
---@field dimmed1 string Light gray (active text)
---@field dimmed2 string Medium gray (border)
---@field dimmed3 string Dark gray (comments)
---@field dimmed4 string Darker gray
---@field dimmed5 string Darkest gray (UI elements)

---@class MonokaiPro.PaletteModule
local M = {}

---@type table<MonokaiPro.Filter, MonokaiPro.Palette>
local cache = {}

--- Load a palette by filter name
---@param filter MonokaiPro.Filter
---@return MonokaiPro.Palette
function M.load(filter)
  if cache[filter] then
    return cache[filter]
  end

  local ok, palette = pcall(require, "monokai-pro.palette." .. filter)
  if not ok then
    vim.notify(
      string.format("MonokaiPro: Invalid filter '%s', falling back to 'pro'", filter),
      vim.log.levels.WARN
    )
    palette = require("monokai-pro.palette.pro")
  end

  cache[filter] = palette
  return palette
end

--- Clear the palette cache
function M.clear_cache()
  cache = {}
end

--- Get the cached palette for a filter (nil if not cached)
---@param filter MonokaiPro.Filter
---@return MonokaiPro.Palette?
function M.get_cached(filter)
  return cache[filter]
end

return M
