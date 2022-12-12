local util = require("monokai-pro.util")
local colors = {
	editor = {
		background = "#2d2a2e",
		foreground = "#fcfcfa",
		lineHighlightBackground = "#fcfcfa0c", -- background: background
		selectionBackground = "#c1c0c026", -- background: background
		findMatchBackground = "#fcfcfa26", -- background: background
		findMatchBorder = "#ffd866",
		findMatchHighlightBackground = "#fcfcfa26", -- background: background
		foldBackground = "#fcfcfa0c", -- background: background
		wordHighlightBackground = "#fcfcfa26", -- background: background
	},
	editorLineNumber = {
		foreground = "#5b595c",
		activeForeground = "#c1c0c0",
	},
	editorHoverWidget = {
		background = "#403e41",
		border = "#2d2a2e",
	},
	editorSuggestWidget = {
		background = "#403e41",
		foreground = "#c1c0c0",
		highlightForeground = "#fcfcfa",
		selectedBackground = "#727072",
	},
	editorIndentGuide = {
		background = "#403e41",
		activeBackground = "#5B595C",
	},
	sideBar = {
		background = "#221f22",
		foreground = "#939293",
	},
	sideBarTitle = {
		foreground = "#5b595c",
	},
	list = {
		activeSelectionBackground = "#fcfcfa0c", -- background: sideBarBackground,
	},
	sideBarSectionHeader = {
		background = "#221f22",
		foreground = "#727072",
	},
	breadcrumb = {
		foreground = "#939293",
	},
	button = {
		background = "#403e41",
		foreground = "#c1c0c0",
		hoverBackground = "#5b595c",
		separator = "#2d2a2e",
	},
	scrollbarSlider = {
		hoverBackground = "#fcfcfa26", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#a9dc76",
		conflictingResourceForeground = "#fc9867",
		deletedResourceForeground = "#ff6188",
		ignoredResourceForeground = "#5b595c",
		modifiedResourceForeground = "#ffd866",
		stageDeletedResourceForeground = "#ff6188",
		stageModifiedResourceForeground = "#ffd866",
		untrackedResourceForeground = "#c1c0c0",
	},
	inputValidation = {
		errorBackground = "#403e41",
		errorBorder = "#ff6188",
		errorForeground = "#ff6188",
		infoBackground = "#403e41",
		infoBorder = "#78dce8",
		infoForeground = "#78dce8",
		warningBackground = "#403e41",
		warningBorder = "#fc9867",
		warningForeground = "#fc9867",
	},
	terminal = {
		background = "#403e41",
		foreground = "#fcfcfa",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#fcfcfa",
	},
	editorGroupHeader = {
		tabsBackground = "#221f22",
		tabsBorder = "#221f22",
	},
	tab = {
		activeBackground = "#2d2a2e",
		activeBorder = "#ffd866",
		activeForeground = "#ffd866",
		inactiveBackground = util.lightenDarkenColor("#2d2a2e", 15),
		inactiveForeground = "#939293",
		unfocusedActiveBackground = "#2d2a2e",
		unfocusedActiveBorder = "#939293",
		unfocusedActiveForeground = "#c1c0c0",
	},

	base = {
		black = "#221f22",
		lightBlack = "#727072",
		red = "#ff6188",
		lightRed = "#ff6188",
		green = "#a9dc76",
		lightGreen = "#a9dc76",
		yellow = "#ffd866",
		lightYellow = "#ffd866",
		blue = "#fc9867",
		lightBlue = "#fc9867",
		lightMagenta = "#ab9df2",
		magenta = "#ab9df2",
		cyan = "#78dce8",
		lightCyan = "#78dce8",
		white = "#fcfcfa",
		lightWhite = "#BEBDBD",
	},
	neotree_directory_icon = "#90A4AE",
}

return colors
