local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		FidgetTask = {
			bg = c.editor.background,
			fg = c.base.white,
		},
		FidgetTitle = { bg = c.editor.background, fg = c.base.yellow },
	}
end

return M
