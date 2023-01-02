local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	local whichkeyBackgroundClear = config.plugins.whichkey.background_clear
	return {
		WhichKey = { fg = c.base.blue },
		WhichKeySeperator = { fg = c.base.red },
		WhichKeyGroup = { fg = c.base.magenta },
		WhichKeyDesc = { fg = c.base.yellow },
		WhichKeyFloat = whichkeyBackgroundClear and {
			bg = c.editor.background,
			fg = c.editorSuggestWidget.foreground,
		} or {
			bg = c.editorHoverWidget.background,
		},
	}
end

return M
