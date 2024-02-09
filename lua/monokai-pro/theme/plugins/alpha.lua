local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    AlphaButton = { fg = c.base.magenta },
    AlphaFooter = { fg = c.base.blue },
    AlphaHeader = { fg = c.base.yellow },
  }
end

return M
