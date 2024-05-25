local M = {}

---@class monokai-pro.theme.plugins.bufferline
local options = {
  underline_selected = false,
  underline_visible = false,
  underline_fill = false,
  bold = true,
  background_clear = true,
}

M.add_bold = function(bufferline_groups)
  for _, hlValue in pairs(bufferline_groups) do
    hlValue["bold"] = true
  end
end

M.add_underline = function(bufferline_groups)
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
function M.get(c, config, hp)
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

  local tab = vim.tbl_deep_extend("force", c.tab or {}, isBackgroundClear and {
    activeBackground = hp.lighten(c.tab.activeBackground, amt),
    inactiveBackground = hp.lighten(c.tab.inactiveBackground, amt),
    unfocusedActiveBackground = hp.lighten(c.tab.unfocusedActiveBackground, amt),
  } or {})
  M.get_tab = function()
    return tab
  end

  ---@param underline_type "fill" | "visible" | "selected"
  M.fallback_sp = function(underline_type)
    if underline_type == "selected" then
      return bufferline_config.underline_selected and tab.activeBorder or M.fallback_sp("visible")
    elseif underline_type == "visible" then
      return bufferline_config.underline_visible and tab.unfocusedActiveBorder or M.fallback_sp("fill")
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
      bg = tab.activeBackground,
      fg = tab.activeForeground,
    },
    BufferLineBackground = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha, tab.inactiveBackground),
    },
    BufferLineBufferVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha, c.editor.background),
    },
    -- Duplicate
    BufferLineDuplicateSelected = {
      bg = tab.activeBackground,
      fg = hp.blend(tab.activeForeground, duplicateAlpha, tab.activeBackground),
    },
    BufferLineDuplicate = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha * duplicateAlpha, tab.inactiveBackground),
    },
    BufferLineDuplicateVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha * duplicateAlpha, tab.unfocusedActiveBackground),
    },
    -- CloseButton
    BufferLineCloseButtonSelected = {
      bg = tab.activeBackground,
      fg = tab.activeForeground,
    },
    BufferLineCloseButton = {
      bg = tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineCloseButtonVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = c.base.white,
    },
    -- separator
    BufferLineSeparatorSelected = {
      bg = tab.activeBackground,
      fg = tabsBackground,
    },
    BufferLineSeparator = {
      bg = tab.inactiveBackground,
      fg = tabsBackground,
    },
    BufferLineSeparatorVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = tabsBackground,
    },
    -- Modified
    BufferLineModifiedSelected = {
      bg = tab.activeBackground,
      fg = tab.activeForeground,
    },
    BufferLineModified = {
      bg = tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineModifiedVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = c.base.white,
    },
    -- Warning
    BufferLineWarningSelected = {
      bg = tab.activeBackground,
      fg = c.inputValidation.warningForeground,
    },
    BufferLineWarning = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha, tab.inactiveBackground),
    },
    BufferLineWarningVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha, tab.unfocusedActiveBackground),
    },
    -- Warning count
    BufferLineWarningDiagnosticSelected = {
      bg = tab.activeBackground,
      fg = hp.blend(c.inputValidation.warningForeground, countAlpha, c.editor.background),
    },
    BufferLineWarningDiagnostic = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, normalAlpha * countAlpha, tab.inactiveBackground),
    },
    BufferLineWarningDiagnosticVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.warningForeground, visibleAlpha * countAlpha, tab.unfocusedActiveBackground),
    },
    -- Error
    BufferLineErrorSelected = {
      bg = tab.activeBackground,
      fg = c.inputValidation.errorForeground,
    },
    BufferLineError = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, normalAlpha, tab.inactiveBackground),
    },
    BufferLineErrorVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, visibleAlpha, tab.unfocusedActiveBackground),
    },
    -- Error count
    BufferLineErrorDiagnosticSelected = {
      bg = tab.activeBackground,
      fg = hp.blend(c.inputValidation.errorForeground, countAlpha, c.editor.background),
      bold = true,
    },
    BufferLineErrorDiagnostic = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, normalAlpha * countAlpha, tab.inactiveBackground),
      bold = true,
    },
    BufferLineErrorDiagnosticVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.errorForeground, visibleAlpha * countAlpha, tab.unfocusedActiveBackground),
      bold = true,
    },
    -- Info
    BufferLineInfoSelected = {
      bg = tab.activeBackground,
      fg = c.inputValidation.infoForeground,
    },
    BufferLineInfo = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, normalAlpha, tab.inactiveBackground),
    },
    BufferLineInfoVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, visibleAlpha, tab.unfocusedActiveBackground),
    },
    -- Info count
    BufferLineInfoDiagnosticSelected = {
      bg = tab.activeBackground,
      fg = hp.blend(c.inputValidation.infoForeground, countAlpha, c.editor.background),
      bold = true,
    },
    BufferLineInfoDiagnostic = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, normalAlpha * countAlpha, tab.inactiveBackground),
      bold = true,
    },
    BufferLineInfoDiagnosticVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = hp.blend(c.inputValidation.infoForeground, visibleAlpha * countAlpha, tab.unfocusedActiveBackground),
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
      bg = tab.activeBackground,
      fg = c.base.red,
    },
    BufferLinePick = {
      bg = tab.inactiveBackground,
      fg = c.base.red,
    },
    BufferLinePickVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = c.base.red,
    },
    BufferLineTab = {
      bg = tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha, tab.inactiveBackground),
    },
    BufferLineTabClose = {
      bg = tabsBackground,
      fg = tabsBackground,
    },
    BufferLineTabSelected = {
      bg = tab.activeBackground,
      fg = tab.activeForeground,
    },
    BufferLineTabSeparator = {
      bg = tab.inactiveBackground,
      fg = tab.inactiveBackground,
      -- fg = tabsBackground,
    },
    BufferLineTabSeparatorSelected = {
      bg = tab.activeBackground,
      fg = tab.activeBackground,
      -- fg = tabsBackground,
    },

    -- indicator
    BufferLineIndicatorSelected = {
      bg = tab.activeBackground,
      fg = c.tab.activeBorder,
    },
    BufferLineIndicator = {
      bg = tab.inactiveBackground,
      fg = tab.inactiveBackground,
    },
    BufferLineIndicatorVisible = {
      bg = tab.unfocusedActiveBackground,
      fg = tab.unfocusedActiveBackground,
    },
  }
  if isBold then
    M.add_bold(bufferline_groups)
  end

  M.add_underline(bufferline_groups)

  return bufferline_groups
end

---@return HighlightGroupTbl?
M.setup_bufferline_icon = function(icon_hl_name, icon_color)
  if icon_hl_name == nil then
    return
  end
  if M == nil or M.get_tab == nil then
    return {}
  end
  local tab = M.get_tab()
  local skeleton = {
    ["BufferLine" .. icon_hl_name .. "Selected"] = {
      bg = tab.activeBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_hl_name] = {
      bg = tab.inactiveBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_hl_name .. "Inactive"] = {
      bg = tab.unfocusedActiveBackground,
      fg = icon_color,
    },
  }

  M.add_underline(skeleton)
  return skeleton
end

return M
