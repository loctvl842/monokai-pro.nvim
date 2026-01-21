---@type MonokaiPro.PluginSpec
return {
  name = "lsp",

  highlights = function(c)
    -- stylua: ignore
    return {
      -- Diagnostics
      DiagnosticError = { fg = c.inputValidation.errorForeground },
      DiagnosticWarn  = { fg = c.inputValidation.warningForeground },
      DiagnosticInfo  = { fg = c.inputValidation.infoForeground },
      DiagnosticHint  = { fg = c.inputValidation.infoForeground },

      -- Diagnostic signs
      DiagnosticSignError = { fg = c.inputValidation.errorForeground },
      DiagnosticSignWarn  = { fg = c.inputValidation.warningForeground },
      DiagnosticSignInfo  = { fg = c.inputValidation.infoForeground },
      DiagnosticSignHint  = { fg = c.inputValidation.infoForeground },

      -- Virtual text
      DiagnosticVirtualTextError = { bg = c.errorLens.errorBackground, fg = c.errorLens.errorForeground },
      DiagnosticVirtualTextWarn  = { bg = c.errorLens.warningBackground, fg = c.errorLens.warningForeground },
      DiagnosticVirtualTextInfo  = { bg = c.errorLens.infoBackground, fg = c.errorLens.infoForeground },
      DiagnosticVirtualTextHint  = { bg = c.errorLens.hintBackground, fg = c.errorLens.hintForeground },

      -- Underlines
      DiagnosticUnderlineError = { sp = c.inputValidation.errorBorder, undercurl = true },
      DiagnosticUnderlineWarn  = { sp = c.inputValidation.warningBorder, undercurl = true },
      DiagnosticUnderlineInfo  = { sp = c.inputValidation.infoBorder, undercurl = true },
      DiagnosticUnderlineHint  = { sp = c.inputValidation.infoBorder, undercurl = true },
      DiagnosticUnnecessary    = { sp = c.inputValidation.infoBorder, undercurl = true },

      -- Inlay hints
      LspInlayHint = { bg = c.editorInlayHint.background, fg = c.editorInlayHint.foreground },

      -- References
      LspReferenceRead  = { bg = c.editor.wordHighlightBackground },
      LspReferenceText  = { bg = c.editor.selectionHighlightBackground },
      LspReferenceWrite = { bg = c.editor.wordHighlightStrongBackground },
    }
  end,
}
