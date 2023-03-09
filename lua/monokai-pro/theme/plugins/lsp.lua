local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    -- Neovim 0.6+
    DiagnosticError = { fg = c.inputValidation.errorForeground },
    DiagnosticWarn = { fg = c.inputValidation.warningForeground },
    DiagnosticInfo = { fg = c.inputValidation.infoForeground },
    DiagnosticHint = { fg = c.inputValidation.infoForeground },
    DiagnosticSignError = { fg = c.inputValidation.errorForeground },
    DiagnosticSignWarn = { fg = c.inputValidation.warningForeground },
    DiagnosticSignInfo = { fg = c.inputValidation.infoForeground },
    DiagnosticSignHint = { fg = c.inputValidation.infoForeground },
    DiagnosticVirtualTextError = {
      bg = c.errorLens.errorBackground,
      fg = c.errorLens.errorForeground,
    },
    DiagnosticVirtualTextWarn = {
      bg = c.errorLens.warningBackground,
      fg = c.errorLens.warningForeground,
    },
    DiagnosticVirtualTextInfo = {
      bg = c.errorLens.infoBackground,
      fg = c.errorLens.infoForeground,
    },
    DiagnosticVirtualTextHint = {
      bg = c.errorLens.hintBackground,
      fg = c.errorLens.hintForeground,
    },
    DiagnosticUnderlineError = {
      sp = c.inputValidation.errorBorder,
      undercurl = true,
    },
    DiagnosticUnderlineWarn = {
      sp = c.inputValidation.warningBorder,
      undercurl = true,
    },
    DiagnosticUnderlineInfo = {
      sp = c.inputValidation.infoBorder,
      undercurl = true,
    },
    DiagnosticUnderlineHint = {
      sp = c.inputValidation.infoBorder,
      undercurl = true,
    },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.interface"] = { link = "Identifier" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.function"] = { fg = c.base.blue },
    ["@lsp.type.method"] = { fg = c.base.green },
    ["@lsp.typemod.variable.global"] = { fg = c.base.blue },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.base.blue },
    ["@lsp.mod.readonly"] = { fg = c.base.magenta },
    ["@lsp.typemod.function.declaration"] = { fg = c.base.green },
  }
end

return M
