---@type MonokaiPro.PluginSpec
return {
  name = "stevearc/aerial.nvim",
  lazy = { module = "aerial" },

  highlights = function(c)
    -- stylua: ignore
    return {
      AerialLine          = { bg = c.editor.selectionHighlightBackground },
      AerialArray         = { fg = c.base.magenta },
      AerialBoolean       = { fg = c.base.magenta },
      AerialClass         = { fg = c.base.cyan },
      AerialConstant      = { fg = c.base.magenta },
      AerialConstructor   = { fg = c.base.green },
      AerialEnum          = { fg = c.base.cyan },
      AerialEnumMember    = { fg = c.base.magenta },
      AerialEvent         = { fg = c.base.cyan },
      AerialField         = { fg = c.base.white },
      AerialFile          = { fg = c.base.green },
      AerialFunction      = { fg = c.base.green },
      AerialInterface     = { fg = c.base.green },
      AerialKey           = { fg = c.base.magenta },
      AerialMethod        = { fg = c.base.green },
      AerialModule        = { fg = c.base.cyan },
      AerialNamespace     = { fg = c.base.white },
      AerialNull          = { fg = c.base.red },
      AerialNumber        = { fg = c.base.magenta },
      AerialObject        = { fg = c.base.magenta },
      AerialOperator      = { fg = c.base.red },
      AerialPackage       = { fg = c.base.cyan },
      AerialProperty      = { fg = c.base.cyan },
      AerialString        = { fg = c.base.yellow },
      AerialStruct        = { fg = c.base.cyan },
      AerialTypeParameter = { fg = c.base.red },
      AerialVariable      = { fg = c.base.white },
    }
  end,
}
