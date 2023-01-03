local hp = require("monokai-pro.color_helper")

--- @class Colorscheme
local machine_palette = {
	editor = {
		background = "#273136",
		foreground = "#f2fffc",
		lineHighlightBackground = "#f2fffc0c", -- background: background
		selectionBackground = "#b8c4c326", -- background: background
		findMatchBackground = "#f2fffc26", -- background: background
		findMatchBorder = "#ffed72",
		findMatchHighlightBackground = "#f2fffc26", -- background: background
		foldBackground = "#f2fffc0c", -- background: background
		wordHighlightBackground = "#f2fffc26", -- illuminateRead
		selectionHighlightBackground = "#f2fffc26", -- illuminateText
		wordHighlightStrongBackground = "#f2fffc26", -- illuminateWrite
	},
	editorLineNumber = {
		foreground = "#545f62",
		activeForeground = "#b8c4c3",
	},
	editorHoverWidget = {
		background = "#3a4449",
		border = "#273136",
	},
	editorSuggestWidget = {
		background = "#3a4449",
		border = "#3a4449",
		foreground = "#b8c4c3",
		highlightForeground = "#f2fffc",
		selectedBackground = "#6b7678",
	},
	editorIndentGuide = {
		background = "#3a4449",
		activeBackground = "#545f62",
	},
	editorGroupHeader = {
		tabsBackground = "#1d2528",
		tabsBorder = "#1d2528",
	},
	editorGutter = {
		addedBackground = "#a2e57b",
		deletedBackground = "#ff6d7e",
		modifiedBackground = "#ffb270",
	},
	sideBar = {
		background = "#1d2528",
		foreground = "#8b9798",
	},
	sideBarSectionHeader = {
		background = "#1d2528",
		foreground = "#6b7678",
	},
	sideBarTitle = {
		foreground = "#545f62",
	},
	list = {
		activeSelectionBackground = "#f2fffc0c", -- background: sideBarBackground,
	},
	breadcrumb = {
		foreground = "#8b9798",
	},
	button = {
		background = "#3a4449",
		foreground = "#b8c4c3",
		hoverBackground = "#545f62",
		separator = "#273136",
	},
	scrollbarSlider = {
		hoverBackground = "#f2fffc26", -- background: background
	},
	gitDecoration = {
		addedResourceForeground = "#a2e57b",
		conflictingResourceForeground = "#ffb270",
		deletedResourceForeground = "#ff6d7e",
		ignoredResourceForeground = "#545f62",
		modifiedResourceForeground = "#ffed72",
		stageDeletedResourceForeground = "#ff6d7e",
		stageModifiedResourceForeground = "#ffed72",
		untrackedResourceForeground = "#b8c4c3",
	},
	inputValidation = {
		errorBackground = "#3a4449",
		errorBorder = "#ff6d7e",
		errorForeground = "#ff6d7e",
		infoBackground = "#3a4449",
		infoBorder = "#7cd5f1",
		infoForeground = "#7cd5f1",
		warningBackground = "#3a4449",
		warningBorder = "#ffb270",
		warningForeground = "#ffb270",
	},
	terminal = {
		background = "#3a4449",
		foreground = "#f2fffc",
	},
	terminalCursor = {
		background = "#00000000",
		foreground = "#f2fffc",
	},
	tab = {
		activeBackground = "#273136",
		activeBorder = "#ffed72",
		activeForeground = "#ffed72",
		inactiveBackground = hp.lighten("#273136", 15),
		inactiveForeground = "#8b9798",
		unfocusedActiveBackground = "#273136",
		unfocusedActiveBorder = "#8b9798",
		unfocusedActiveForeground = "#b8c4c3",
	},

	base = {
		black = "#1d2528",
		lightBlack = "#6b7678",
		red = "#ff6d7e",
		lightRed = "#ff6d7e",
		green = "#a2e57b",
		lightGreen = "#a2e57b",
		yellow = "#ffed72",
		lightYellow = "#ffed72",
		blue = "#ffb270",
		lightBlue = "#ffb270",
		magenta = "#baa0f8",
		lightMagenta = "#baa0f8",
		cyan = "#7cd5f1",
		lightCyan = "#7cd5f1",
		white = "#f2fffc",
		lightWhite = "#f2fffc",
	},
}

return machine_palette
