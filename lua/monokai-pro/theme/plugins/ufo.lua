local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    UfoFoldedBg = { bg = c.editor.background },
    FoldColumn = {
      bg = c.editor.background,
      fg = c.button.foreground,
    }, -- 'foldcolumn'
  }
end

return M
