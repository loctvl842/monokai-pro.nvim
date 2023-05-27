local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "telescope")

  local transparent_bg = c.editor.background
  local transparent_bg_border = c.base.dimmed2
  -- background
  local preview_bg = c.base.dimmed5
  local prompt_bg = hp.lighten(c.base.dimmed5, 10)
  local result_bg = c.base.dimmed5
  -- foreground
  local common_fg = hp.lighten(c.sideBar.foreground, 30)
  return {
    TelescopeSelection = isBackgroundClear and {} or {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      bold = true,
    },

    TelescopeSelectionCaret = {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      fg = c.base.green
    },

    TelescopeNormal = isBackgroundClear and {
      bg = c.editor.background,
      fg = common_fg,
    } or {
      bg = c.editorHoverWidget.background,
      fg = common_fg,
    },
    TelescopePromptCounter = {
      fg = c.base.red,
      bold = true,
    },
    TelescopeBorder = isBackgroundClear and {
      bg = c.editor.background,
      fg = c.tab.unfocusedActiveBorder,
    } or {
      bg = c.editor.background,
      fg = c.editorHoverWidget.background,
    },
    TelescopeMatching = {
      fg = c.base.blue,
      bold = true,
    },

    TelescopePreviewLine = { link = "TelescopeSelection" },

    -- prompt
    TelescopePromptTitle = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    TelescopePromptNormal = isBackgroundClear and {
      bg = transparent_bg,
      fg = common_fg,
    } or {
      bg = prompt_bg,
      fg = common_fg,
    },
    TelescopePromptBorder = isBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = prompt_bg,
    },
    TelescopePromptPrefix = { fg = c.base.cyan },

    -- preview
    TelescopePreviewTitle = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    TelescopePreviewNormal = isBackgroundClear and {
      bg = transparent_bg,
      fg = common_fg,
    } or {
      bg = preview_bg,
      fg = common_fg,
    },
    TelescopePreviewBorder = isBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = preview_bg,
    },

    -- result
    TelescopeResultsTitle = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    TelescopeResultsNormal = isBackgroundClear and {
      bg = transparent_bg,
      fg = common_fg,
    } or {
      bg = result_bg,
      fg = common_fg,
    },
    TelescopeResultsBorder = isBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = result_bg,
    },
  }
end

return M
