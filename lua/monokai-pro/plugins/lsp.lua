local LSP = {
	-- Neovim 0.6+
	DiagnosticError = { fg = C.inputValidationErrorForeground },
	DiagnosticWarn = { fg = C.inputValidationWarningForeground },
	DiagnosticInfo = { fg = C.inputValidationInfoForeground },
	DiagnosticHint = { fg = C.inputValidationInfoForeground },

	DiagnosticSignError = { fg = C.inputValidationErrorForeground },
	DiagnosticSignWarn = { fg = C.inputValidationWarningForeground },
	DiagnosticSignInfo = { fg = C.inputValidationInfoForeground },
	DiagnosticSignHint = { fg = C.inputValidationInfoForeground },

	DiagnosticVirtualTextError = { fg = C.inputValidationErrorForeground },
	DiagnosticVirtualTextWarn = { fg = C.inputValidationWarningForeground },
	DiagnosticVirtualTextInfo = { fg = C.inputValidationInfoForeground },
	DiagnosticVirtualTextHint = { fg = C.inputValidationInfoForeground },

	DiagnosticUnderlineError = {
		bg = Config.diagnostic.background and C.inputValidationErrorBackground or "NONE",
		style = "undercurl",
	},
	DiagnosticUnderlineWarn = {
		bg = Config.diagnostic.background and C.inputValidationWarningBackground or "NONE",
		style = "undercurl",
	},
	DiagnosticUnderlineInfo = {
		bg = Config.diagnostic.background and C.inputValidationInfoBackground or "NONE",
		style = "undercurl",
	},
	DiagnosticUnderlineHint = {
		bg = Config.diagnostic.background and C.inputValidationInfoBackground or "NONE",
		style = "undercurl",
	},
}

return LSP
