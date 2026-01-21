local colors = require("monokai-pro.colors")

---@type MonokaiPro.PluginSpec
return {
  name = "hrsh7th/nvim-cmp",
  lazy = { module = "cmp", event = { "InsertEnter", "CmdlineEnter" } },

  highlights = function(c)
    -- stylua: ignore
    return {
      CmpItemAbbrMatch         = { fg = c.editorSuggestWidget.highlightForeground, bold = true },
      CmpItemAbbrMatchFuzzy    = { link = "CmpItemAbbrMatch" },
      CmpItemMenu              = { fg = colors.lighten(c.editorSuggestWidget.foreground, -15) },
      CmpItemAbbr              = { fg = c.editorSuggestWidget.foreground },
      CmpItemAbbrDeprecated    = { fg = c.editorSuggestWidget.foreground, strikethrough = true },

      -- Kind icons
      CmpItemKindArray         = { fg = c.base.red },
      CmpItemKindBoolean       = { fg = c.base.red },
      CmpItemKindClass         = { fg = c.base.cyan },
      CmpItemKindColor         = { fg = c.base.magenta },
      CmpItemKindConstant      = { fg = c.base.magenta },
      CmpItemKindConstructor   = { fg = c.base.green },
      CmpItemKindEnum          = { fg = c.base.blue },
      CmpItemKindEnumMember    = { fg = c.base.blue },
      CmpItemKindEvent         = { fg = c.base.blue },
      CmpItemKindField         = { fg = c.base.blue },
      CmpItemKindFile          = { fg = c.editorLineNumber.activeForeground },
      CmpItemKindFolder        = { fg = c.editorLineNumber.activeForeground },
      CmpItemKindFunction      = { fg = c.base.green },
      CmpItemKindInterface     = { fg = c.base.cyan },
      CmpItemKindKey           = { fg = c.base.blue },
      CmpItemKindKeyword       = { fg = c.base.red },
      CmpItemKindMethod        = { fg = c.base.green },
      CmpItemKindModule        = { fg = c.base.cyan },
      CmpItemKindNamespace     = { fg = c.base.cyan },
      CmpItemKindNull          = { fg = c.base.magenta },
      CmpItemKindNumber        = { fg = c.base.magenta },
      CmpItemKindObject        = { fg = c.base.cyan },
      CmpItemKindOperator      = { fg = c.base.red },
      CmpItemKindPackage       = { fg = c.base.magenta },
      CmpItemKindProperty      = { fg = c.base.blue },
      CmpItemKindReference     = { fg = c.base.magenta },
      CmpItemKindSnippet       = { fg = c.base.green },
      CmpItemKindString        = { fg = c.base.yellow },
      CmpItemKindStruct        = { fg = c.base.red },
      CmpItemKindText          = { fg = c.base.yellow },
      CmpItemKindTypeParameter = { fg = c.base.blue },
      CmpItemKindUnit          = { fg = c.base.magenta },
      CmpItemKindVariable      = { fg = c.base.cyan },
    }
  end,
}
