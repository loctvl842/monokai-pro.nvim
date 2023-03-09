local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    CmpItemAbbrMatch = { fg = c.editorSuggestWidget.highlightForeground, bold = true }, -- text match in order
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" }, -- text match not in order
    CmpItemMenu = { fg = c.editorSuggestWidget.foreground }, -- source of cmp. Ex: Lsp | Snippet
    CmpItemAbbr = { fg = c.editorSuggestWidget.foreground }, -- text that not match
    CmpItemAbbrDeprecated = { fg = c.editorSuggestWidget.foreground, strikethrough = true }, -- text not match of deprecated
    CmpItemKindArray = { fg = c.base.red },
    CmpItemKindBoolean = { fg = c.base.red },
    CmpItemKindClass = { fg = c.base.cyan },
    CmpItemKindColor = { fg = c.base.magenta },
    CmpItemKindConstant = { fg = c.base.magenta },
    CmpItemKindConstructor = { fg = c.base.green },
    CmpItemKindEnum = { fg = c.base.blue },
    CmpItemKindEnumMember = { fg = c.base.blue },
    CmpItemKindEvent = { fg = c.base.blue },
    CmpItemKindField = { fg = c.base.blue },
    CmpItemKindFile = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFolder = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFunction = { fg = c.base.green },
    CmpItemKindInterface = { fg = c.base.cyan },
    CmpItemKindKey = { fg = c.base.blue },
    CmpItemKindKeyword = { fg = c.base.red },
    CmpItemKindMethod = { fg = c.base.green },
    CmpItemKindModule = { fg = c.base.cyan },
    CmpItemKindNamespace = { fg = c.base.cyan },
    CmpItemKindNull = { fg = c.base.magenta },
    CmpItemKindNumber = { fg = c.base.magenta },
    CmpItemKindObject = { fg = c.base.cyan },
    CmpItemKindOperator = { fg = c.base.red },
    CmpItemKindPackage = { fg = c.base.magenta },
    CmpItemKindProperty = { fg = c.base.blue },
    CmpItemKindReference = { fg = c.base.magenta },
    CmpItemKindSnippet = { fg = c.base.green },
    CmpItemKindString = { fg = c.base.yellow },
    CmpItemKindStruct = { fg = c.base.red },
    CmpItemKindText = { fg = c.base.yellow },
    CmpItemKindTypeParameter = { fg = c.base.blue },
    CmpItemKindUnit = { fg = c.base.magenta },
    CmpItemKindVariable = { fg = c.base.cyan },
  }
end

return M
