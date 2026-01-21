---@type MonokaiPro.PluginSpec
return {
  name = "nvim-mini/mini.nvim",
  lazy = { event = "VimEnter" },
  highlights = function(c)
    -- stylua: ignore
    return {
      MiniIndentscopeSymbol     = { fg = c.base.blue },

      -- mini.status
      MiniStatuslineModeNormal  = { fg = c.base.black, bg = c.base.green },
      MiniStatuslineModeInsert  = { fg = c.base.black, bg = c.base.yellow },
      MiniStatuslineModeCommand = { fg = c.base.black, bg = c.base.red },
      MiniStatuslineModeVisual  = { fg = c.base.black, bg = c.base.cyan },
      MiniStatuslineModeReplace = { fg = c.base.black, bg = c.base.blue },
      MiniStatuslineModeOther   = { fg = c.base.black, bg = c.base.white },
    }
  end,
}
