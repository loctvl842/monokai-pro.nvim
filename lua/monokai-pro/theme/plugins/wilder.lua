local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		WildMenu = { bg = c.base.yellow, fg = c.base.black, bold = true, underline = false },
	}
end

return M
