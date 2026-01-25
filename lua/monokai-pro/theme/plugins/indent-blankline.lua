---@type MonokaiPro.PluginSpec
return {
  name = "lukas-reineke/indent-blankline.nvim",
  lazy = { module = "ibl" },

  highlights = function(c, config)
    local plugin_config = config.plugins and config.plugins.indent_blankline or {}
    local is_context_pro = plugin_config.context_highlight == "pro"
    local is_context_underline = plugin_config.context_start_underline

    local augroup = vim.api.nvim_create_augroup("MonokaiProBufferline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = augroup,
      pattern = "*",
      callback = function()
        local ok, ibl = pcall(require, "ibl.highlights")
        if ok then
          ibl.setup()
        end
      end,
    })

    -- stylua: ignore
    return {
      IndentBlanklineChar         = { fg = c.editorIndentGuide.background },
      IndentBlanklineContextChar  = is_context_pro and { fg = c.base.blue } or { fg = c.editorIndentGuide.activeBackground },
      IndentBlanklineContextStart = { sp = is_context_pro and c.base.blue or c.editorIndentGuide.activeBackground, underline = is_context_underline },
      IndentBlanklineSpaceChar    = { fg = c.editor.background },
      IndentBlankLineIndent1      = { fg = c.base.red },
      IndentBlankLineIndent2      = { fg = c.base.blue },
      IndentBlankLineIndent3      = { fg = c.base.yellow },
      IndentBlankLineIndent4      = { fg = c.base.green },
      IndentBlankLineIndent5      = { fg = c.base.cyan },
      IndentBlankLineIndent6      = { fg = c.base.magenta },

      -- IblIndent (v3 API)
      IblIndent                   = { fg = c.editorIndentGuide.background },
      IblScope                    = is_context_pro and { fg = c.base.red } or { fg = c.editorIndentGuide.activeBackground },
    }
  end,
}
