---@type MonokaiPro.PluginSpec
return {
  name = "folke/noice.nvim",
  lazy = { module = "noice" },

  highlights = function(c)
    -- stylua: ignore
    return {
      NoiceCmdlinePopup             = { bg = c.editor.background },
      NoiceCmdlinePopupBorder       = { fg = c.editorSuggestWidget.foreground, bg = c.editor.background },
      NoiceCmdlinePopupBorderSearch = { fg = c.base.blue, bg = c.editor.background },
      NoiceCmdlineIconSearch        = { fg = c.base.blue },
      NoiceFormatProgressDone       = { fg = c.base.black, bg = c.base.yellow, bold = true },
      NoiceFormatProgressTodo       = { fg = c.base.dimmed5, bg = c.base.dimmed3 },
      NoiceLspProgressTitle         = { fg = c.base.dimmed2 },
      NoiceLspProgressClient        = { fg = c.base.cyan },
      NoiceConfirm                  = { fg = c.notifications.foreground, bg = c.notifications.background },
      NoiceConfirmBorder            = { fg = c.notifications.border, bg = c.notifications.background },
      NoiceFormatConfirm            = { fg = c.button.foreground, bg = c.button.background },
      NoiceFormatConfirmDefault     = { fg = c.button.foreground, bg = c.button.hoverBackground },
      NoiceSplit                    = { bg = c.editor.background },
      NoiceMini                     = { fg = c.base.dimmed4 },
    }
  end,
}
