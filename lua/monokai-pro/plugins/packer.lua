local M = {}

M.highlight = {
	packerString = { fg = C.base.blue },
	packerHash = { fg = C.base.blue },
	packerOutput = { fg = C.base.yellow },
	packerRelDate = { fg = C.base.magenta },
	packerSuccess = { fg = C.base.green },
	packerStatusSuccess = { fg = C.base.green },
	packerStatusFail = { fg = C.base.red, bg = C.editorHoverWidget.background },
	packerFail = { fg = C.base.red, bg = C.editorHoverWidget.background },
}

return M
