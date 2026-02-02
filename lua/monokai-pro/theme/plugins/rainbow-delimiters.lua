---@type MonokaiPro.PluginSpec
return {
  name = "HiPhish/rainbow-delimiters.nvim",
  lazy = { module = "rainbow-delimiters.setup" },

  highlights = function(c)
    return {
      RainbowDelimiterRed = { fg = c.base.red },
      RainbowDelimiterYellow = { fg = c.base.yellow },
      RainbowDelimiterBlue = { fg = c.base.cyan },
      RainbowDelimiterOrange = { fg = c.base.blue },
      RainbowDelimiterGreen = { fg = c.base.green },
      RainbowDelimiterViolet = { fg = c.base.magenta },
      RainbowDelimiterCyan = { fg = c.base.cyan },
    }
  end,
}
