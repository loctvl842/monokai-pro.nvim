local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    IlluminatedWordRead = { bg = c.editor.wordHighlightBackground },
    IlluminatedWordText = { bg = c.editor.selectionHighlightBackground },
    IlluminatedWordWrite = { bg = c.editor.wordHighlightStrongBackground },
  }
end

return M
