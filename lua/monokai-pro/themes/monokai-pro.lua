local util = require("monokai-pro.util")
local monokai_pro = {
	background = "#2d2a2e",
	foreground = "#fcfcfa",
	lineHighlightBackground = util.hexExtend("#fcfcfa0c", "#2d2a2e"), --background: background
	lineNumberForeground = "#5b595c",
	lineNumberActiveForeground = "#c1c0c0",
	selectionBackground = util.hexExtend("#c1c0c026", "#2d2a2e"), -- background: background
	findMatchBackground = util.hexExtend("#fcfcfa26", "#2d2a2e"), -- background: background
	findMatchHighlightBackground = util.hexExtend("#fcfcfa26", "#2d2a2e"), -- background: background
	foldBackground = util.hexExtend("#fcfcfa0c", "#2d2a2e"), -- background: background
	hoverWidgetBackground = "#403e41",
	suggestWidgetBackground = "#403e41",
	suggestWidgetForeground = "#c1c0c0",
	suggestWidgetHighlightForeground = "#fcfcfa",
	suggestWidgetSelectedBackground = "#727072",
	sideBarBackground = "#221f22",
	sideBarForeground = "#939293",
	listActiveSelectionBackground = util.hexExtend("#fcfcfa0c", "#221f22"), -- background: sideBarBackground
	sideBarSectionHeaderForeground = "#727072",
	breadcrumbForeground = "#939293",
	scrollbarSliderBackground = util.hexExtend("#c1c0c026", "#403e41"), -- background: suggestWidgetBackground
	indentGuideBackground = "#403E41",
	indentGuideActiveBackground = "#5B595C",
	wordHighlightBackground = util.hexExtend("#fcfcfa27", "#2d2a2e"), -- background: background

	bufferline_background = util.lightenDarkenColor("#2d2a2e", 15),

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
}
return monokai_pro
