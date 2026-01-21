---@type MonokaiPro.PluginSpec
return {
  name = "gelguy/wilder.nvim",
  lazy = { module = "wilder" },

  highlights = function(c)
    return {
      WildMenu = {
        bg = c.base.yellow,
        fg = c.base.black,
        bold = true,
        underline = false,
      },
    }
  end,
}
