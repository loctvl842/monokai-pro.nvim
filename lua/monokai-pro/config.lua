local M = {}

---@class Config
---@field override fun(colors: Colorscheme)
local default = {
  transparent_background = false,
  terminal_colors = true,
  devicons = false,
  italic_comments = true,
  filter = "pro",
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer",
  },
  diagnostic = {
    background = true,
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
    },
  },
  ---@param colors Colorscheme
  override = function(colors) end,
}

---@type Config
M.options = {}

---@param options Config|nil
M.setup = function(options)
  M.options = vim.tbl_deep_extend("force", {}, default, options or {})
end

---@param options Config|nil
M.extend = function(options)
  M.options =
  vim.tbl_deep_extend("force", {}, M.options or default, options or {})
end

M.setup()

return M
