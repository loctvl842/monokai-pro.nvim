---@type MonokaiPro.PluginSpec
return {
  name = "folke/snacks.nvim",
  lazy = { module = "snacks" },

  highlights = function(c)
    -- stylua: ignore
    return {
      SnacksDashboardNormal = { bg = c.editor.background, fg = c.editor.foreground },
      SnacksDashboardDesc   = { fg = c.base.dimmed1 },
      SnacksDashboardIcon   = { fg = c.base.blue },
    }
  end,
}
