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
  }
end

return M
