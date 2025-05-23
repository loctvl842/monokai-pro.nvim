---@class monokai-pro.util.devicons
local M = {}

--- Get the web-devicon
---@param extension string example: "txt", "lua", "python"
---@return MonokaiProIcon?
function M.get(filename, extension)
  local ok, icons = pcall(require, "nvim-web-devicons")
  if not ok then
    return
  end
  local _, icon_hl_name = icons.get_icon(filename, extension, { default = true })
  local _, icon_color = icons.get_icon_color(filename, extension, { default = true })

  return {
    hl_name = icon_hl_name,
    color = icon_color,
  }
end

return M
