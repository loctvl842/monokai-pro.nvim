local hp = require("monokai-pro.color_helper")

--- @class Colorscheme
local ristretto_palette = {
	editor = {
		background = "#2c2525",
		foreground = "#fff1f3",
		lineHighlightBackground = "#fff1f30c", -- background: background
		selectionBackground = "#c3b7b826", -- background: background
		findMatchBackground = "#fff1f326", -- background: background
		findMatchBorder = "#f9cc6c",
		findMatchHighlightBackground = "#fff1f326", -- background: background
		foldBackground = "#fff1f30c", -- background: background
		wordHighlightBackground = "#fff1f326", -- illuminateRead
		selectionHighlightBackground = "#fff1f326", -- illuminateText
		wordHighlightStrongBackground = "#fff1f326", -- illuminateWrite
	},
	editorLineNumber = {
		activeForeground = "#c3b7b8",
		foreground = "#5b5353",
	},
	editorHoverWidget = {
		background = "#403838",
		border = "#2c2525",
	},
	editorSuggestWidget = {
		background = "#403838",
		border = "#403838",
		foreground = "#c3b7b8",
		highlightForeground = "#fff1f3",
		selectedBackground = "#72696a",
	},
	editorIndentGuide = {
		background = "#403838",
		activeBackground = "#5b5353",
	},
	editorGroupHeader = {
		tabsBackground = "#211c1c", -- set to black is better
		tabsBorder = "#211c1c",
	},
	editorGutter = {
		addedBackground = "#adda78",
		deletedBackground = "#fd6883",
		modifiedBackground = "#f38d70",
	},
	sideBar = {
		background = "#211c1c",
		foreground = "#948a8b",
	},
	sideBarSectionHeader = {
		background = "#211c1c",
		foreground = "#72696a",
	},
	sideBarTitle = {
		foreground = "#5b5353",
	},
	list = {
		activeSelectionBackground = "#fff1f30c", -- background: sideBarBackground,
	},
	breadcrumb = {
		foreground = "#948a8b",
	},
	button = {
		background = "#403838",
		foreground = "#c3b7b8",
		hoverBackground = "#5b5353",
		separator = "#2c2525",
	},
	scrollbarSlider = {
		hoverBackground = "#fff1f326", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#adda78",
		conflictingResourceForeground = "#f38d70",
		deletedResourceForeground = "#fd6883",
		ignoredResourceForeground = "#5b5353",
		modifiedResourceForeground = "#f9cc6c",
		stageDeletedResourceForeground = "#fd6883",
		stageModifiedResourceForeground = "#f9cc6c",
		untrackedResourceForeground = "#c3b7b8",
	},
	inputValidation = {
		errorBackground = "#403838",
		errorBorder = "#fd6883",
		errorForeground = "#fd6883",
		infoBackground = "#403838",
		infoBorder = "#85dacc",
		infoForeground = "#85dacc",
		warningBackground = "#403838",
		warningBorder = "#f38d70",
		warningForeground = "#f38d70",
	},
	terminal = {
		background = "#403838",
		foreground = "#fff1f3",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#fff1f3",
	},
	tab = {
		activeBackground = "#2c2525",
		activeBorder = "#f9cc6c",
		activeForeground = "#f9cc6c",
		inactiveBackground = hp.lighten("#2c2525", 15),
		inactiveForeground = "#948a8b",
		unfocusedActiveBackground = "#2c2525",
		unfocusedActiveBorder = "#948a8b",
		unfocusedActiveForeground = "#c3b7b8",
	},

	base = {
		black = "#211c1c",
		lightBlack = "#72696a",
		red = "#fd6883",
		lightRed = "#fd6883",
		green = "#adda78",
		lightGreen = "#adda78",
		yellow = "#f9cc6c",
		lightYellow = "#f9cc6c",
		blue = "#f38d70",
		lightBlue = "#f38d70",
		magenta = "#a8a9eb",
		lightMagenta = "#a8a9eb",
		cyan = "#85dacc",
		lightCyan = "#85dacc",
		white = "#fff1f3",
		lightWhite = "#fff1f3",
	},
}

return ristretto_palette
