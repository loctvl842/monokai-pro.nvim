local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		WildMenu = { bg = c.base.yellow, fg = c.base.black, bold = true, underline = false },
	}
end

return M
