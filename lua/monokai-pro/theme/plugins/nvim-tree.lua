local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    NvimTreeFolderIcon = { fg = c.sideBar.foreground },

    NvimTreeIndentMarker = { link = "IndentBlanklineChar" },

    NvimTreeNormal = { bg = c.sideBar.background, fg = c.sideBar.foreground },
    NvimTreeEndOfBuffer = {
      bg = c.sideBar.background,
      fg = c.sideBar.background,
    },
    NvimTreeWinSeparator = {
      bg = c.editor.background,
      fg = c.editor.background,
    },

    NvimTreeFolderName = { fg = c.sideBar.foreground },
    NvimTreeOpenedFolderName = { fg = c.sideBar.foreground, italic = true },
    NvimTreeEmptyFolderName = { fg = c.sideBar.foreground, italic = true },
    NvimTreeImageFile = { fg = c.base.white },
    NvimTreeSpecialFile = { fg = c.base.white },
    NvimTreeCursorLine = {
      bg = c.list.activeSelectionBackground,
      bg_base = c.sideBar.background,
    },

    NvimTreeGitIgnored = { fg = c.gitDecoration.ignoredResourceForeground },
    NvimTreeGitignoreIcon = { fg = c.gitDecoration.ignoredResourceForeground },
    NvimTreeGitStaged = { fg = c.gitDecoration.stageModifiedResourceForeground },
    NvimTreeGitDirty = { fg = c.gitDecoration.modifiedResourceForeground }, -- unstaged/modified
    NvimTreeGitNew = { fg = c.gitDecoration.untrackedResourceForeground },
    NvimTreeGitRenamed = { fg = c.gitDecoration.untrackedResourceForeground },
    NvimTreeGitDeleted = { fg = c.gitDecoration.deletedResourceForeground },
    NvimTreeGitMerge = { fg = c.gitDecoration.conflictingResourceForeground },

    NvimTreeSymlink = { fg = c.base.white },
    NvimTreeRootFolder = {
      fg = c.sideBarSectionHeader.foreground,
      bold = true,
    },
    NvimTreeExecFile = { fg = c.base.green },
  }
end

return M
