---@class monokai-pro.theme.plugins.mini
local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    MiniIndentscopeSymbol = { fg = c.base.blue },
  }
end

return M
