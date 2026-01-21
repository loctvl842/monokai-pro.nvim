local colors = require("monokai-pro.colors")

---@type MonokaiPro.PluginSpec
return {
  name = "rcarriga/nvim-notify",
  lazy = { module = "notify" },

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "notify")

    -- stylua: ignore
    if is_clear then
      return {
        NotifyERRORBorder = { fg = colors.blend(c.inputValidation.errorBorder, 0.3, c.editor.background) },
        NotifyWARNBorder  = { fg = colors.blend(c.inputValidation.warningBorder, 0.3, c.editor.background) },
        NotifyINFOBorder  = { fg = colors.blend(c.inputValidation.infoBorder, 0.3, c.editor.background) },
        NotifyDEBUGBorder = { fg = colors.blend(c.base.dimmed2, 0.3, c.editor.background) },
        NotifyTRACEBorder = { fg = colors.blend(c.base.magenta, 0.3, c.editor.background) },
        NotifyERRORIcon   = { fg = c.inputValidation.errorForeground },
        NotifyWARNIcon    = { fg = c.inputValidation.warningForeground },
        NotifyINFOIcon    = { fg = c.inputValidation.infoForeground },
        NotifyDEBUGIcon   = { fg = c.base.white },
        NotifyTRACEIcon   = { fg = c.base.magenta },
        NotifyERRORTitle  = { link = "NotifyERRORIcon" },
        NotifyWARNTitle   = { link = "NotifyWARNIcon" },
        NotifyINFOTitle   = { link = "NotifyINFOIcon" },
        NotifyDEBUGTitle  = { fg = c.base.dimmed2 },
        NotifyTRACETitle  = { fg = c.base.magenta },
        NotifyERRORBody   = { link = "Normal" },
        NotifyWARNBody    = { link = "Normal" },
        NotifyINFOBody    = { link = "Normal" },
        NotifyDEBUGBody   = { link = "Normal" },
        NotifyTRACEBody   = { link = "Normal" },
        NotifyBackground  = { link = "Normal" },
      }
    end

    -- stylua: ignore
    return {
      NotifyERRORBorder = { bg = c.notifications.background, fg = c.notifications.background },
      NotifyWARNBorder  = { bg = c.notifications.background, fg = c.notifications.background },
      NotifyINFOBorder  = { bg = c.notifications.background, fg = c.notifications.background },
      NotifyDEBUGBorder = { bg = c.notifications.background, fg = c.notifications.background },
      NotifyTRACEBorder = { bg = c.notifications.background, fg = c.notifications.background },
      NotifyERRORIcon   = { bg = c.notifications.background, fg = c.inputValidation.errorForeground },
      NotifyWARNIcon    = { bg = c.notifications.background, fg = c.inputValidation.warningForeground },
      NotifyINFOIcon    = { bg = c.notifications.background, fg = c.inputValidation.infoForeground },
      NotifyDEBUGIcon   = { bg = c.notifications.background, fg = c.base.white },
      NotifyTRACEIcon   = { bg = c.notifications.background, fg = c.base.magenta },
      NotifyERRORTitle  = { bg = c.notifications.background, fg = c.inputValidation.errorForeground },
      NotifyWARNTitle   = { bg = c.notifications.background, fg = c.inputValidation.warningForeground },
      NotifyINFOTitle   = { bg = c.notifications.background, fg = c.inputValidation.infoForeground },
      NotifyDEBUGTitle  = { bg = c.notifications.background, fg = c.base.dimmed2 },
      NotifyTRACETitle  = { bg = c.notifications.background, fg = c.base.magenta },
      NotifyERRORBody   = { bg = c.notifications.background, fg = c.notifications.foreground },
      NotifyWARNBody    = { bg = c.notifications.background, fg = c.notifications.foreground },
      NotifyINFOBody    = { bg = c.notifications.background, fg = c.notifications.foreground },
      NotifyDEBUGBody   = { bg = c.notifications.background, fg = c.notifications.foreground },
      NotifyTRACEBody   = { bg = c.notifications.background, fg = c.notifications.foreground },
      NotifyBackground  = { bg = c.notifications.background, fg = c.notifications.foreground },
    }
  end,
}
