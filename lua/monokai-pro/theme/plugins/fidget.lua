local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    FidgetTask = {
      bg = c.editor.background,
      fg = c.base.white,
    },
    FidgetTitle = { bg = c.editor.background, fg = c.base.yellow },
  }
end

return M
