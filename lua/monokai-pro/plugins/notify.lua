local Notify = {
	NotifyERRORBorder = { fg = C.inputValidationErrorBorder },
	NotifyWARNBorder = { fg = C.inputValidationWarningBorder },
	NotifyINFOBorder = { fg = C.inputValidationInfoBorder },
	NotifyDEBUGBorder = { fg = C.lightWhite },
	NotifyTRACEBorder = { fg = C.magenta },
	NotifyERRORIcon = { fg = C.inputValidationErrorForeground },
	NotifyWARNIcon = { fg = C.inputValidationWarningForeground },
	NotifyINFOIcon = { fg = C.inputValidationInfoForeground },
	NotifyDEBUGIcon = { fg = C.lightWhite },
	NotifyTRACEIcon = { fg = C.magenta },
	NotifyERRORTitle = { link = "NotifyERRORIcon" },
	NotifyWARNTitle = { link = "NotifyWARNIcon" },
	NotifyINFOTitle = { link = "NotifyINFOIcon" },
	NotifyDEBUGTitle = { fg = C.lightWhite },
	NotifyTRACETitle = { fg = C.magenta },
}

return Notify
