---@class monokai-pro.util.devicons
local M = {}

--- Get the web-devicon
---@param extension string example: "txt", "lua", "python"
---@return MonokaiProIcon?
function M.get(filename, extension)
  local icon_ok, web_devicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    return
  end
  local _, icon_hl_name = web_devicons.get_icon(filename, extension, { default = true })
  local _, icon_color = web_devicons.get_icon_color(filename, extension, { default = true })

  return {
    hl_name = icon_hl_name,
    color = icon_color,
  }
end

return M
