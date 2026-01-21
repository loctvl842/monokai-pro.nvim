---@type MonokaiPro.PluginSpec
return {
  name = "petertriho/nvim-scrollbar",
  lazy = { module = "scrollbar" },

  highlights = function(c)
    -- stylua: ignore
    return {
      ScrollbarHandle          = { bg = c.scrollbarSlider.hoverBackground, fg = c.base.white },
      ScrollbarCursorHandle    = { bg = c.scrollbarSlider.hoverBackground },
      ScrollbarCursor          = { bg = c.list.activeSelectionBackground, fg = c.list.activeSelectionBackground },

      ScrollbarSearchHandle    = { bg = c.scrollbarSlider.hoverBackground },
      ScrollbarSearch          = { bg = c.editor.background, fg = c.base.white },

      ScrollbarErrorHandle     = { bg = c.scrollbarSlider.hoverBackground, fg = c.inputValidation.errorForeground },
      ScrollbarError           = { bg = c.editor.background, fg = c.inputValidation.errorForeground },

      ScrollbarWarnHandle      = { bg = c.scrollbarSlider.hoverBackground, fg = c.inputValidation.warningForeground },
      ScrollbarWarn            = { bg = c.editor.background, fg = c.inputValidation.warningForeground },

      ScrollbarInfoHandle      = { bg = c.scrollbarSlider.hoverBackground, fg = c.inputValidation.infoForeground },
      ScrollbarInfo            = { bg = c.editor.background, fg = c.inputValidation.infoForeground },

      ScrollbarHintHandle      = { bg = c.scrollbarSlider.hoverBackground, fg = c.inputValidation.infoForeground },
      ScrollbarHint            = { bg = c.editor.background, fg = c.inputValidation.infoForeground },

      ScrollbarGitAddHandle    = { bg = c.scrollbarSlider.hoverBackground, fg = c.gitDecoration.addedResourceForeground },
      ScrollbarGitAdd          = { bg = c.editor.background, fg = c.gitDecoration.addedResourceForeground },
      ScrollbarGitChangeHandle = { bg = c.scrollbarSlider.hoverBackground, fg = c.gitDecoration.modifiedResourceForeground },
      ScrollbarGitChange       = { bg = c.editor.background, fg = c.gitDecoration.modifiedResourceForeground },
      ScrollbarGitDeleteHandle = { bg = c.scrollbarSlider.hoverBackground, fg = c.gitDecoration.deletedResourceForeground },
      ScrollbarGitDelete       = { bg = c.editor.background, fg = c.gitDecoration.deletedResourceForeground },
    }
  end,
}
