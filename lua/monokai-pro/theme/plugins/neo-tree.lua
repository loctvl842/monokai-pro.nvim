local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "neo-tree")
  local sidebar_bg = isBackgroundClear and c.editor.background or c.sideBar.background
  return {
    NeoTreeNormal = { bg = sidebar_bg, fg = c.sideBar.foreground },
    NeoTreeEndOfBuffer = {
      bg = sidebar_bg,
      fg = sidebar_bg,
    },
    NeoTreeNormalNC = { bg = sidebar_bg, fg = c.sideBar.foreground },
    NeoTreeSignColumn = { bg = sidebar_bg, fg = c.sideBar.foreground },
    NeoTreeStatusLine = { bg = sidebar_bg, fg = sidebar_bg },
    NeoTreeCursor = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
    },
    NeoTreeCursorLine = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
      bold = true,
    },
    NeoTreeCursorLineSign = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
    },
    NeoTreeWinSeparator = {
      bg = c.editor.background,
      fg = isBackgroundClear and c.base.black or c.editor.background,
    },
    NeoTreeRootName = {
      -- bg = C.sideBarSectionHeader.background,
      fg = c.sideBarSectionHeader.foreground,
      bold = true,
    },
    NeoTreeDirectoryIcon = { fg = c.sideBar.foreground },
    NeoTreeDirectoryName = { fg = c.sideBar.foreground },
    NeoTreeGitAdded = { fg = c.gitDecoration.addedResourceForeground },
    NeoTreeGitConflict = { fg = c.gitDecoration.conflictingResourceForeground },
    NeoTreeGitDeleted = { fg = c.gitDecoration.deletedResourceForeground },
    NeoTreeGitIgnored = { fg = c.gitDecoration.ignoredResourceForeground },
    NeoTreeGitModified = { fg = c.gitDecoration.modifiedResourceForeground }, -- unstaged
    NeoTreeGitStaged = { fg = c.gitDecoration.stageModifiedResourceForeground },
    NeoTreeGitRenamed = { fg = c.gitDecoration.untrackedResourceForeground },
    NeoTreeGitUntracked = { fg = c.gitDecoration.untrackedResourceForeground },
    NeoTreeIndentMarker = { link = "IndentBlanklineChar" },
    NeoTreeExpander = { link = "NeoTreeDirectoryIcon" },
    NeoTreeFloatNormal = {
      bg = c.editorSuggestWidget.background,
      fg = c.editorSuggestWidget.foreground,
    },
    NeoTreeFloatBorder = {
      bg = sidebar_bg,
      fg = c.editorSuggestWidget.background,
    },
    NeoTreeTitleBar = {
      bg = sidebar_bg,
      fg = c.base.yellow,
      bold = true,
    },
    NeoTreeFloatTitle = {
      bg = c.base.yellow,
      fg = sidebar_bg,
      bold = true,
    },
    NeoTreeTabActive = {
      bg = c.button.hoverbackground,
      fg = c.button.foreground,
      bold = true,
    },
    NeoTreeTabInactive = { bg = c.button.background, fg = c.button.foreground },
    NeoTreeTabSeparatorActive = {
      bg = c.button.hoverbackground,
      fg = c.button.separator,
    },
    NeoTreeTabSeparatorInactive = {
      bg = c.button.background,
      fg = c.button.separator,
    },
  }
end

return M
