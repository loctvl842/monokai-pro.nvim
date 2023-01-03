local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	-- pro | default
	local isContextPro = config.plugins.indent_blankline.context_highlight == "pro"
	return {
		IndentBlanklineChar = { fg = c.editorIndentGuide.background },

		IndentBlanklineContextChar = isContextPro and { fg = c.base.blue }
			or { fg = c.editorIndentGuide.activeBackground },
		IndentBlanklineContextStart = isContextPro and { sp = c.base.blue, underline = true }
			or { sp = c.editorIndentGuide.activeBackground, underline = true },

		IndentBlanklineSpaceChar = { fg = c.editor.background }, -- highlight the character Tab
	}
end

return M
