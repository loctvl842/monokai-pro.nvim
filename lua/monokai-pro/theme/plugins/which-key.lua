local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "which-key")
  return {
    WhichKey = { fg = c.base.blue },
    WhichKeySeperator = { fg = c.base.red },
    WhichKeyGroup = { fg = c.base.magenta },
    WhichKeyDesc = { fg = c.base.yellow },
    WhichKeyFloat = isBackgroundClear and {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    } or {
      bg = c.editorHoverWidget.background,
    },
  }
end

return M
