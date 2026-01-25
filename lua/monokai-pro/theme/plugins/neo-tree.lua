---@type MonokaiPro.PluginSpec
return {
  name = "nvim-neo-tree/neo-tree.nvim",
  lazy = { module = "neo-tree" },

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "neo-tree")
    local sidebar_bg = is_clear and c.editor.background or c.sideBar.background

    -- stylua: ignore
    return {
      NeoTreeNormal               = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NeoTreeEndOfBuffer          = { fg = sidebar_bg, bg = sidebar_bg },
      NeoTreeNormalNC             = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NeoTreeSignColumn           = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NeoTreeStatusLine           = { fg = sidebar_bg, bg = sidebar_bg },
      NeoTreeCursor               = { bg = c.list.activeSelectionBackground },
      NeoTreeCursorLine           = { bg = c.list.activeSelectionBackground, bold = true },
      NeoTreeCursorLineSign       = { bg = c.list.activeSelectionBackground },
      NeoTreeWinSeparator         = { fg = is_clear and c.base.black or c.editor.background, bg = c.editor.background },
      NeoTreeRootName             = { fg = c.sideBarSectionHeader.foreground, bold = true },
      NeoTreeDirectoryIcon        = { fg = c.sideBar.foreground },
      NeoTreeDirectoryName        = { fg = c.sideBar.foreground },
      NeoTreeGitAdded             = { fg = c.gitDecoration.addedResourceForeground },
      NeoTreeGitConflict          = { fg = c.gitDecoration.conflictingResourceForeground },
      NeoTreeGitDeleted           = { fg = c.gitDecoration.deletedResourceForeground },
      NeoTreeGitIgnored           = { fg = c.gitDecoration.ignoredResourceForeground },
      NeoTreeGitModified          = { fg = c.gitDecoration.modifiedResourceForeground },
      NeoTreeGitStaged            = { fg = c.gitDecoration.stageModifiedResourceForeground },
      NeoTreeGitRenamed           = { fg = c.gitDecoration.untrackedResourceForeground },
      NeoTreeGitUntracked         = { fg = c.gitDecoration.untrackedResourceForeground },
      NeoTreeIndentMarker         = { fg = c.editorIndentGuide.background },
      NeoTreeExpander             = { link = "NeoTreeDirectoryIcon" },
      NeoTreeFloatNormal          = { fg = c.editorSuggestWidget.foreground, bg = c.editorSuggestWidget.background },
      NeoTreeFloatBorder          = { fg = c.editorSuggestWidget.background, bg = sidebar_bg },
      NeoTreeTitleBar             = { fg = c.base.yellow, bg = c.editorSuggestWidget.background, bold = true },
      NeoTreeFloatTitle           = { fg = c.base.yellow, bg = sidebar_bg, bold = true },
      NeoTreeTabActive            = { fg = c.button.foreground, bg = c.button.hoverBackground, bold = true },
      NeoTreeTabInactive          = { bg = c.button.background, fg = c.button.foreground },
      NeoTreeTabSeparatorActive   = { fg = c.button.separator, bg = c.button.hoverBackground },
      NeoTreeTabSeparatorInactive = { fg = c.button.separator, bg = c.button.background },
    }
  end,
}
