---@class MonokaiPro.Scheme.Editor
---@field background string
---@field foreground string
---@field lineHighlightBackground string
---@field selectionBackground string
---@field findMatchBackground string
---@field findMatchBorder string
---@field findMatchHighlightBackground string
---@field foldBackground string
---@field wordHighlightBackground string
---@field selectionHighlightBackground string
---@field wordHighlightStrongBackground string

---@class MonokaiPro.Scheme.EditorLineNumber
---@field foreground string
---@field activeForeground string

---@class MonokaiPro.Scheme.EditorHoverWidget
---@field background string
---@field border string

---@class MonokaiPro.Scheme.EditorSuggestWidget
---@field background string
---@field border string
---@field foreground string
---@field highlightForeground string
---@field selectedBackground string

---@class MonokaiPro.Scheme.EditorIndentGuide
---@field background string
---@field activeBackground string

---@class MonokaiPro.Scheme.EditorInlayHint
---@field background string
---@field foreground string

---@class MonokaiPro.Scheme.EditorGutter
---@field addedBackground string
---@field deletedBackground string
---@field modifiedBackground string

---@class MonokaiPro.Scheme.SideBar
---@field background string
---@field foreground string

---@class MonokaiPro.Scheme.SideBarTitle
---@field foreground string

---@class MonokaiPro.Scheme.List
---@field activeSelectionBackground string

---@class MonokaiPro.Scheme.SideBarSectionHeader
---@field background string
---@field foreground string

---@class MonokaiPro.Scheme.Breadcrumb
---@field foreground string

---@class MonokaiPro.Scheme.Button
---@field background string
---@field foreground string
---@field hoverBackground string
---@field separator string

---@class MonokaiPro.Scheme.ScrollbarSlider
---@field hoverBackground string

---@class MonokaiPro.Scheme.GitDecoration
---@field addedResourceForeground string
---@field conflictingResourceForeground string
---@field deletedResourceForeground string
---@field ignoredResourceForeground string
---@field modifiedResourceForeground string
---@field stageDeletedResourceForeground string
---@field stageModifiedResourceForeground string
---@field untrackedResourceForeground string

---@class MonokaiPro.Scheme.InputValidation
---@field errorBackground string
---@field errorBorder string
---@field errorForeground string
---@field infoBackground string
---@field infoBorder string
---@field infoForeground string
---@field warningBackground string
---@field warningBorder string
---@field warningForeground string

---@class MonokaiPro.Scheme.ErrorLens
---@field errorBackground string
---@field errorForeground string
---@field warningBackground string
---@field warningForeground string
---@field infoBackground string
---@field infoForeground string
---@field hintBackground string
---@field hintForeground string

---@class MonokaiPro.Scheme.Terminal
---@field background string
---@field foreground string

---@class MonokaiPro.Scheme.TerminalCursor
---@field background string
---@field foreground string

---@class MonokaiPro.Scheme.EditorGroupHeader
---@field tabsBackground string
---@field tabsBorder string

---@class MonokaiPro.Scheme.Tab
---@field activeBackground string
---@field activeBorder string
---@field activeForeground string
---@field inactiveBackground string
---@field inactiveForeground string
---@field unfocusedActiveBackground string
---@field unfocusedActiveBorder string
---@field unfocusedActiveForeground string

---@class MonokaiPro.Scheme.StatusBar
---@field background string
---@field foreground string
---@field activeForeground string

---@class MonokaiPro.Scheme.DiffEditor
---@field insertedLineBackground string
---@field removedLineBackground string
---@field modifiedLineBackground string

---@class MonokaiPro.Scheme.DiffEditorOverview
---@field insertedForeground string
---@field removedForeground string
---@field modifiedForeground string

---@class MonokaiPro.Scheme.Notifications
---@field background string
---@field border string
---@field foreground string

---@class MonokaiPro.Scheme.NotificationsErrorIcon
---@field foreground string

---@class MonokaiPro.Scheme.NotificationsInfoIcon
---@field foreground string

---@class MonokaiPro.Scheme.NotificationsWarningIcon
---@field foreground string

---@class MonokaiPro.Scheme.Base
---@field dark string
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field dimmed1 string
---@field dimmed2 string
---@field dimmed3 string
---@field dimmed4 string
---@field dimmed5 string

---@class MonokaiPro.Scheme
---@field editor MonokaiPro.Scheme.Editor
---@field editorLineNumber MonokaiPro.Scheme.EditorLineNumber
---@field editorHoverWidget MonokaiPro.Scheme.EditorHoverWidget
---@field editorSuggestWidget MonokaiPro.Scheme.EditorSuggestWidget
---@field editorIndentGuide MonokaiPro.Scheme.EditorIndentGuide
---@field editorInlayHint MonokaiPro.Scheme.EditorInlayHint
---@field editorGutter MonokaiPro.Scheme.EditorGutter
---@field sideBar MonokaiPro.Scheme.SideBar
---@field sideBarTitle MonokaiPro.Scheme.SideBarTitle
---@field list MonokaiPro.Scheme.List
---@field sideBarSectionHeader MonokaiPro.Scheme.SideBarSectionHeader
---@field breadcrumb MonokaiPro.Scheme.Breadcrumb
---@field button MonokaiPro.Scheme.Button
---@field scrollbarSlider MonokaiPro.Scheme.ScrollbarSlider
---@field gitDecoration MonokaiPro.Scheme.GitDecoration
---@field inputValidation MonokaiPro.Scheme.InputValidation
---@field errorLens MonokaiPro.Scheme.ErrorLens
---@field terminal MonokaiPro.Scheme.Terminal
---@field terminalCursor MonokaiPro.Scheme.TerminalCursor
---@field editorGroupHeader MonokaiPro.Scheme.EditorGroupHeader
---@field tab MonokaiPro.Scheme.Tab
---@field statusBar MonokaiPro.Scheme.StatusBar
---@field diffEditor MonokaiPro.Scheme.DiffEditor
---@field diffEditorOverview MonokaiPro.Scheme.DiffEditorOverview
---@field notifications MonokaiPro.Scheme.Notifications
---@field notificationsErrorIcon MonokaiPro.Scheme.NotificationsErrorIcon
---@field notificationsInfoIcon MonokaiPro.Scheme.NotificationsInfoIcon
---@field notificationsWarningIcon MonokaiPro.Scheme.NotificationsWarningIcon
---@field base MonokaiPro.Scheme.Base

local colors = require("monokai-pro.colors")

---@class MonokaiPro.SchemeModule
local M = {}

--- Build the color scheme from a palette
---@param palette MonokaiPro.Palette
---@param config MonokaiPro.Config
---@return MonokaiPro.Scheme
function M.build(palette, config)
  local p = palette
  local transparent = config.transparent_background

  ---@type MonokaiPro.Scheme
  local scheme = {}

  -- Editor colors
  scheme.editor = {
    background = transparent and "NONE" or p.background,
    foreground = p.text,
    lineHighlightBackground = colors.blend(p.text, 0.05, p.background),
    selectionBackground = colors.blend(p.dimmed1, 0.15, p.background),
    findMatchBackground = colors.blend(p.text, 0.15, p.background),
    findMatchBorder = p.accent3,
    findMatchHighlightBackground = colors.blend(p.text, 0.15, p.background),
    foldBackground = colors.blend(p.text, 0.1, p.background),
    wordHighlightBackground = colors.blend(p.text, 0.15, p.background),
    selectionHighlightBackground = colors.blend(p.text, 0.15, p.background),
    wordHighlightStrongBackground = colors.blend(p.text, 0.15, p.background),
  }

  scheme.editorLineNumber = {
    foreground = p.dimmed4,
    activeForeground = p.dimmed1,
  }

  scheme.editorHoverWidget = {
    background = p.dimmed5,
    border = p.background,
  }

  scheme.editorSuggestWidget = {
    background = p.dimmed5,
    border = p.dimmed5,
    foreground = p.dimmed1,
    highlightForeground = p.text,
    selectedBackground = p.dimmed3,
  }

  scheme.editorIndentGuide = {
    background = p.dimmed5,
    activeBackground = p.dimmed3,
  }

  scheme.editorInlayHint = {
    background = p.dimmed5,
    foreground = p.dimmed2,
  }

  scheme.editorGutter = {
    addedBackground = p.accent4,
    deletedBackground = p.accent1,
    modifiedBackground = p.accent2,
  }

  -- Sidebar colors
  scheme.sideBar = {
    background = p.dark1,
    foreground = p.dimmed2,
  }

  scheme.sideBarTitle = {
    foreground = p.dimmed4,
  }

  scheme.list = {
    activeSelectionBackground = colors.blend(p.text, 0.11, p.dark1),
  }

  scheme.sideBarSectionHeader = {
    background = p.dark1,
    foreground = p.dimmed1,
  }

  scheme.breadcrumb = {
    foreground = p.dimmed2,
  }

  -- Button colors
  scheme.button = {
    background = p.dimmed5,
    foreground = p.dimmed1,
    hoverBackground = p.dimmed4,
    separator = p.background,
  }

  scheme.scrollbarSlider = {
    hoverBackground = colors.blend(p.dimmed1, 0.15, p.background),
  }

  -- Git colors
  scheme.gitDecoration = {
    addedResourceForeground = p.accent4,
    conflictingResourceForeground = p.accent2,
    deletedResourceForeground = p.accent1,
    ignoredResourceForeground = p.dimmed4,
    modifiedResourceForeground = p.accent3,
    stageDeletedResourceForeground = p.accent1,
    stageModifiedResourceForeground = p.accent3,
    untrackedResourceForeground = p.dimmed2,
  }

  -- Validation colors
  scheme.inputValidation = {
    errorBackground = p.dimmed5,
    errorBorder = p.accent1,
    errorForeground = p.accent1,
    infoBackground = p.dimmed5,
    infoBorder = p.accent5,
    infoForeground = p.accent5,
    warningBackground = p.dimmed5,
    warningBorder = p.accent2,
    warningForeground = p.accent2,
  }

  scheme.errorLens = {
    errorBackground = colors.blend(p.accent1, 0.1, p.background),
    errorForeground = p.accent1,
    warningBackground = colors.blend(p.accent2, 0.1, p.background),
    warningForeground = p.accent2,
    infoBackground = colors.blend(p.accent5, 0.1, p.background),
    infoForeground = p.accent5,
    hintBackground = colors.blend(p.accent5, 0.1, p.background),
    hintForeground = p.accent5,
  }

  -- Terminal colors
  scheme.terminal = {
    background = p.dimmed5,
    foreground = p.text,
  }

  scheme.terminalCursor = {
    background = "#ffffff",
    foreground = p.text,
  }

  -- Tab colors
  scheme.editorGroupHeader = {
    tabsBackground = p.dark1,
    tabsBorder = p.dark1,
  }

  scheme.tab = {
    activeBackground = transparent and "NONE" or p.background,
    activeBorder = p.accent3,
    activeForeground = p.accent3,
    inactiveBackground = colors.lighten(p.background, 15),
    inactiveForeground = p.dimmed2,
    unfocusedActiveBackground = p.background,
    unfocusedActiveBorder = p.dimmed2,
    unfocusedActiveForeground = p.dimmed1,
  }

  -- Status bar colors
  scheme.statusBar = {
    background = p.dark2,
    foreground = p.dimmed3,
    activeForeground = p.dimmed1,
  }

  -- Diff colors
  scheme.diffEditor = {
    insertedLineBackground = colors.blend(p.accent4, 0.1, p.dark1),
    removedLineBackground = colors.blend(p.accent1, 0.1, p.dark1),
    modifiedLineBackground = colors.blend(p.accent2, 0.1, p.dark1),
  }

  scheme.diffEditorOverview = {
    insertedForeground = colors.blend(p.accent4, 0.65, scheme.diffEditor.insertedLineBackground),
    removedForeground = colors.blend(p.accent1, 0.65, scheme.diffEditor.removedLineBackground),
    modifiedForeground = colors.blend(p.accent2, 0.65, scheme.diffEditor.modifiedLineBackground),
  }

  -- Notification colors
  scheme.notifications = {
    background = p.dimmed5,
    border = p.dimmed5,
    foreground = p.dimmed1,
  }

  scheme.notificationsErrorIcon = {
    foreground = p.accent1,
  }

  scheme.notificationsInfoIcon = {
    foreground = p.accent5,
  }

  scheme.notificationsWarningIcon = {
    foreground = p.accent2,
  }

  -- Base semantic colors
  scheme.base = {
    dark = p.dark2,
    black = p.dark1,
    red = p.accent1,
    green = p.accent4,
    yellow = p.accent3,
    blue = p.accent2,
    magenta = p.accent6,
    cyan = p.accent5,
    white = p.text,
    dimmed1 = p.dimmed1,
    dimmed2 = p.dimmed2,
    dimmed3 = p.dimmed3,
    dimmed4 = p.dimmed4,
    dimmed5 = p.dimmed5,
  }

  return scheme
end

return M
