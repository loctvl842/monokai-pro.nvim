local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  M.underline_selected = config.plugins.bufferline.underline_selected
  M.underline_visible = config.plugins.bufferline.underline_visible
  local normalAlpha = 0.6
  local visibleAlpha = 0.8
  local duplicateAlpha = 0.6
  local countAlpha = 0.75
  local isSelectedUnderlined = config.plugins.bufferline.underline_selected
  local isVisibleUnderlined = config.plugins.bufferline.underline_visible
  local isBold = config.plugins.bufferline.bold
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "bufferline")

  local tabsBackground = isBackgroundClear and c.editor.background or c.editorGroupHeader.tabsBackground
  M.tab = vim.tbl_deep_extend("force", c.tab, isBackgroundClear and {
    activeBackground = hp.lighten(c.tab.activeBackground, 10),
    inactiveBackground = hp.lighten(c.tab.inactiveBackground, 10),
    unfocusedActiveBackground = hp.lighten(c.tab.unfocusedActiveBackground, 10),
  } or {})

  local bufferline_groups = {
    Offset = {
      bg = c.sideBar.background,
      fg = c.sideBarTitle.foreground,
    }, -- Explorer appear in tree setup by bufferline
    BufferLineOffsetSeparator = { link = "NeoTreeWinSeparator" },
    BufferLineFill = {
      bg = tabsBackground,
      sp = c.editorGroupHeader.tabsBorder,
      -- underline = isSelectedUnderlined,
    },
    BufferLineBufferSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineBackground = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineBufferVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha, c.editor.background),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Duplicate
    BufferLineDuplicateSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(M.tab.activeForeground, duplicateAlpha, M.tab.activeBackground),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineDuplicate = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha * duplicateAlpha, M.tab.inactiveBackground),
    },
    BufferLineDuplicateVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha * duplicateAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- CloseButton
    BufferLineCloseButtonSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineCloseButton = {
      bg = M.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineCloseButtonVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.white,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- separator
    BufferLineSeparatorSelected = {
      bg = M.tab.activeBackground,
      fg = tabsBackground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineSeparator = {
      bg = M.tab.inactiveBackground,
      fg = tabsBackground,
    },
    BufferLineSeparatorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = tabsBackground,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Modified
    BufferLineModifiedSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineModified = {
      bg = M.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineModifiedVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.white,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Warning
    BufferLineWarningSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.warningForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineWarning = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineWarningVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Warning count
    BufferLineWarningDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.warningForeground, countAlpha, c.editor.background),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineWarningDiagnostic = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha * countAlpha, M.tab.inactiveBackground),
    },
    BufferLineWarningDiagnosticVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha * countAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Error
    BufferLineErrorSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.errorForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineError = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineErrorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Error count
    BufferLineErrorDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.errorForeground, countAlpha, c.editor.background),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
      bold = true,
    },
    BufferLineErrorDiagnostic = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, normalAlpha * countAlpha, M.tab.inactiveBackground),
      bold = true,
    },
    BufferLineErrorDiagnosticVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, visibleAlpha * countAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
      bold = true,
    },
    -- Info
    BufferLineInfoSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.infoForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineInfo = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineInfoVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Info count
    BufferLineInfoDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.infoForeground, countAlpha, c.editor.background),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
      bold = true,
    },
    BufferLineInfoDiagnostic = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, normalAlpha * countAlpha, M.tab.inactiveBackground),
      bold = true,
    },
    BufferLineInfoDiagnosticVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, visibleAlpha * countAlpha, M.tab.unfocusedActiveBackground),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
      bold = true,
    },
    -- Hint
    BufferLineHintSelected = { link = "BufferLineInfoSelected" },
    BufferLineHint = { link = "BufferLineInfo" },
    BufferLineHintVisible = { link = "BufferLineInfoVisible" },
    -- Hint count
    BufferLineHintDiagnosticSelected = {
      link = "BufferLineInfoDiagnosticSelected",
    },
    BufferLineHintDiagnostic = { link = "BufferLineInfoDiagnostic" },
    BufferLineHintDiagnosticVisible = {
      link = "BufferLineInfoDiagnosticVisible",
    },
    -- Pick
    BufferLinePickSelected = {
      bg = M.tab.activeBackground,
      fg = c.base.red,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLinePick = {
      bg = M.tab.inactiveBackground,
      fg = c.base.red,
    },
    BufferLinePickVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.red,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    BufferLineTabClose = {
      bg = tabsBackground,
      fg = tabsBackground,
    },
    -- indicator
    BufferLineIndicatorSelected = {
      bg = M.tab.activeBackground,
      fg = c.tab.activeBorder,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineIndicator = {
      bg = M.tab.inactiveBackground,
      fg = M.tab.inactiveBackground,
    },
    BufferLineIndicatorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = M.tab.unfocusedActiveBackground,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
  }
  if isBold then
    for _, hlValue in pairs(bufferline_groups) do
      hlValue["bold"] = true
    end
  end
  return bufferline_groups
end

M.setup_bufferline_icon = function()
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    return
  end
  local filename = vim.fn.expand("%:t")
  local ext = vim.fn.expand("%:e")
  local _, icon_name = webDevicons.get_icon(filename, ext, { default = true })
  local _, icon_color = webDevicons.get_icon_color(filename, ext, { default = true })
  if not icon_name then
    return
  end
  local iconSkeleton = {
    ["BufferLine" .. icon_name .. "Selected"] = {
      bg = M.tab.activeBackground,
      fg = icon_color,
      sp = M.tab.activeBorder,
      underline = M.underline_selected,
    },
    ["BufferLine" .. icon_name] = {
      bg = M.tab.inactiveBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_name .. "Inactive"] = {
      bg = M.tab.unfocusedActiveBackground,
      fg = icon_color,
      sp = M.tab.unfocusedActiveBorder,
      underline = M.underline_visible,
    },
  }
  return iconSkeleton
end

return M
