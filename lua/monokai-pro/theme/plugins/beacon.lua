local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  return {
    Beacon = { bg = c.base.blue },
  }
end

return M
