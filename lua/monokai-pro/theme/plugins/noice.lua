local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		NoiceCmdlinePopup = { bg = c.editorSuggestWidget.background },
		NoiceCmdlinePopupBorder = { bg = c.editor.background, fg = c.editorSuggestWidget.background },
	}
end

return M
