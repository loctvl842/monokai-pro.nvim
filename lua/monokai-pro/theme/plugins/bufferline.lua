local M = {}

M.addBold = function(bufferline_groups)
  for _, hlValue in pairs(bufferline_groups) do
    hlValue["bold"] = true
  end
end

M.addUnderline = function(bufferline_groups)
  for key, hlValue in pairs(bufferline_groups) do
    if string.find(key, "Selected") then
      hlValue["underline"] = M.isUnderlined.selected
      hlValue["sp"] = M.fallback_sp("selected")
    elseif string.find(key, "Visible") or string.find(key, "Inactive") then
      hlValue["underline"] = M.isUnderlined.visible
      hlValue["sp"] = M.fallback_sp("visible")
    else
      hlValue["underline"] = M.isUnderlined.fill
      hlValue["sp"] = M.fallback_sp("fill")
    end
  end
end

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local bufferline_config = config.plugins.bufferline

  M.underline_selected = bufferline_config.underline_selected
  M.underline_visible = bufferline_config.underline_visible
  -- lighten alpha
  local normalAlpha = 0.6
  local visibleAlpha = 0.8
  local duplicateAlpha = 0.6
  local countAlpha = 0.75

  -- underline config
  M.isUnderlined = {
    selected = bufferline_config.underline_selected
      or bufferline_config.underline_visible
      or bufferline_config.underline_fill,
    visible = bufferline_config.underline_visible or bufferline_config.underline_fill,
    fill = bufferline_config.underline_fill,
  }

  local isBold = bufferline_config.bold
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "bufferline")

  local tabsBackground = isBackgroundClear and c.editor.background or c.editorGroupHeader.tabsBackground
  local amt = 10
  M.tab = vim.tbl_deep_extend("force", c.tab, isBackgroundClear and {
    activeBackground = hp.lighten(c.tab.activeBackground, amt),
    inactiveBackground = hp.lighten(c.tab.inactiveBackground, amt),
    unfocusedActiveBackground = hp.lighten(c.tab.unfocusedActiveBackground, amt),
  } or {})

  ---@param underline_type "fill" | "visible" | "selected"
  M.fallback_sp = function(underline_type)
    if underline_type == "selected" then
      return bufferline_config.underline_selected and M.tab.activeBorder or M.fallback_sp("visible")
    elseif underline_type == "visible" then
      return bufferline_config.underline_visible and M.tab.unfocusedActiveBorder or M.fallback_sp("fill")
    elseif underline_type == "fill" then
      return bufferline_config.underline_fill and c.editorGroupHeader.tabsBorder or c.editor.background
    end
  end

  local bufferline_groups = {
    Offset = {
      bg = c.sideBar.background,
      fg = c.sideBarTitle.foreground,
    }, -- Explorer appear in tree setup by bufferline
    BufferLineOffsetSeparator = { link = "NeoTreeWinSeparator" },
    BufferLineFill = {
      bg = tabsBackground,
    },
    BufferLineBufferSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
    },
    BufferLineBackground = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineBufferVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha, c.editor.background),
    },
    -- Duplicate
    BufferLineDuplicateSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(M.tab.activeForeground, duplicateAlpha, M.tab.activeBackground),
    },
    BufferLineDuplicate = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha * duplicateAlpha, M.tab.inactiveBackground),
    },
    BufferLineDuplicateVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha * duplicateAlpha, M.tab.unfocusedActiveBackground),
    },
    -- CloseButton
    BufferLineCloseButtonSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
    },
    BufferLineCloseButton = {
      bg = M.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineCloseButtonVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.white,
    },
    -- separator
    BufferLineSeparatorSelected = {
      bg = M.tab.activeBackground,
      fg = tabsBackground,
    },
    BufferLineSeparator = {
      bg = M.tab.inactiveBackground,
      fg = tabsBackground,
    },
    BufferLineSeparatorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = tabsBackground,
    },
    -- Modified
    BufferLineModifiedSelected = {
      bg = M.tab.activeBackground,
      fg = M.tab.activeForeground,
    },
    BufferLineModified = {
      bg = M.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineModifiedVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.white,
    },
    -- Warning
    BufferLineWarningSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.warningForeground,
    },
    BufferLineWarning = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineWarningVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
    },
    -- Warning count
    BufferLineWarningDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.warningForeground, countAlpha, c.editor.background),
    },
    BufferLineWarningDiagnostic = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha * countAlpha, M.tab.inactiveBackground),
    },
    BufferLineWarningDiagnosticVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha * countAlpha, M.tab.unfocusedActiveBackground),
    },
    -- Error
    BufferLineErrorSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.errorForeground,
    },
    BufferLineError = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineErrorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
    },
    -- Error count
    BufferLineErrorDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.errorForeground, countAlpha, c.editor.background),
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
      bold = true,
    },
    -- Info
    BufferLineInfoSelected = {
      bg = M.tab.activeBackground,
      fg = c.inputValidation.infoForeground,
    },
    BufferLineInfo = {
      bg = M.tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, normalAlpha, M.tab.inactiveBackground),
    },
    BufferLineInfoVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, visibleAlpha, M.tab.unfocusedActiveBackground),
    },
    -- Info count
    BufferLineInfoDiagnosticSelected = {
      bg = M.tab.activeBackground,
      fg = hp.blend(c.inputValidation.infoForeground, countAlpha, c.editor.background),
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
    },
    BufferLinePick = {
      bg = M.tab.inactiveBackground,
      fg = c.base.red,
    },
    BufferLinePickVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = c.base.red,
    },
    BufferLineTabClose = {
      bg = tabsBackground,
      fg = tabsBackground,
    },
    -- indicator
    BufferLineIndicatorSelected = {
      bg = M.tab.activeBackground,
      fg = c.tab.activeBorder,
    },
    BufferLineIndicator = {
      bg = M.tab.inactiveBackground,
      fg = M.tab.inactiveBackground,
    },
    BufferLineIndicatorVisible = {
      bg = M.tab.unfocusedActiveBackground,
      fg = M.tab.unfocusedActiveBackground,
    },
  }
  if isBold then
    M.addBold(bufferline_groups)
  end

  M.addUnderline(bufferline_groups)

  return bufferline_groups
end

---@return HighlightGroupTbl?
M.setup_bufferline_icon = function(icon_hl_name, icon_color)
  if icon_hl_name == nil then
    return
  end
  local iconSkeleton = {
    ["BufferLine" .. icon_hl_name .. "Selected"] = {
      bg = M.tab.activeBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_hl_name] = {
      bg = M.tab.inactiveBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_hl_name .. "Inactive"] = {
      bg = M.tab.unfocusedActiveBackground,
      fg = icon_color,
    },
  }

  M.addUnderline(iconSkeleton)
  return iconSkeleton
end

return M
