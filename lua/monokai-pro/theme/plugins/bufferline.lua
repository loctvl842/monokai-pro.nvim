local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  M.tab_highlight = c.tab
  M.underline_selected = config.plugins.bufferline.underline_selected
  M.underline_visible = config.plugins.bufferline.underline_visible
  local normalAlpha = 0.6
  local visibleAlpha = 0.8
  local duplicateAlpha = 0.6
  local countAlpha = 0.75
  local isSelectedUnderlined = config.plugins.bufferline.underline_selected
  local isVisibleUnderlined = config.plugins.bufferline.underline_visible
  local isBold = config.plugins.bufferline.bold
  local bufferline_groups = {
    Offset = {
      bg = c.sideBar.background,
      fg = c.sideBarTitle.foreground,
    }, -- Explorer appear in tree setup by bufferline
    BufferLineFill = {
      bg = c.editorGroupHeader.tabsBackground,
      sp = c.editorGroupHeader.tabsBorder,
      -- underline = isSelectedUnderlined,
    },
    BufferLineBufferSelected = {
      bg = c.tab.activeBackground,
      fg = c.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineBackground = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(c.base.white, normalAlpha, c.tab.inactiveBackground),
    },
    BufferLineBufferVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(c.base.white, visibleAlpha, c.editor.background),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Duplicate
    BufferLineDuplicateSelected = {
      bg = c.tab.activeBackground,
      fg = hp.blend(
        c.tab.activeForeground,
        duplicateAlpha,
        c.tab.activeBackground
      ),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineDuplicate = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.base.white,
        normalAlpha * duplicateAlpha,
        c.tab.inactiveBackground
      ),
    },
    BufferLineDuplicateVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.base.white,
        visibleAlpha * duplicateAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- CloseButton
    BufferLineCloseButtonSelected = {
      bg = c.tab.activeBackground,
      fg = c.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineCloseButton = {
      bg = c.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineCloseButtonVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = c.base.white,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- separator
    BufferLineSeparatorSelected = {
      bg = c.tab.activeBackground,
      fg = c.editorGroupHeader.tabsBackground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineSeparator = {
      bg = c.tab.inactiveBackground,
      fg = c.editorGroupHeader.tabsBackground,
    },
    BufferLineSeparatorVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = c.editorGroupHeader.tabsBackground,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Modified
    BufferLineModifiedSelected = {
      bg = c.tab.activeBackground,
      fg = c.tab.activeForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineModified = {
      bg = c.tab.inactiveBackground,
      fg = c.base.white,
    },
    BufferLineModifiedVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = c.base.white,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Warning
    BufferLineWarningSelected = {
      bg = c.tab.activeBackground,
      fg = c.inputValidation.warningForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineWarning = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.warningForeground,
        normalAlpha,
        c.tab.inactiveBackground
      ),
    },
    BufferLineWarningVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.warningForeground,
        visibleAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Warning count
    BufferLineWarningDiagnosticSelected = {
      bg = c.tab.activeBackground,
      fg = hp.blend(
        c.inputValidation.warningForeground,
        countAlpha,
        c.editor.background
      ),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineWarningDiagnostic = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.warningForeground,
        normalAlpha * countAlpha,
        c.tab.inactiveBackground
      ),
    },
    BufferLineWarningDiagnosticVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.warningForeground,
        visibleAlpha * countAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Error
    BufferLineErrorSelected = {
      bg = c.tab.activeBackground,
      fg = c.inputValidation.errorForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineError = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.errorForeground,
        normalAlpha,
        c.tab.inactiveBackground
      ),
    },
    BufferLineErrorVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.errorForeground,
        visibleAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Error count
    BufferLineErrorDiagnosticSelected = {
      bg = c.tab.activeBackground,
      fg = hp.blend(
        c.inputValidation.errorForeground,
        countAlpha,
        c.editor.background
      ),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
      bold = true,
    },
    BufferLineErrorDiagnostic = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.errorForeground,
        normalAlpha * countAlpha,
        c.tab.inactiveBackground
      ),
      bold = true,
    },
    BufferLineErrorDiagnosticVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.errorForeground,
        visibleAlpha * countAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
      bold = true,
    },
    -- Info
    BufferLineInfoSelected = {
      bg = c.tab.activeBackground,
      fg = c.inputValidation.infoForeground,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineInfo = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.infoForeground,
        normalAlpha,
        c.tab.inactiveBackground
      ),
    },
    BufferLineInfoVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.infoForeground,
        visibleAlpha,
        c.tab.unfocusedActiveBackground
      ),
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    -- Info count
    BufferLineInfoDiagnosticSelected = {
      bg = c.tab.activeBackground,
      fg = hp.blend(
        c.inputValidation.infoForeground,
        countAlpha,
        c.editor.background
      ),
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
      bold = true,
    },
    BufferLineInfoDiagnostic = {
      bg = c.tab.inactiveBackground,
      fg = hp.blend(
        c.inputValidation.infoForeground,
        normalAlpha * countAlpha,
        c.tab.inactiveBackground
      ),
      bold = true,
    },
    BufferLineInfoDiagnosticVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = hp.blend(
        c.inputValidation.infoForeground,
        visibleAlpha * countAlpha,
        c.tab.unfocusedActiveBackground
      ),
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
      bg = c.tab.activeBackground,
      fg = c.base.red,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLinePick = {
      bg = c.tab.inactiveBackground,
      fg = c.base.red,
    },
    BufferLinePickVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = c.base.red,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
    BufferLineTabClose = {
      bg = c.editorGroupHeader.tabsBackground,
      fg = c.editorGroupHeader.tabsBackground,
    },
    -- indicator
    BufferLineIndicatorSelected = {
      bg = c.tab.activeBackground,
      fg = c.tab.activeBorder,
      sp = c.tab.activeBorder,
      underline = isSelectedUnderlined,
    },
    BufferLineIndicator = {
      bg = c.tab.inactiveBackground,
      fg = c.tab.inactiveBackground,
    },
    BufferLineIndicatorVisible = {
      bg = c.tab.unfocusedActiveBackground,
      fg = c.tab.unfocusedActiveBackground,
      sp = c.tab.unfocusedActiveBorder,
      underline = isVisibleUnderlined,
    },
  }
  if isBold then
    for _, group in pairs(bufferline_groups) do
      group["bold"] = true
    end
  end
  return bufferline_groups
end

M.setup_bufferline_icon = function()
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then return end
  local filename = vim.fn.expand("%:t")
  local ext = vim.fn.expand("%:e")
  local _, icon_name = webDevicons.get_icon(filename, ext, { default = true })
  local _, icon_color =
      webDevicons.get_icon_color(filename, ext, { default = true })
  if not icon_name then return end
  local iconSkeleton = {
    ["BufferLine" .. icon_name .. "Selected"] = {
      bg = M.tab_highlight.activeBackground,
      fg = icon_color,
      sp = M.tab_highlight.activeBorder,
      underline = M.underline_selected,
    },
    ["BufferLine" .. icon_name] = {
      bg = M.tab_highlight.inactiveBackground,
      fg = icon_color,
    },
    ["BufferLine" .. icon_name .. "Inactive"] = {
      bg = M.tab_highlight.unfocusedActiveBackground,
      fg = icon_color,
      sp = M.tab_highlight.unfocusedActiveBorder,
      underline = M.underline_visible,
    },
  }
  return iconSkeleton
end

return M
