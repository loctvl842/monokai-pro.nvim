local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
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

    DiagnosticVirtualTextError = { fg = c.inputValidation.errorForeground },
    DiagnosticVirtualTextWarn = { fg = c.inputValidation.warningForeground },
    DiagnosticVirtualTextInfo = { fg = c.inputValidation.infoForeground },
    DiagnosticVirtualTextHint = { fg = c.inputValidation.infoForeground },

    DiagnosticUnderlineError = {
      bg = config.diagnostic.background and c.inputValidation.errorBackground
        or nil,
      sp = c.inputValidation.errorBorder,
      undercurl = true,
    },
    DiagnosticUnderlineWarn = {
      bg = config.diagnostic.background and c.inputValidation.warningBackground
        or nil,
      sp = c.inputValidation.warningBorder,
      undercurl = true,
    },
    DiagnosticUnderlineInfo = {
      bg = config.diagnostic.background and c.inputValidation.infoBackground
        or nil,
      sp = c.inputValidation.infoBorder,
      undercurl = true,
    },
    DiagnosticUnderlineHint = {
      bg = config.diagnostic.background and c.inputValidation.infoBackground
        or nil,
      sp = c.inputValidation.infoBorder,
      undercurl = true,
    },
  }
end

return M
