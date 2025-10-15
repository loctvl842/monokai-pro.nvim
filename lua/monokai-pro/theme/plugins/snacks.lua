local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, hp)
  return {
    SnacksDashboardNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksDashboardDesc = { fg = c.base.dimmed1 },
    SnacksDashboardIcon = { fg = c.base.blue },
    SnacksPickerDir = { fg = c.base.dimmed1 },
    SnacksPickerFile = { fg = c.base.white },
    SnacksWinKeySep = { fg = c.base.dimmed1 },
    SnacksImageLoading = { fg = c.base.dimmed1 },
    SnacksPickerTotals = { fg = c.base.dimmed1 },
    SnacksPickerBufFlags = { fg = c.base.dimmed1 },
    SnacksPickerKeymapRhs = { fg = c.base.dimmed1 },
    SnacksPickerPathHidden = { fg = c.base.dimmed1 },
    SnacksPickerUnselected = { fg = c.base.dimmed1 },
    SnacksPickerPathIgnored = { fg = c.base.dimmed1 },
    SnacksPickerGitStatusIngnored = { fg = c.base.dimmed1 },
    SnacksPickerGitStatusUntracked = { fg = c.base.dimmed1 },
  }
end

return M
