local LSP = {
	-- Neovim 0.6+
	DiagnosticError = { fg = C.red },
	DiagnosticWarn = { fg = C.yellow },
	DiagnosticInfo = { fg = C.blue },
	DiagnosticHint = { fg = C.cyan },

	DiagnosticSignError = { fg = C.red },
	DiagnosticSignWarn = { fg = C.yellow },
	DiagnosticSignInfo = { fg = C.blue },
	DiagnosticSignHint = { fg = C.cyan },

	DiagnosticUnderlineError = { style = "undercurl" },
	DiagnosticUnderlineWarn = { style = "undercurl" },
	DiagnosticUnderlineInfo = { style = "undercurl" },
	DiagnosticUnderlineHint = { style = "undercurl" },

	DiagnosticVirtualTextError = { fg = C.red },
	DiagnosticVirtualTextWarn = { fg = C.yellow },
	DiagnosticVirtualTextInfo = { fg = C.blue },
	DiagnosticVirtualTextHint = { fg = C.blue },
}

return LSP
