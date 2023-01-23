local util = require("monokai-pro.util")
local M = {}

local hp = require("monokai-pro.color_helper")

---@param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
M.setup = function(filter)
	local filters = { "classic", "machine", "octagon", "pro", "ristretto", "spectrum" }

	if not vim.tbl_contains(filters, filter) then
		local msg = 'Invalid filter, expected "classic", "machine", "octagon", "pro", "ristretto" or "spectrum"'
		local level = "error"
		filter = "pro"
		util.notify(msg, level)
	end

	M.filter = filter

  ---@module "monokai-pro.colorscheme.palette.pro"
	local p = require("monokai-pro.colorscheme.palette." .. M.filter)

	--- @class Colorscheme
	local cs = {}

	cs.editor = {
		background = p.background,
		foreground = p.text,
		lineHighlightBackground = hp.blend(p.text, 0.05, p.background), -- "#fdfff10c", -- background: background
		selectionBackground = hp.blend(p.dimmed1, 0.15, p.background), --"#c0c1b527", -- background: background
		findMatchBackground = hp.blend(p.text, 0.15, p.background), -- "#fdfff126", -- background: background
		findMatchBorder = p.accent3,
		findMatchHighlightBackground = hp.blend(p.text, 0.15, p.background), -- "#fdfff126", -- background: background
		foldBackground = hp.blend(p.text, 0.05, p.background), -- "#fdfff10c", -- background: background
		wordHighlightBackground = hp.blend(p.text, 0.15, p.background), -- "#fdfff126", -- illuminateRead
		selectionHighlightBackground = hp.blend(p.text, 0.15, p.background), -- "#fdfff126", -- illuminateText
		wordHighlightStrongBackground = hp.blend(p.text, 0.15, p.background), -- "#fdfff126", -- illuminateWrite
	}

	cs.editorLineNumber = {
		foreground = p.dimmed4,
		activeForeground = p.dimmed1,
	}

	cs.editorHoverWidget = {
		background = p.dimmed5,
		border = p.background,
	}

	cs.editorSuggestWidget = {
		background = p.dimmed5, -- "#3b3c35",
		border = p.dimmed5, -- "#3b3c35",
		foreground = p.dimmed1, -- "#c0c1b5",
		highlightForeground = p.text, -- "#fdfff1",
		selectedBackground = p.dimmed3, -- "#6e7066",
	}

	cs.editorIndentGuide = {
		background = p.dimmed5, -- "#3b3c35",
		activeBackground = p.dimmed4, -- "#57584F",
	}

	cs.editorGutter = {
		addedBackground = p.accent4, -- "#a6e22e",
		deletedBackground = p.accent1, -- "#f92672",
		modifiedBackground = p.accent2, -- "#fd971f",
	}

	cs.sideBar = {
		background = p.dark1, -- "#1d1e19",
		foreground = p.dimmed2, -- "#919288",
	}

	cs.sideBarTitle = {
		foreground = p.dimmed4, -- "#57584f",
	}

	cs.list = {
		activeSelectionBackground = hp.blend(p.text, 0.11, cs.sideBar.background), -- "#fdfff11c", -- background: sideBarBackground,
	}

	cs.sideBarSectionHeader = {
		background = p.dark1, -- "#1d1e19",
		foreground = p.dimmed3, -- "#6e7066",
	}

	cs.breadcrumb = {
		foreground = p.dimmed2, -- "#919288",
	}

	cs.button = {
		background = p.dimmed5, -- "#3b3c35",
		foreground = p.dimmed1, -- "#c0c1b5",
		hoverBackground = p.dimmed4, -- "#57584f",
		separator = p.background, -- "#272822",
	}

	cs.scrollbarSlider = {
		hoverBackground = hp.blend(p.dimmed1, 0.15, p.background), -- "#c0c1b526", -- background: background
	}

	cs.gitDecoration = {
		addedResourceForeground = p.accent4, -- "#a6e22e",
		conflictingResourceForeground = p.accent2, -- "#fd971f",
		deletedResourceForeground = p.accent1, -- "#f92672",
		ignoredResourceForeground = p.dimmed4, -- "#57584f",
		modifiedResourceForeground = p.accent3, -- "#e6db74",
		stageDeletedResourceForeground = p.accent1, -- "#f92672",
		stageModifiedResourceForeground = p.accent3, -- "#e6db74",
		untrackedResourceForeground = p.dimmed1, -- "#c0c1b5",
	}

	cs.inputValidation = {
		errorBackground = p.dimmed5, -- "#3b3c35",
		errorBorder = p.accent1, -- "#f92672",
		errorForeground = p.accent1, --"#f92672",
		infoBackground = p.dimmed5, -- "#3b3c35",
		infoBorder = p.accent5, --"#66d9ef",
		infoForeground = p.accent5, --"#66d9ef",
		warningBackground = p.dimmed5, --"#3b3c35",
		warningBorder = p.accent2, --"#fd971f",
		warningForeground = p.accent2, --"#fd971f",
	}

	cs.terminal = {
		background = p.dimmed5, -- "#3b3c35",
		foreground = p.text,
		"#fdfff1",
	}

	cs.terminalCursor = {
		background = "#ffffff", -- "#00000000",
		foreground = p.text, -- "#fdfff1",
	}

	cs.editorGroupHeader = {
		tabsBackground = p.dark1, -- "#1d1e19",
		tabsBorder = p.dark1, -- "#1d1e19",
	}

	cs.tab = {
		activeBackground = p.background, -- "#272822",
		activeBorder = p.accent3, -- "#e6db74",
		activeForeground = p.accent3, -- "#e6db74",
		inactiveBackground = hp.lighten(p.background, 15),
		inactiveForeground = p.dimmed2, -- "#919288",
		unfocusedActiveBackground = p.background, -- "#272822",
		unfocusedActiveBorder = p.dimmed2, -- "#919288",
		unfocusedActiveForeground = p.dimmed1, -- "#c0c1b5",
	}

	cs.base = {
		black = p.dark1, --"#1d1e19",
		red = p.accent1, -- "#f92672",
		green = p.accent4, -- "#a6e22e",
		yellow = p.accent3, -- "#e6db74",
		blue = p.accent2, -- "#fd971f",
		magenta = p.accent6, -- "#ae81ff",
		cyan = p.accent5, -- "#66d9ef",
		white = p.text, -- "#fdfff1",
		dimmed1 = p.dimmed1, -- "#c0c1b5",
		dimmed2 = p.dimmed2, -- "#919288",
		dimmed3 = p.dimmed3, -- "#6e7066",
		dimmed4 = p.dimmed4, -- "#57584f",
		dimmed5 = p.dimmed5, -- "#3b3c35",
	}
	return cs
end

return M
