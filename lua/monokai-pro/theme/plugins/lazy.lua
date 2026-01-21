local colors = require("monokai-pro.colors")

---@type MonokaiPro.PluginSpec
return {
  name = "folke/lazy.nvim",
  lazy = { module = "lazy" },

  highlights = function(c)
    local lazy_bg = colors.lighten(c.sideBar.background, 5)

    -- stylua: ignore
    return {
      LazyButton       = { fg = c.button.foreground, bg = c.button.background },
      LazyComment      = { fg = c.base.yellow },
      LazyH1           = { fg = c.base.black, bg = c.base.yellow, bold = true },
      LazyH2           = { fg = c.base.green, bold = true },
      LazyButtonActive = { fg = c.button.foreground, bg = c.button.hoverBackground, bold = true },
      LazyNormal       = { fg = colors.lighten(c.sideBar.foreground, 5), bg = lazy_bg },
      LazyProgressDone = { fg = c.tab.activeBorder, bg = lazy_bg },
      LazyProgressTodo = { fg = c.tab.unfocusedActiveBorder, bg = lazy_bg },
      LazyProp         = { fg = c.base.green, bg = lazy_bg },
      LazyUrl          = { fg = c.base.cyan },
      LazyDir          = { link = "LazyUrl" },
      LazySpecial      = { fg = c.base.yellow, bold = true },
      LazyReasonStart  = { fg = c.base.green },
      LazyReasonCmd    = { fg = c.base.cyan },
    }
  end,
}
