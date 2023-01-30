local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		NoiceCmdlinePopup = { bg = c.editor.background },
		NoiceCmdlinePopupBorder = { bg = c.editor.background, fg = c.editorSuggestWidget.foreground },
		NoiceCmdlinePopupBorderSearch = { bg = c.editor.background, fg = c.base.blue },
		NoiceCmdlineIconSearch = { fg = c.base.blue },
	}
end

return M
