local M = {}

--- @param c table The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	local isTelescopeBackgroundClear = config.plugins.telescope.background_clear
	return {
		TelescopeSelection = { bg = c.editorLineNumber.foreground, fg = c.base.yellow, bold = true },

		TelescopeNormal = { bg = isTelescopeBackgroundClear and c.editor.background or c.editorHoverWidget.background },
		TelescopeBorder = {
			fg = isTelescopeBackgroundClear and c.tab.unfocusedActiveBorder or c.editorHoverWidget.background,
			bg = c.editor.background,
		},
		TelescopePromptCounter = { fg = c.base.red },

		TelescopePromptTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
		TelescopePreviewTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
		TelescopeResultsTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
		TelescopeMatching = { fg = c.base.blue, bold = true },

		TelescopePreviewLine = { link = "TelescopeSelection" },
		TelescopePromptPrefix = { fg = c.base.cyan },
	}
end

return M
