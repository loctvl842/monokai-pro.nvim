local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		UfoFoldedBg = { bg = c.editor.background },
		FoldColumn = {
			bg = config.transparent_background and nil or c.editor.background,
			fg = c.button.foreground,
		}, -- 'foldcolumn'
	}
end

return M
