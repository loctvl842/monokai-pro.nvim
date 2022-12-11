local util = require("monokai-pro.util")
local monokai_octagon = {
	editor = {
		background = "#282a3a",
		foreground = "#eaf2f1",
		lineHighlightBackground = "#eaf2f10c", -- background: background
		selectionBackground = "#b2b9bd26", -- background: background
		findMatchBackground = "#eaf2f126", -- background: background
		findMatchHighlightBackground = "#eaf2f126", -- background: background
		foldBackground = "#eaf2f10c", -- background: background
		wordHighlightBackground = "#eaf2f126", -- background: background
	},
	editorLineNumber = {
		activeForeground = "#b2b9bd",
		foreground = "#535763",
	},
	editorHoverWidget = {
		background = "#3a3d4b",
		border = "#282a3a",
	},
	editorSuggestWidget = {
		background = "#3a3d4b",
		foreground = "#b2b9bd",
		highlightForeground = "#eaf2f1",
		selectedBackground = "#696d77",
	},
	editorIndentGuide = {
		background = "#3a3d4b",
		activeBackground = "#535763",
	},
	editorGroupHeader = {
		tabsBackground = "#1e1f2b", -- set to black is better
		tabsBorder = "#1e1f2b",
	},
	sideBar = {
		background = "#1e1f2b",
		foreground = "#888d94",
	},
	sideBarSectionHeader = {
		background = "#1e1f2b",
		foreground = "#696d77",
	},
	sideBarTitle = {
		foreground = "#535763",
	},
	list = {
		activeSelectionBackground = "#eaf2f10c", -- background: sideBarBackground,
	},
	breadcrumb = {
		foreground = "#888d94",
	},
	button = {
		background = "#3a3d4b",
		foreground = "#b2b9bd",
		hoverBackground = "#535763",
		separator = "#282a3a",
	},
	scrollbarSlider = {
		hoverBackground = "#eaf2f126", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#bad761",
		conflictingResourceForeground = "#ff9b5e",
		deletedResourceForeground = "#ff657a",
		ignoredResourceForeground = "#535763",
		modifiedResourceForeground = "#ffd76d",
		stageDeletedResourceForeground = "#ff657a",
		stageModifiedResourceForeground = "#ffd76d",
		untrackedResourceForeground = "#b2b9bd",
	},
	inputValidation = {
		errorBackground = "#3a3d4b",
		errorBorder = "#ff657a",
		errorForeground = "#ff657a",
		infoBackground = "#3a3d4b",
		infoBorder = "#9cd1bb",
		infoForeground = "#9cd1bb",
		warningBackground = "#3a3d4b",
		warningBorder = "#ff9b5e",
		warningForeground = "#ff9b5e",
	},
	terminal = {
		background = "#3a3d4b",
		foreground = "#eaf2f1",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#eaf2f1",
	},
	tab = {
		activeBackground = "#282a3a",
		activeBorder = "#ffd76d",
		activeForeground = "#ffd76d",
		inactiveBackground = util.lightenDarkenColor("#282a3a", 15),
		inactiveForeground = "#888d94",
		unfocusedActiveBackground = "#282a3a",
		unfocusedActiveBorder = "#888d94",
		unfocusedActiveForeground = "#b2b9bd",
	},

	base = {
		black = "#1e1f2b",
		lightBlack = "#696d77",
		red = "#ff657a",
		lightRed = "#ff657a",
		green = "#bad761",
		lightGreen = "#bad761",
		yellow = "#ffd76d",
		lightYellow = "#ffd76d",
		blue = "#ff9b5e",
		lightBlue = "#ff9b5e",
		magenta = "#c39ac9",
		lightMagenta = "#c39ac9",
		cyan = "#9cd1bb",
		lightCyan = "#9cd1bb",
		white = "#eaf2f1",
		lightWhite = "#eaf2f1",
	},
}
return monokai_octagon
