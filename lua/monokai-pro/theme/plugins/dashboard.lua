local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
        return {
          DashboardHeader = { fg = c.base.yellow },
          DashboardShortcut = { fg = c.base.cyan },
          DashboardFooter = { fg = c.base.yellow },
          DashboardCenter = { fg = c.base.blue },
        }
end

return M
