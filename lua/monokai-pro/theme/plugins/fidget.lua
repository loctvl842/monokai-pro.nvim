---@type MonokaiPro.PluginSpec
return {
  name = "j-hui/fidget.nvim",
  lazy = { module = "fidget" },

  highlights = function(c)
    -- stylua: ignore
    return {
      FidgetTask  = { bg = c.editor.background, fg = c.base.white },
      FidgetTitle = { bg = c.editor.background, fg = c.base.yellow },
    }
  end,
}
