local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		IlluminatedWordRead = { bg = c.editor.wordHighlightBackground },
		IlluminatedWordText = { bg = c.editor.selectionHighlightBackground },
		IlluminatedWordWrite = { bg = c.editor.wordHighlightStrongBackground },
	}
end

return M
