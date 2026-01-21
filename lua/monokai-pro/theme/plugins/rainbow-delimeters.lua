---@type MonokaiPro.PluginSpec
return {
  name = "HiPhish/rainbow-delimiters.nvim",
  lazy = { module = "rainbow-delimiters.setup" },

  highlights = function(c)
    return {
      AlphaButton = { fg = c.base.magenta },
      AlphaFooter = { fg = c.base.blue },
      AlphaHeader = { fg = c.base.yellow },
    }
  end,
}
