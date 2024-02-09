local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    Beacon = { bg = c.base.blue },
  }
end

return M
