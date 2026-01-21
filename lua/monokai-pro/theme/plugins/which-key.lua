---@type MonokaiPro.PluginSpec
return {
  name = "folke/which-key.nvim",
  lazy = { module = "which-key" },

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "which-key")
    local whichkey_bg = c.editorSuggestWidget.background
    local transparent_bg = c.editor.background
    local transparent_bg_border = c.base.dimmed2

    -- stylua: ignore
    return {
      WhichKey          = { fg = c.base.blue },
      WhichKeySeperator = { fg = c.base.red },
      WhichKeyGroup     = { fg = c.base.magenta },
      WhichKeyDesc      = { fg = c.base.yellow },
      WhichKeyNormal    = { bg = is_clear and transparent_bg or whichkey_bg },
      WhichKeyBorder    = is_clear and { bg = transparent_bg, fg = transparent_bg_border } or { bg = whichkey_bg, fg = whichkey_bg },
    }
  end,
}
