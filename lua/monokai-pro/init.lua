vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
	vim.api.nvim_command("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "monokai-pro"

local util = require("monokai-pro.util")
Config = require("monokai-pro.config")
C = require("monokai-pro.palette")

local highlights = require("monokai-pro.highlights")

local alpha = require("monokai-pro.Alpha")
local BufferLine = require("monokai-pro.BufferLine")
local Cmp = require("monokai-pro.Cmp")
local Git = require("monokai-pro.Git")
local Illuminate = require("monokai-pro.Illuminate")
local IndentBlankline = require("monokai-pro.IndentBlankline")
local LSP = require("monokai-pro.LSP")
local Misc = require("monokai-pro.Misc")
local NeoTree = require("monokai-pro.NeoTree")
local Notify = require("monokai-pro.Notify")
local NvimTree = require("monokai-pro.NvimTree")
local Packer = require("monokai-pro.Packer")
local Quickscope = require("monokai-pro.Quickscope")
local Renamer = require("monokai-pro.Renamer")
local StatusLine = require("monokai-pro.StatusLine")
local SymbolOutline = require("monokai-pro.SymbolOutline")
local Telescope = require("monokai-pro.Telescope")
local Treesitter = require("monokai-pro.Treesitter")
local markdown = require("monokai-pro.markdown")
local Whichkey = require("monokai-pro.Whichkey")
local winbar = require("monokai-pro.winbar")

local skeletons = {
	highlights,
	alpha,
	BufferLine,
	Cmp,
	Git,
	Illuminate,
	IndentBlankline,
	LSP,
	Misc,
	NeoTree,
	Notify,
	NvimTree,
	Packer,
	Quickscope,
	Renamer,
	StatusLine,
	SymbolOutline,
	Telescope,
	Treesitter,
  Whichkey,
	markdown,
	winbar,
}

for _, skeleton in ipairs(skeletons) do
	util.initialise(skeleton)
end
