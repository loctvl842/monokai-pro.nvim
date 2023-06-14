local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    TSRainbowRed = { fg = c.base.red },
    TSRainbowYellow = { fg = c.base.yellow },
    TSRainbowBlue = { fg = c.base.cyan },
    TSRainbowOrange = { fg = c.base.blue },
    TSRainbowGreen = { fg = c.base.green },
    TSRainbowViolet = { fg = c.base.magenta },
    TSRainbowCyan = { fg = c.base.cyan },
  }
end

return M
