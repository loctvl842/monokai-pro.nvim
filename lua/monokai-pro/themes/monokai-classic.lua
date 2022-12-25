local util = require("monokai-pro.util")
local monokai_classic = {
	editor = {
		background = "#272822",
		foreground = "#fdfff1",
		lineHighlightBackground = "#fdfff10c", -- background: background
		selectionBackground = "#c0c1b527", -- background: background
		findMatchBackground = "#fdfff126", -- background: background
		findMatchBorder = "#e6db74",
		findMatchHighlightBackground = "#fdfff126", -- background: background
		foldBackground = "#fdfff10c", -- background: background
		wordHighlightBackground = "#fdfff126", -- illuminateRead
		selectionHighlightBackground = "#fdfff126", -- illuminateText
		wordHighlightStrongBackground = "#fdfff126", -- illuminateWrite
	},
	editorLineNumber = {
		foreground = "#57584f",
		activeForeground = "#c0c1b5",
	},
	editorHoverWidget = {
		background = "#3b3c35",
		border = "#272822",
	},
	editorSuggestWidget = {
		background = "#3b3c35",
		border = "#3b3c35",
		foreground = "#c0c1b5",
		highlightForeground = "#fdfff1",
		selectedBackground = "#6e7066",
	},
	editorIndentGuide = {
		background = "#3b3c35",
		activeBackground = "#57584F",
	},
	editorGutter = {
		addedBackground = "#a6e22e",
		deletedBackground = "#f92672",
		modifiedBackground = "#fd971f",
	},
	sideBar = {
		background = "#1d1e19",
		foreground = "#919288",
	},
	sideBarTitle = {
		foreground = "#57584f",
	},
	list = {
		activeSelectionBackground = "#fdfff11c", -- background: sideBarBackground,
	},
	sideBarSectionHeader = {
		background = "#1d1e19",
		foreground = "#6e7066",
	},
	breadcrumb = {
		foreground = "#919288",
	},
	button = {
		background = "#3b3c35",
		foreground = "#c0c1b5",
		hoverBackground = "#57584f",
		separator = "#272822",
	},
	scrollbarSlider = {
		hoverBackground = "#c0c1b526", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#a6e22e",
		conflictingResourceForeground = "#fd971f",
		deletedResourceForeground = "#f92672",
		ignoredResourceForeground = "#57584f",
		modifiedResourceForeground = "#e6db74",
		stageDeletedResourceForeground = "#f92672",
		stageModifiedResourceForeground = "#e6db74",
		untrackedResourceForeground = "#c0c1b5",
	},
	inputValidation = {
		errorBackground = "#3b3c35",
		errorBorder = "#f92672",
		errorForeground = "#f92672",
		infoBackground = "#3b3c35",
		infoBorder = "#66d9ef",
		infoForeground = "#66d9ef",
		warningBackground = "#3b3c35",
		warningBorder = "#fd971f",
		warningForeground = "#fd971f",
	},
	terminal = {
		background = "#3b3c35",
		foreground = "#fdfff1",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#fdfff1",
	},
	editorGroupHeader = {
		tabsBackground = "#1d1e19",
		tabsBorder = "#1d1e19",
	},
	tab = {
		activeBackground = "#272822",
		activeBorder = "#e6db74",
		activeForeground = "#e6db74",
		inactiveBackground = util.lightenDarkenColor("#272822", 15),
		inactiveForeground = "#919288",
		unfocusedActiveBackground = "#272822",
		unfocusedActiveBorder = "#919288",
		unfocusedActiveForeground = "#c0c1b5",
	},

	base = {
		black = "#1d1e19",
		lightBlack = "#6e7066",
		red = "#f92672",
		lightRed = "#f92672",
		green = "#a6e22e",
		lightGreen = "#a6e22e",
		yellow = "#e6db74",
		lightYellow = "#e6db74",
		blue = "#fd971f",
		lightBlue = "#fd971f",
		magenta = "#ae81ff",
		lightMagenta = "#ae81ff",
		cyan = "#66d9ef",
		lightCyan = "#66d9ef",
		white = "#fdfff1",
		lightWhite = "#fdfff1",
	},
}
return monokai_classic
