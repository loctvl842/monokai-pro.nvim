local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
        return {
                DashboardHeader = { fg = c.base.dimmed1 },
                DashboardShortcut = { fg = c.base.yellow },
                DashboardFooter = { fg = c.base.dimmed1 },
                DashboardCenter = { fg = c.base.magenta },
        }
end

return M
