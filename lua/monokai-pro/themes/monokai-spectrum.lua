local util = require("monokai-pro.util")
local monokai_spectrum = {
	editor = {
		background = "#222222",
		foreground = "#f7f1ff",
		lineHighlightBackground = "#f7f1ff0c", -- background: background
		selectionBackground = "#bab6c026", -- background: background
		findMatchBackground = "#f7f1ff26", -- background: background
		findMatchBorder = "#fce566",
		findMatchHighlightBackground = "#f7f1ff26", -- background: background
		foldBackground = "#f7f1ff0c", -- background: background
		wordHighlightBackground = "#f7f1ff26", -- illuminateRead
		selectionHighlightBackground = "#f7f1ff26", -- illuminateText
		wordHighlightStrongBackground = "#f7f1ff26", -- illuminateWrite
	},
	editorLineNumber = {
		activeForeground = "#bab6c0",
		foreground = "#525053",
	},
	editorHoverWidget = {
		background = "#363537",
		border = "#222222",
	},
	editorSuggestWidget = {
		background = "#363537",
		foreground = "#bab6c0",
		highlightForeground = "#f7f1ff",
		selectedBackground = "#69676c",
	},
	editorIndentGuide = {
		background = "#363537",
		activeBackground = "#525053",
	},
	editorGroupHeader = {
		tabsBackground = "#191919", -- set to black is better
		tabsBorder = "#191919",
	},
	editorGutter = {
		addedBackground = "#7bd88f",
		deletedBackground = "#fc618d",
		modifiedBackground = "#fd9353",
	},
	sideBar = {
		background = "#191919",
		foreground = "#8b888f",
	},
	sideBarSectionHeader = {
		background = "#191919",
		foreground = "#69676c",
	},
	sideBarTitle = {
		foreground = "#525053",
	},
	list = {
		activeSelectionBackground = "#f7f1ff0c", -- background: sideBarBackground,
	},
	breadcrumb = {
		foreground = "#8b888f",
	},
	button = {
		background = "#363537",
		foreground = "#bab6c0",
		hoverBackground = "#525053",
		separator = "#222222",
	},
	scrollbarSlider = {
		hoverBackground = "#f7f1ff26", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#7bd88f",
		conflictingResourceForeground = "#fd9353",
		deletedResourceForeground = "#fc618d",
		ignoredResourceForeground = "#525053",
		modifiedResourceForeground = "#fce566",
		stageDeletedResourceForeground = "#fc618d",
		stageModifiedResourceForeground = "#fce566",
		untrackedResourceForeground = "#bab6c0",
	},
	inputValidation = {
		errorBackground = "#363537",
		errorBorder = "#fc618d",
		errorForeground = "#fc618d",
		infoBackground = "#363537",
		infoBorder = "#5ad4e6",
		infoForeground = "#5ad4e6",
		warningBackground = "#363537",
		warningBorder = "#fd9353",
		warningForeground = "#fd9353",
	},
	terminal = {
		background = "#363537",
		foreground = "#f7f1ff",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#f7f1ff",
	},
	tab = {
		activeBackground = "#222222",
		activeBorder = "#fce566",
		activeForeground = "#fce566",
		inactiveBackground = util.lightenDarkenColor("#222222", 15),
		inactiveForeground = "#8b888f",
		unfocusedActiveBackground = "#222222",
		unfocusedActiveBorder = "#8b888f",
		unfocusedActiveForeground = "#bab6c0",
	},

	base = {
		black = "#191919",
		lightBlack = "#69676c",
		red = "#fc618d",
		lightRed = "#fc618d",
		green = "#7bd88f",
		lightGreen = "#7bd88f",
		yellow = "#fce566",
		lightYellow = "#fce566",
		blue = "#fd9353",
		lightBlue = "#fd9353",
		magenta = "#948ae3",
		lightMagenta = "#948ae3",
		cyan = "#5ad4e6",
		lightCyan = "#5ad4e6",
		white = "#f7f1ff",
		lightWhite = "#f7f1ff",
	},
}
return monokai_spectrum
