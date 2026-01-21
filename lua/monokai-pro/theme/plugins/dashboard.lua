---@type MonokaiPro.PluginSpec
return {
  name = "nvimdev/dashboard-nvim",
  lazy = { module = "dashboard", event = "VimEnter" },

  highlights = function(c)
    -- stylua: ignore
    return {
      -- General
      DashboardHeader       = { fg = c.base.yellow },
      DashboardFooter       = { fg = c.base.green },
      -- Doome theme
      DashboardKey          = { fg = c.base.cyan },
      DashboardDesc         = { fg = c.base.dimmed1 },
      DashboardIcon         = { fg = c.base.blue },
      -- Hyper theme
      DashboardProjectTitle = { fg = c.base.yellow },
      DashboardMruTitle     = { fg = c.base.yellow },
      DashboardFiles        = { fg = c.base.blue },
      DashboardShortcut     = { fg = c.base.magenta },
    }
  end,
}
