---@type MonokaiPro.PluginSpec
return {
  name = "goolord/alpha-nvim",
  lazy = { module = "alpha" },

  highlights = function(c)
    return {
      AlphaButton = { fg = c.base.magenta },
      AlphaFooter = { fg = c.base.blue },
      AlphaHeader = { fg = c.base.yellow },
    }
  end,
}
