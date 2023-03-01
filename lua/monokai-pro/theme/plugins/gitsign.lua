local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    SignAdd = { fg = c.editorGutter.addedBackground },
    SignChange = { fg = c.editorGutter.modifiedBackground },
    SignDelete = { fg = c.editorGutter.deletedBackground },
    GitSignsAdd = { link = "SignAdd" },
    GitSignsChange = { link = "SignChange" },
    GitSignsDelete = { link = "SignDelete" },
    GitSignsCurrentLineBlame = { fg = c.base.dimmed4 },
    GitSignsAddInline = { link = "DiffAdd" },
    GitSignsChangeInline = { link = "DiffChange" },
    GitSignsDeleteInline = { link = "DiffDelete" },
  }
end

return M
