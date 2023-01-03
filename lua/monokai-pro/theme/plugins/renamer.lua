local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	local renamerBackgroundClear = config.plugins.renamer.background_clear
	return {
		RenamerNormal = {
			bg = renamerBackgroundClear and c.editor.background or c.editorHoverWidget.background,
			fg = c.editorHoverWidget.foreground,
		},
		RenamerBorder = {
			bg = c.editor.background,
			fg = renamerBackgroundClear and c.editorSuggestWidget.foreground or c.editorSuggestWidget.background,
		},
		RenamerTitle = renamerBackgroundClear and {
			fg = c.base.yellow,
			bold = true,
		} or {
			bg = c.base.yellow,
			fg = c.base.black,
			bold = true,
		},
	}
end

return M
