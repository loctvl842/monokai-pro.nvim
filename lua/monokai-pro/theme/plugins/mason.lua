local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    MasonNormal = { link = "LazyNormal" },
    MasonHeader = { link = "LazyH1" },
    MasonHeaderSecondary = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    MasonHighlight = { fg = c.base.cyan },
    MasonHighlightBlock = { bg = c.base.yellow, fg = "#222222" },
    MasonHighlightBlockBold = { link = "LazyH1" },
    MasonHighlightSecondary = { fg = c.base.blue },
    MasonHighlightBlockSecondary = {
      bg = c.base.blue,
      fg = c.base.black,
    },
    MasonHighlightBlockBoldSecondary = {
      bg = c.base.blue,
      fg = c.base.black,
      bold = true,
    },
    MasonLink = { link = "LazyUrl" },
    MasonMuted = { fg = c.base.dimmed2 },
    MasonMutedBlock = { link = "LazyButton" },
    MasonMutedBlockBold = {
      bg = c.base.dimmed2,
      fg = c.base.black,
      bold = true,
    },
    MasonError = { fg = c.base.red },
    MasonHeading = { link = "LazyH2" },
  }
end

return M
