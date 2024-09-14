---@class monokai-pro.theme.plugins.mini
local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    MiniIndentscopeSymbol = { fg = c.base.blue },

    -- mini.status
    MiniStatuslineModeNormal = { fg = c.base.black, bg = c.base.green },
    MiniStatuslineModeInsert = { fg = c.base.black, bg = c.base.yellow },
    MiniStatuslineModeCommand = { fg = c.base.black, bg = c.base.red },
    MiniStatuslineModeVisual = { fg = c.base.black, bg = c.base.cyan },
    MiniStatuslineModeReplace = { fg = c.base.black, bg = c.base.blue },
    MiniStatuslineModeOther = { fg = c.base.black, bg = c.base.white },
  }
end

return M
