local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, hp)
  return {
    SnacksDashboardNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksDashboardDesc = { fg = c.base.dimmed1 },
    SnacksDashboardIcon = { fg = c.base.blue },
  }
end

return M
