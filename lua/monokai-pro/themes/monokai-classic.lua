local util = require("monokai-pro.util")
local monokai_classic = {
	background = "#272822",
	foreground = "#fdfff1",
	lineHighlightBackground = util.hexExtend("#fdfff10c", "#272822"), -- background: background
	lineNumberForeground = "#57584f",
	lineNumberActiveForeground = "#c0c1b5",
	selectionBackground = util.hexExtend("#c0c1b527", "#272822"), -- background: background
	findMatchBackground = util.hexExtend("#fdfff126", "#272822"), -- background: background
	findMatchHighlightBackground = util.hexExtend("#fdfff126", "#272822"), -- background: background
	foldBackground = util.hexExtend("#fdfff10c", "#272822"), -- background: background
	hoverWidgetBackground = "#3b3c35",
	suggestWidgetBackground = "#3b3c35",
	suggestWidgetForeground = "#c0c1b5",
	suggestWidgetHighlightForeground = "#fdfff1",
	suggestWidgetSelectedBackground = "#6e7066",
	sideBarBackground = "#1d1e19",
	sideBarForeground = "#fdfff1",
	listActiveSelectionBackground = util.hexExtend("#fdfff11c", "#1d1e19"), -- background: sideBarBackground
	sideBarSectionHeaderForeground = "#6e7066",
	breadcrumbForeground = "#919288",
	scrollbarSliderBackground = util.hexExtend("#c0c1b526", "#3b3c35"), -- background: suggestWidgetBackground
	indentGuideBackground = "#3B3C35",
	indentGuideActiveBackground = "#57584F",
	wordHighlightBackground = util.hexExtend("#fdfff126", "#272822"), -- background: background

	bufferline_background = util.lightenDarkenColor("#272822", 15),

	black = "#1d1e19",
	blue = "#fc961f",
	cyan = "#66d9ee",
	green = "#a6e12d",
	lightBlack = "#6e7066",
	lightBlue = "#fc961f",
	lightCyan = "#66d9ee",
	lightGreen = "#a6e12d",
	lightMagenta = "#ae81ff",
	lightRed = "#f82570",
	lightWhite = "#fdfff1",
	lightYellow = "#e4db73",
	magenta = "#ae81ff",
	red = "#f82570",
	white = "#fdfff1",
	yellow = "#e4db73",
}
return monokai_classic
