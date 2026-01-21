---@class MonokaiPro.Colors
---@field blend fun(foreground: string, alpha: number, background?: string): string
---@field lighten fun(hex: string, amount: number): string
---@field darken fun(hex: string, amount: number): string
---@field rgba fun(r: number, g: number, b: number, alpha: number, background?: string): string
---@field extend_hex8 fun(hex8: string, background: string): string
---@field hex_to_rgb fun(hex: string): MonokaiPro.RGB
---@field rgb_to_hex fun(rgb: MonokaiPro.RGB): string
---@field apply_highlights fun(highlights: table<string, vim.api.keyset.highlight>)

local blend = require("monokai-pro.colors.blend")
local convert = require("monokai-pro.colors.convert")

--- Apply a highlight group
---@param group string
---@param opts vim.api.keyset.highlight
local function apply_highlight(group, opts)
  if opts.link then
    vim.api.nvim_command("hi! link " .. group .. " " .. opts.link)
  else
    vim.api.nvim_set_hl(0, group, opts)
  end
end

---@type MonokaiPro.Colors
local M = {
  -- Blend functions
  blend = blend.blend,
  lighten = blend.lighten,
  darken = blend.darken,
  rgba = blend.rgba,
  extend_hex8 = blend.extend_hex8,
  -- Convert functions
  hex_to_rgb = convert.hex_to_rgb,
  rgb_to_hex = convert.rgb_to_hex,
  apply_highlights = function(highlights)
    for group, opts in pairs(highlights) do
      apply_highlight(group, opts)
    end
  end,
}

return M
