local colors = require("monokai-pro.colors")

---@type MonokaiPro.PluginSpec
return {
  name = "nvim-telescope/telescope.nvim",
  lazy = { module = { "telescope", "telescope.builtin" } },

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "telescope")

    local transparent_bg = c.editor.background
    local transparent_bg_border = c.base.dimmed2
    local preview_bg = c.base.dimmed5
    local prompt_bg = colors.lighten(c.base.dimmed5, 10)
    local result_bg = c.base.dimmed5
    local common_fg = colors.lighten(c.sideBar.foreground, 30)

    -- stylua: ignore
    return {
      TelescopeSelection = is_clear and {
        bg = colors.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
        bold = true,
      } or {
        bg = colors.blend(c.base.green, 0.2, result_bg),
        bold = true,
      },

      TelescopeSelectionCaret = is_clear and {
        bg = colors.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
        bold = true,
      } or {
        bg = colors.blend(c.base.green, 0.2, result_bg),
        fg = c.base.green,
      },

      TelescopeNormal = is_clear and { bg = c.editor.background, fg = common_fg } or { bg = c.editorHoverWidget.background, fg = common_fg },

      TelescopePromptCounter = { fg = c.base.red, bold = true },

      TelescopeBorder = is_clear and { bg = c.editor.background, fg = c.tab.unfocusedActiveBorder } or { bg = c.editor.background, fg = c.editorHoverWidget.background },

      TelescopeMatching = { fg = c.base.blue, bold = true },
      TelescopePreviewLine = { link = "TelescopeSelection" },

      -- Prompt
      TelescopePromptTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePromptNormal = is_clear and { bg = transparent_bg, fg = common_fg }             or { bg = prompt_bg, fg = common_fg },
      TelescopePromptBorder = is_clear and { bg = transparent_bg, fg = transparent_bg_border } or { bg = transparent_bg, fg = prompt_bg },
      TelescopePromptPrefix = { fg = c.base.cyan },

      -- Preview
      TelescopePreviewTitle = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePreviewNormal = is_clear and { bg = transparent_bg, fg = common_fg }             or { bg = preview_bg, fg = common_fg },
      TelescopePreviewBorder = is_clear and { bg = transparent_bg, fg = transparent_bg_border } or { bg = transparent_bg, fg = preview_bg },

      -- Results
      TelescopeResultsTitle  = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopeResultsNormal = is_clear and { bg = transparent_bg, fg = common_fg }             or { bg = result_bg, fg = common_fg },
      TelescopeResultsBorder = is_clear and { bg = transparent_bg, fg = transparent_bg_border } or { bg = transparent_bg, fg = result_bg },
    }
  end,
}
