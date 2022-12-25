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

-- @param hexColor color with eight digit
-- @param background background color behind the blended color
function M.hexExtend(hexColor, background)
	local hex6 = string.sub(hexColor, 1, 7)
	local alpha = tonumber(string.sub(hexColor, 8, 9), 16) / 255
	return M.blend(hex6, background, alpha)
end

function M.lightenDarkenColor(color, amt)
	color = hexToRgb(color)
	color.r = (color.r + amt > 255) and 255 or (color.r + amt)
	color.g = (color.g + amt > 255) and 255 or (color.g + amt)
	color.b = (color.b + amt > 255) and 255 or (color.b + amt)

	color.r = (color.r < 0) and 0 or color.r
	color.g = (color.g < 0) and 0 or color.g
	color.b = (color.b < 0) and 0 or color.b

	-- rgb to hex
	local red = string.format("%02x", color.r)
	local green = string.format("%02x", color.g)
	local blue = string.format("%02x", color.b)
	return "#" .. red .. green .. blue
end

local function getRealColor(colorValue, base)
	if colorValue == nil or string.len(colorValue) ~= 9 then
		return colorValue
	end
	if base == nil then
		base = C.editor.background
	end
	if string.len(base) == 9 then
		base = M.hexExtend(base, C.editor.background)
	end
	return M.hexExtend(colorValue, base)
end

local function generate_hl_val(hl_config)
	local bg_value = getRealColor(hl_config.bg, hl_config.bg_base)
	local fg_value = getRealColor(hl_config.fg, hl_config.fg_base)
	local sp_value = getRealColor(hl_config.sp, bg_value)
	hl_config.bg = bg_value
	hl_config.fg = fg_value
	hl_config.sp = sp_value
	hl_config.bg_base = nil
	hl_config.fg_base = nil
	hl_config.style = nil
	return hl_config
end

local function highlight(group, properties)
	local link = properties.link
	if link ~= nil then
		local cmd = "hi! link " .. group .. " " .. link
		vim.api.nvim_command(cmd)
		return
	end
	local hl_val = generate_hl_val(properties)
	vim.api.nvim_set_hl(0, group, hl_val)
end

-- @param highlight group to get (string)
-- @return table { foreground, background }
function M.get_highlight(group)
	local hl = vim.api.nvim_get_hl_by_name(group, true)
	local hl_config = {}
	for key, value in pairs(hl) do
		hl_config[key] = string.format("#%02x", value)
	end
	return hl_config
end

--- Wrapper around `vim.notify` that adds message metadata
---@param msg string | string[]
---@param level "error" | "warn" | "info" | "debug" | "trace"
function M.notify(msg, level, opts)
	opts = opts or {}
	level = vim.log.levels[level:upper()]
	if type(msg) == "table" then
		msg = table.concat(msg, "\n")
	end
	local nopts = { title = "Monokai-pro" }
	if opts.once then
		return vim.schedule(function()
			vim.notify_once(msg, level, nopts)
		end)
	end
	vim.schedule(function()
		vim.notify(msg, level, nopts)
	end)
end

function M.initialise(skeleton)
	for group, properties in pairs(skeleton) do
		highlight(group, properties)
	end
end

local Menu = require("nui.menu")
local NuiText = require("nui.text")
function M.create_menu(title, items, handler)
	local menuItems = {
		Menu.separator("", {
			char = "-",
			text_align = "right",
		}),
	}
	for _, it in ipairs(items) do
		table.insert(menuItems, Menu.item("   " .. it, { value = it }))
	end
	local popup_border_text = NuiText(" " .. title .. " ", "SPTitle")
	local menu = Menu({
		position = "50%",
		size = {
			width = 25,
			height = #items + 1,
		},
		border = {
			style = { "█", "█", "█", "█", "▀", "▀", "▀", "█" },
			text = {
				top = popup_border_text,
				top_align = "center",
				text_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:SPNormalFloat,FloatBorder:SPFloatBorder,CursorLine:SPCursorLine",
		},
	}, {
		lines = menuItems,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_submit = handler,
	})
	return menu
end

return M
