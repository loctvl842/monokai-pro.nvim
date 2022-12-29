local M = {}

-- pro | default
local isContextPro = Config.plugins.indent_blankline.context_highlight == "pro"

M.highlight = {
	IndentBlanklineChar = { fg = C.editorIndentGuide.background },

	IndentBlanklineContextChar = isContextPro and { fg = C.base.blue } or { fg = C.editorIndentGuide.activeBackground },
	IndentBlanklineContextStart = isContextPro and { sp = C.base.blue, underline = true }
		or { sp = C.editorIndentGuide.activeBackground, underline = true },

	IndentBlanklineSpaceChar = { fg = C.editor.background }, -- highlight the character Tab
}

return M
