---@type MonokaiPro.PluginSpec
return {
  name = "nvim-tree/nvim-tree.lua",
  lazy = { module = "nvim-tree" },

  highlights = function(c, config)
    local isBackgroundClear = vim.tbl_contains(config.background_clear, "nvim-tree")
    local sidebar_bg = isBackgroundClear and c.editor.background or c.sideBar.background
    -- stylua: ignore
    return {
      NvimTreeFolderIcon       = { fg = c.sideBar.foreground },

      NvimTreeIndentMarker     = { link = "IndentBlanklineChar" },

      NvimTreeNormal           = { bg = sidebar_bg, fg = c.sideBar.foreground },
      NvimTreeEndOfBuffer      = { bg = sidebar_bg, fg = sidebar_bg },
      NvimTreeWinSeparator     = { bg = c.editor.background, fg = isBackgroundClear and c.base.black or c.editor.background },

      NvimTreeFolderName       = { fg = c.sideBar.foreground },
      NvimTreeOpenedFolderName = { fg = c.sideBar.foreground, italic = true },
      NvimTreeEmptyFolderName  = { fg = c.sideBar.foreground, italic = true },
      NvimTreeImageFile        = { fg = c.base.white },
      NvimTreeSpecialFile      = { fg = c.base.white },
      NvimTreeCursorLine       = { bg = c.list.activeSelectionBackground },

      NvimTreeGitIgnored       = { fg = c.gitDecoration.ignoredResourceForeground },
      NvimTreeGitignoreIcon    = { fg = c.gitDecoration.ignoredResourceForeground },
      NvimTreeGitStaged        = { fg = c.gitDecoration.stageModifiedResourceForeground },
      NvimTreeGitDirty         = { fg = c.gitDecoration.modifiedResourceForeground }, -- unstaged/modified
      NvimTreeGitNew           = { fg = c.gitDecoration.untrackedResourceForeground },
      NvimTreeGitRenamed       = { fg = c.gitDecoration.untrackedResourceForeground },
      NvimTreeGitDeleted       = { fg = c.gitDecoration.deletedResourceForeground },
      NvimTreeGitMerge         = { fg = c.gitDecoration.conflictingResourceForeground },

      NvimTreeSymlink          = { fg = c.base.white },
      NvimTreeRootFolder       = { fg = c.sideBarSectionHeader.foreground, bold = true },
      NvimTreeExecFile         = { fg = c.base.green },
    }
  end,
}
