local Util = require("monokai-pro.util")

---@class monokai-pro.util.devicons
local M = {}

--- Get the web-devicon
---@param extension string example: "txt", "lua", "python"
---@return MonokaiProIcon?
function M.get(filename, extension)
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    Util.log("It is recommended to install 'nvim-web-devicons' for better experience.", "info")
    return
  end
  local _, icon_hl_name = webDevicons.get_icon(filename, extension, { default = true })
  local _, icon_color = webDevicons.get_icon_color(filename, extension, { default = true })

  return {
    hl_name = icon_hl_name,
    color = icon_color,
  }
end

return M
