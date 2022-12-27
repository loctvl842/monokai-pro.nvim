local M = {}

vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
	vim.api.nvim_command("syntax reset")
end

local util = require("monokai-pro.util")
Config = require("monokai-pro.config")
C = require("monokai-pro.palette")

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "monokai-pro"
vim.g.monokai_pro_config = Config

local plugins = {
	"StatusLine",
	"alpha",
	"breadcrumb",
	"bufferline",
	"cmp",
	"coc",
	"gitsign",
	"illuminate",
	"indent_blankline",
	"lsp",
	"neo-tree",
	"notify",
	"nvim-navic",
	"nvim-tree",
	"nvim-treesitter",
	"packer",
	"renamer",
	"scrollbar",
	"telescope",
	"toggleterm",
	"ufo",
	"which-key",
	"wilder",
}

-- gnerate the colorscheme
local function generate(theme)
	C = vim.tbl_deep_extend("force", C, theme)
	local skeletons = util.load_skeletons(plugins)
	for skeleton_name, skeleton_config in pairs(skeletons) do
		local status_ok, _ = pcall(util.initialise, skeleton_config)
		if not status_ok then
			local msg = "Highlight failed in skeleton " .. skeleton_name
			local level = "error"
			util.notify(msg, level)
			goto continue
		end
		::continue::
	end
	util.highlightBufferLineIcon(C, Config)
end

local function create_filter_command()
	local cmd = vim.api.nvim_create_user_command
	cmd("MonokaiProSelect", function()
		local menu = util.create_menu(
			"Set monokai filter",
			{ "classic", "octagon", "pro", "machine", "ristretto", "spectrum" },
			function(item)
				local filter = item.value
				Config.filter = filter
				vim.g.monokai_pro_config = Config
				M.setup(Config)
			end
		)
		menu:mount()
	end, { nargs = 0 })
	cmd("MonokaiPro", function(opts)
		local filter = opts.args
		Config.filter = filter
		vim.g.monokai_pro_config = Config
		M.setup(Config)
	end, {
		nargs = 1,
		complete = function()
			return { "classic", "octagon", "pro", "machine", "ristretto", "spectrum" }
		end,
	})
end

function M.setup(user_config)
	Config = vim.tbl_deep_extend("force", Config, user_config)
	vim.g.monokai_pro_config = Config
	local filter = Config.filter == "" and "pro" or Config.filter
	local theme_palette = require("monokai-pro.themes.monokai-" .. filter)
	generate(theme_palette)
	create_filter_command()
	vim.cmd([[colorscheme monokai-pro]])
end

function M.get_base_color()
	local filter = vim.g.monokai_pro_config.filter or "pro"
	local theme_palette = require("monokai-pro.themes.monokai-" .. filter)
	return theme_palette.base
end

return M
