---@type MonokaiPro.PluginSpec
return {
  name = "folke/snacks.nvim",
  lazy = { module = "snacks" },

  highlights = function(c)
    -- stylua: ignore
    local highlights = {
      SnacksDashboardNormal  = { bg = c.editor.background, fg = c.editor.foreground },
      SnacksDashboardDesc    = { fg = c.base.dimmed1 },
      SnacksDashboardIcon    = { fg = c.base.blue },
      SnacksDashboardFooter  = { fg = c.base.green },
      SnacksDashboardHeader  = { fg = c.base.yellow },
      SnacksDashboardSpecial = { fg = c.base.yellow, bold = true },

      SnacksTitle = { bg = c.sideBar.background, fg = c.base.yellow, bold = true },

      -- Explorer
      SnacksPickerTree = { bg = c.sideBar.background, fg = c.editorIndentGuide.background },

      -- Picker
      SnacksPickerInputBorder   = { bg = c.sideBar.background, fg = c.sideBar.foreground },
      SnacksPickerTitle         = { bg = c.sideBar.background, fg = c.base.yellow, bold = true },
      SnacksPickerPrompt        = { bg = c.sideBar.background, fg = c.base.blue },
      SnacksPickerBorder        = { bg = c.sideBar.background, fg = c.sideBar.foreground },
      SnacksPickerTotals        = { fg = c.base.dimmed3 },
      SnacksPickerDir           = { fg = c.sideBar.foreground },

      -- Git
      SnacksPickerGitStatusUntracked = { fg = c.gitDecoration.untrackedResourceForeground }
    }
    local rainbow = {
      c.base.red,
      c.base.blue,
      c.base.yellow,
      c.base.green,
      c.base.magenta,
    }
    for i, color in ipairs(rainbow) do
      highlights["SnacksIndent" .. i] = { fg = color, nocombine = true }
    end
    return highlights
  end,
}
