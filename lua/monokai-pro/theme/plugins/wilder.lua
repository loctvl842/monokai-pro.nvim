local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    WildMenu = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
      underline = false,
    },
  }
end

return M
