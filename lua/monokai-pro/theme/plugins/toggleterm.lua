---@type MonokaiPro.PluginSpec
return {
  name = "akinsho/toggleterm.nvim",
  lazy = { module = "toggleterm" },

  highlights = function(c, config)
    local isBackgroundClear = vim.tbl_contains(config.background_clear, "toggleterm")
    -- stylua: ignore
    return {
      TermCursor       = { bg = c.terminalCursor.foreground, fg = c.terminalCursor.background },
      ToggleTerm       = { bg = isBackgroundClear and c.editor.background or c.terminal.background, fg = c.terminal.foreground },
      ToggleTermNormal = { bg = isBackgroundClear and c.editor.background or c.terminal.background, fg = c.terminal.foreground },
      ToggleTermBorder = { bg = c.editor.background, fg = isBackgroundClear and c.base.dimmed2 or c.terminal.background },
    }
  end,
}
