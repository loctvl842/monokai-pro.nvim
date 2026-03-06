---@type MonokaiPro.PluginSpec
return {
  name = "HiPhish/rainbow-delimiters.nvim",
  lazy = { module = "rainbow-delimiters.setup" },

  highlights = function(c)
    return {
      RainbowDelimiterRed = { fg = c.base.red },
      RainbowDelimiterOrange = { fg = c.base.blue },
      RainbowDelimiterYellow = { fg = c.base.yellow },
      RainbowDelimiterGreen = { fg = c.base.green },
      RainbowDelimiterCyan = { fg = c.base.cyan },
      RainbowDelimiterViolet = { fg = c.base.magenta },
    }
  end,
}
