local M = {}

-- @param string
local function hexToRgb(hexcolor)
	hexcolor = string.lower(hexcolor)
	return {
		r = tonumber(string.sub(hexcolor, 2, 3), 16),
		g = tonumber(string.sub(hexcolor, 4, 5), 16),
		b = tonumber(string.sub(hexcolor, 6, 7), 16),
	}
end

-- @param red, green, blue, alpha string
-- @param background background color behind the blended color
function M.rgba(red, green, blue, alpha, background)
	background = hexToRgb(background)
	-- new color
	red = (1 - alpha) * background.r + alpha * red
	green = (1 - alpha) * background.g + alpha * green
	blue = (1 - alpha) * background.b + alpha * blue
	-- rgb to hex
	red = string.format("%02x", red)
	green = string.format("%02x", green)
	blue = string.format("%02x", blue)
	return "#" .. red .. green .. blue
end

-- @param hexcolor color in hex
-- @param background background color behind the blended color
function M.blend(hexColor, background, alpha)
	local rgb = hexToRgb(hexColor)
	return M.rgba(rgb.r, rgb.g, rgb.b, alpha, background)
end

-- @param hexExtend color with eight digit
-- @param background background color behind the blended color
function M.hexExtend(hexColor, background)
	local hex6 = string.sub(hexColor, 1, 7)
	local alpha = tonumber(string.sub(hexColor, 8, 9), 16) / 255
	return M.blend(hex6, background, alpha)
end

local function highlight(group, properties)
	local link = properties.link
	if link ~= nil then
		local cmd = "hi! link " .. group .. " " .. link
		vim.api.nvim_command(cmd)
	else
		local bg = properties.bg == nil and "" or "guibg=" .. properties.bg
		local fg = properties.fg == nil and "" or "guifg=" .. properties.fg
		local style = properties.style == nil and "" or "gui=" .. properties.style

		local cmd = table.concat({
			"highlight",
			group,
			bg,
			fg,
			style,
		}, " ")

		vim.api.nvim_command(cmd)
	end
end

function M.initialise(skeleton)
	for group, properties in pairs(skeleton) do
		highlight(group, properties)
	end
end

return M
