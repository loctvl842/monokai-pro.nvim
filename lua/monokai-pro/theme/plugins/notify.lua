local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	return {
		NotifyERRORBorder = { fg = c.inputValidation.errorBorder },
		NotifyWARNBorder = { fg = c.inputValidation.warningBorder },
		NotifyINFOBorder = { fg = c.inputValidation.infoBorder },
		NotifyDEBUGBorder = { fg = c.base.white },
		NotifyTRACEBorder = { fg = c.base.magenta },
		NotifyERRORIcon = { fg = c.inputValidation.errorForeground },
		NotifyWARNIcon = { fg = c.inputValidation.warningForeground },
		NotifyINFOIcon = { fg = c.inputValidation.infoForeground },
		NotifyDEBUGIcon = { fg = c.base.white },
		NotifyTRACEIcon = { fg = c.base.magenta },
		NotifyERRORTitle = { link = "NotifyERRORIcon" },
		NotifyWARNTitle = { link = "NotifyWARNIcon" },
		NotifyINFOTitle = { link = "NotifyINFOIcon" },
		NotifyDEBUGTitle = { fg = c.base.white },
		NotifyTRACETitle = { fg = c.base.magenta },
	}
end

return M
