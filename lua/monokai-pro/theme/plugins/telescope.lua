local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  local isTelescopeBackgroundClear = vim.tbl_contains(config.background_clear, "telescope")

  local transparent_bg = c.editor.background
  local transparent_bg_border = c.base.dimmed2
  local preview_bg = c.base.dimmed5
  local prompt_bg = c.base.dimmed5
  local result_bg = c.base.dimmed5
  return {
    TelescopeSelection = {
      bg = c.editorLineNumber.foreground,
      fg = c.base.yellow,
      bold = true,
    },

    TelescopeNormal = {
      bg = isTelescopeBackgroundClear and c.editor.background or c.editorHoverWidget.background,
    },
    TelescopePromptCounter = { fg = c.base.red },
    TelescopeBorder = {
      fg = isTelescopeBackgroundClear and c.tab.unfocusedActiveBorder or c.editorHoverWidget.background,
      bg = c.editor.background,
    },
    TelescopeMatching = { fg = c.base.blue, bold = true },

    TelescopePreviewLine = { link = "TelescopeSelection" },

    -- prompt
    TelescopePromptTitle = {
      bg = c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    TelescopePromptNormal = isTelescopeBackgroundClear and {
      bg = transparent_bg,
      fg = c.base.white,
    } or {
      bg = prompt_bg,
      fg = c.base.white,
    },
    TelescopePromptBorder = isTelescopeBackgroundClear and {
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
    TelescopePreviewNormal = isTelescopeBackgroundClear and {
      bg = transparent_bg,
      fg = c.base.white,
    } or {
      bg = preview_bg,
      fg = c.base.white,
    },
    TelescopePreviewBorder = isTelescopeBackgroundClear and {
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
    TelescopeResultsNormal = isTelescopeBackgroundClear and {
      bg = transparent_bg,
      fg = c.base.white,
    } or {
      bg = result_bg,
      fg = c.base.white,
    },
    TelescopeResultsBorder = isTelescopeBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = result_bg,
    },
  }
end

return M
