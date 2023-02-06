local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    LazyButton = { bg = c.button.background, fg = c.button.foreground },
    LazyComment = { fg = c.base.yellow },
    LazyH1 = { bg = c.base.yellow, fg = c.base.black, bold = true },
    LazyH2 = { fg = c.base.green, bold = true },
    LazyButtonActive = {
      bg = c.button.hoverBackground,
      fg = c.button.foreground,
      bold = true,
    },
    LazyNormal = { bg = c.sideBar.background, fg = c.sideBar.foreground },
    LazyProgressDone = { bg = c.sideBar.background, fg = c.tab.activeBorder },
    LazyProgressTodo = {
      bg = c.sideBar.background,
      fg = c.tab.unfocusedActiveBorder,
    },
  }
end

return M
