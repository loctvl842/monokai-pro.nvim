local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
	local isBackgroundClear = config.plugins.toggleterm.background_clear
	return {
		TermCursor = {
			bg = c.terminalCursor.foreground,
			fg = c.terminalCursor.background,
		}, -- cursor in a focused terminal
		ToggleTerm = {
			bg = isBackgroundClear and c.editor.background or c.terminal.background,
			fg = c.terminal.foreground,
		},
		ToggleTermBorder = {
			bg = c.editor.background,
			fg = isBackgroundClear and c.tab.unfocusedActiveBorder or c.terminal.background,
		},
	}
end

return M
