local M = {}

M.highlight = {
	NotifyERRORBorder = { fg = C.inputValidation.errorBorder },
	NotifyWARNBorder = { fg = C.inputValidation.warningBorder },
	NotifyINFOBorder = { fg = C.inputValidation.infoBorder },
	NotifyDEBUGBorder = { fg = C.base.lightWhite },
	NotifyTRACEBorder = { fg = C.base.magenta },
	NotifyERRORIcon = { fg = C.inputValidation.errorForeground },
	NotifyWARNIcon = { fg = C.inputValidation.warningForeground },
	NotifyINFOIcon = { fg = C.inputValidation.infoForeground },
	NotifyDEBUGIcon = { fg = C.base.lightWhite },
	NotifyTRACEIcon = { fg = C.base.magenta },
	NotifyERRORTitle = { link = "NotifyERRORIcon" },
	NotifyWARNTitle = { link = "NotifyWARNIcon" },
	NotifyINFOTitle = { link = "NotifyINFOIcon" },
	NotifyDEBUGTitle = { fg = C.base.lightWhite },
	NotifyTRACETitle = { fg = C.base.magenta },
}

return M
