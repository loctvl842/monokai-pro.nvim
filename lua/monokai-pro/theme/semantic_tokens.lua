local M = {}

--- @param c table The color palette
M.setup = function(c, _, _)
  return {
    ["@function"] = { fg = c.base.blue },
    ["@method"] = { fg = c.base.green },
    ["@readonly"] = { fg = c.base.magenta },
    ["@local"] = { fg = c.base.white },
    ["@modifier"] = { fg = c.base.red, italic = true },
    ["@namespace"] = { fg = c.base.red, italic = true },
    ["@interface"] = { fg = c.base.cyan, italic = true },
    ["@global"] = { fg = c.base.blue },
  }
end

return M
