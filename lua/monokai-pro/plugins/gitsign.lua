local M = {}

M.highlight = {
	SignAdd = { fg = C.editorGutter.addedBackground },
	SignChange = { fg = C.editorGutter.modifiedBackground },
	SignDelete = { fg = C.editorGutter.deletedBackground },
	GitSignsAdd = { link = "SignAdd" },
	GitSignsChange = { link = "SignChange" },
	GitSignsDelete = { link = "SignDelete" },
}

return M
