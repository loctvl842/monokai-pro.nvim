local M = {}

---@class Config
local default = {
	transparent_background = true,
	italic_comments = true,
	filter = "pro",
	inc_search = "underline", -- underline | background
	diagnostic = {
		background = true,
	},
	plugins = {
		bufferline = {
			underline_selected = false,
      underline_visible = false,
		},
		toggleterm = {
			background_clear = true,
		},
		telescope = {
			background_clear = true,
		},
		cmp = {
			background_clear = true,
		},
		whichkey = {
			background_clear = true,
		},
		renamer = {
			background_clear = true,
		},
		indent_blankline = {
			context_highlight = "default", -- default | pro
		},
	},
}

---@type Config
M.options = {}

---@param options Config|nil
M.setup = function(options)
  M.options = vim.tbl_deep_extend("force", {}, default, options or {})
end

---@param options Config|nil
M.extend = function (options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or default, options or {})
end

return M
