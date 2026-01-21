---@type MonokaiPro.PluginSpec
return {
  name = "mason-org/mason.nvim",
  lazy = { module = "mason" },

  highlights = function(c)
    -- stylua: ignore
    return {
      MasonNormal                      = { link = "LazyNormal" },
      MasonHeader                      = { link = "LazyH1" },
      MasonHeaderSecondary             = { fg = c.base.black, bg = c.base.yellow, bold = true },
      MasonHighlight                   = { fg = c.base.cyan },
      MasonHighlightBlock              = { fg  = "#222222", bg = c.base.yellow },
      MasonHighlightBlockBold          = { link = "LazyH1" },
      MasonHighlightSecondary          = { fg = c.base.blue },
      MasonHighlightBlockSecondary     = { fg = c.base.black, bg = c.base.blue },
      MasonHighlightBlockBoldSecondary = { fg = c.base.black, bg = c.base.blue, bold = true },
      MasonLink                        = { link = "LazyUrl" },
      MasonMuted                       = { fg = c.base.dimmed2 },
      MasonMutedBlock                  = { link = "LazyButton" },
      MasonMutedBlockBold              = { fg = c.base.black, bg = c.base.dimmed2, bold = true },
      MasonError                       = { fg = c.base.red },
      MasonHeading                     = { link = "LazyH2" },
    }
  end,
}
