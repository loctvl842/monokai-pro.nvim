local M = {}

--- @param c Colorscheme The color palette
--- @param hp Helper
M.setup = function(c, _, hp)
  return {
    LazyButton = {
      bg = hp.lighten(c.button.background, 20),
      fg = hp.lighten(c.button.foreground, 20),
    },
    LazyComment = { fg = c.base.yellow },
    LazyH1 = { bg = c.base.yellow, fg = c.base.black, bold = true },
    LazyH2 = { fg = c.base.green, bold = true },
    LazyButtonActive = {
      bg = c.button.hoverBackground,
      fg = c.button.foreground,
      bold = true,
    },
    LazyNormal = {
      bg = c.editorSuggestWidget.background,
      fg = c.editorSuggestWidget.foreground,
    },
    LazyProgressDone = { bg = c.sideBar.background, fg = c.tab.activeBorder },
    LazyProgressTodo = {
      bg = c.sideBar.background,
      fg = c.tab.unfocusedActiveBorder,
    },
    LazyProp = {
      bg = c.sideBar.background,
      fg = c.base.green,
    },
    LazyUrl = { fg = c.base.cyan },
    LazyDir = { link = "LazyUrl" },
    LazySpecial = { fg = c.base.yellow, bold = true },
  }
end

return M
