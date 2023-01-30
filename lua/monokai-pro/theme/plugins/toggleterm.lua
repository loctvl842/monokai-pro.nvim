local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "toggleterm")
  local transparent_background = config.transparent_background
  return {
    TermCursor = {
      bg = c.terminalCursor.foreground,
      fg = c.terminalCursor.background,
    },
    ToggleTerm = {
      bg = isBackgroundClear and (transparent_background and "NONE" or c.editor.background)
          or c.terminal.background,
      fg = c.terminal.foreground,
    },
    ToggleTermBorder = {
      bg = transparent_background and "NONE" or c.editor.background,
      fg = isBackgroundClear and c.tab.unfocusedActiveBorder or c.terminal.background,
    },
  }
end

return M
