local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    RainbowDelimiterRed = { fg = c.base.red },
    RainbowDelimiterYellow = { fg = c.base.yellow },
    RainbowDelimiterBlue = { fg = c.base.cyan },
    RainbowDelimiterOrange = { fg = c.base.blue },
    RainbowDelimiterGreen = { fg = c.base.green },
    RainbowDelimiterViolet = { fg = c.base.magenta },
    RainbowDelimiterCyan = { fg = c.base.cyan },
  }
end

return M
