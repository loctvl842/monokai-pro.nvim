local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  return {
    -- General
    DashboardHeader = { fg = c.base.yellow },
    DashboardFooter = { fg = c.base.green },
    -- Doome theme
    DashboardKey = { fg = c.base.magenta },
    DashboardDesc = { fg = c.base.blue },
    DashboardIcon = { fg = c.base.red },
    -- Hyper theme
    DashboardProjectTitle = { fg = c.base.yellow },
    DashboardMruTitle = { fg = c.base.yellow },
    DashboardFiles = { fg = c.base.blue },
    DashboardShortcut = { fg = c.base.magenta },
  }
end

return M
