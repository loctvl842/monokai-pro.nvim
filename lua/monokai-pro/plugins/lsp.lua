local LSP = {
	-- Neovim 0.6+
	DiagnosticError = { fg = C.inputValidation.errorForeground },
	DiagnosticWarn = { fg = C.inputValidation.warningForeground },
	DiagnosticInfo = { fg = C.inputValidation.infoForeground },
	DiagnosticHint = { fg = C.inputValidation.infoForeground },

	DiagnosticSignError = { fg = C.inputValidation.errorForeground },
	DiagnosticSignWarn = { fg = C.inputValidation.warningForeground },
	DiagnosticSignInfo = { fg = C.inputValidation.infoForeground },
	DiagnosticSignHint = { fg = C.inputValidation.infoForeground },

	DiagnosticVirtualTextError = { fg = C.inputValidation.errorForeground },
	DiagnosticVirtualTextWarn = { fg = C.inputValidation.warningForeground },
	DiagnosticVirtualTextInfo = { fg = C.inputValidation.infoForeground },
	DiagnosticVirtualTextHint = { fg = C.inputValidation.infoForeground },

	DiagnosticUnderlineError = {
		bg = Config.diagnostic.background and C.inputValidation.errorBackground or nil,
		sp = C.inputValidation.errorBorder,
		undercurl = true,
	},
	DiagnosticUnderlineWarn = {
		bg = Config.diagnostic.background and C.inputValidation.warningBackground or nil,
		sp = C.inputValidation.warningBorder,
		undercurl = true,
	},
	DiagnosticUnderlineInfo = {
		bg = Config.diagnostic.background and C.inputValidation.infoBackground or nil,
		sp = C.inputValidation.infoBorder,
		undercurl = true,
	},
	DiagnosticUnderlineHint = {
		bg = Config.diagnostic.background and C.inputValidation.infoBackground or nil,
		sp = C.inputValidation.infoBorder,
		undercurl = true,
	},
}

return LSP
