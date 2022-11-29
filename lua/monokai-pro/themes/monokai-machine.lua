local util = require("monokai-pro.util")
local monokai_machine = {
	background = "#273136",
	foreground = "#f2fffc",
	lineHighlightBackground = util.hexExtend("#f2fffc0c", "#273136"), -- background: background
	lineNumberForeground = "#545f62",
	lineNumberActiveForeground = "#b8c4c3",
	selectionBackground = util.hexExtend("#b8c4c326", "#273136"), -- background: background
	findMatchBackground = util.hexExtend("#f2fffc26", "#273136"), -- background: background
	findMatchHighlightBackground = util.hexExtend("#f2fffc26", "#273136"), -- background: background
	foldBackground = util.hexExtend("#f2fffc0c", "#273136"), -- background: background
	hoverWidgetBackground = "#3a4449",
	suggestWidgetBackground = "#3a4449",
	suggestWidgetForeground = "#b8c4c3",
	suggestWidgetHighlightForeground = "#f2fffc",
	suggestWidgetSelectedBackground = "#6b7678",
	sideBarBackground = "#1d2528",
	sideBarForeground = "#8b9798",
	listActiveSelectionBackground = util.hexExtend("#f2fffc0c", "#1d2528"), -- background: sideBarBackground
	sideBarSectionHeaderForeground = "#6b7678",
	breadcrumbForeground = "#8b9798",
	scrollbarSliderBackground = util.hexExtend("#b8c4c326", "#3a4449"), -- background: suggestWidgetBackground
	indentGuideBackground = "#3a4449",
	indentGuideActiveBackground = "#545f62",
	wordHighlightBackground = util.hexExtend("#f2fffc26", "#273136"), -- background: background

	bufferline_background = util.lightenDarkenColor("#273136", 15),

	black = "#1d2528",
	blue = "#ffb270",
	lightBlack = "#6b7678",
	lightBlue = "#ffb270",
	lightCyan = "#7cd5f1",
	lightGreen = "#a2e57b",
	lightMagenta = "#baa0f8",
	lightRed = "#ff6d7e",
	lightWhite = "#f2fffc",
	lightYellow = "#ffed72",
	cyan = "#7cd5f1",
	green = "#a2e57b",
	magenta = "#baa0f8",
	red = "#ff6d7e",
	white = "#f2fffc",
	yellow = "#ffed72",
}
return monokai_machine
