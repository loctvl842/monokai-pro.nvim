local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		AlphaButton = { fg = c.base.magenta },
		AlphaFooter = { fg = c.base.blue },
		AlphaHeader = { fg = c.base.yellow },
	}
end

return M
