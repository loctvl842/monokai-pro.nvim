local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    packerString = { fg = c.base.blue },
    packerHash = { fg = c.base.blue },
    packerOutput = { fg = c.base.yellow },
    packerRelDate = { fg = c.base.magenta },
    packerSuccess = { fg = c.base.green },
    packerStatusSuccess = { fg = c.base.green },
    packerStatusFail = { fg = c.base.red, bg = c.editorHoverWidget.background },
    packerFail = { fg = c.base.red, bg = c.editorHoverWidget.background },
  }
end

return M
