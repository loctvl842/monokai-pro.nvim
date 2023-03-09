local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  -- pro | default
  local isContextPro = config.plugins.indent_blankline.context_highlight == "pro"
  local isContextStartUnderline = config.plugins.indent_blankline.context_start_underline
  return {
    IndentBlanklineChar = { fg = c.editorIndentGuide.background },
    IndentBlanklineContextChar = isContextPro and { fg = c.base.blue } or {
      fg = c.editorIndentGuide.activeBackground,
    },
    IndentBlanklineContextStart = {
      sp = isContextPro and c.base.blue or c.editorIndentGuide.activeBackground,
      underline = isContextStartUnderline,
    },
    IndentBlanklineSpaceChar = { fg = c.editor.background }, -- highlight the character Tab
    IndentBlankLineIndent1 = { fg = c.base.red },
    IndentBlankLineIndent2 = { fg = c.base.blue },
    IndentBlankLineIndent3 = { fg = c.base.yellow },
    IndentBlankLineIndent4 = { fg = c.base.green },
    IndentBlankLineIndent5 = { fg = c.base.cyan },
    IndentBlankLineIndent6 = { fg = c.base.magenta },
  }
end

return M
