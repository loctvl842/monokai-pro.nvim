local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		SignAdd = { fg = c.editorGutter.addedBackground },
		SignChange = { fg = c.editorGutter.modifiedBackground },
		SignDelete = { fg = c.editorGutter.deletedBackground },
		GitSignsAdd = { link = "SignAdd" },
		GitSignsChange = { link = "SignChange" },
		GitSignsDelete = { link = "SignDelete" },
	}
end

return M
