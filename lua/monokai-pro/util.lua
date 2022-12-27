local M = {}
local Menu = require("nui.menu")
local NuiText = require("nui.text")

-- convert hex color string to a table rgb `{r: ,g: ,b: }`
---@param hexcolor string
local function hexToRgb(hexcolor)
  hexcolor = string.lower(hexcolor)
  return {
    r = tonumber(string.sub(hexcolor, 2, 3), 16),
    g = tonumber(string.sub(hexcolor, 4, 5), 16),
    b = tonumber(string.sub(hexcolor, 6, 7), 16),
  }
end

-- turn `8-digit` hex color to `6-digit` hex color
---@param hexColor string
---@param background string
function M.hexExtend(hexColor, background)
  local hex6 = string.sub(hexColor, 1, 7)
  local alpha = tonumber(string.sub(hexColor, 8, 9), 16) / 255
  return M.blend(hex6, background, alpha)
end

-- turn `8-digit` hex color to `6-digit` hex color but with may miss base
---@param colorValue string
---@param base string
---@return string|nil
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

-- turn the custom `hl_config` into `hl_config` used in `nvim.api.nvim_set_hl`
---@param hl_config string
---@return string
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

-- create `highlight group`
---@param group string
---@param properties table
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

-- generate `hex color` based `rgba` function
---@param alpha number
---@param bg_hex string
function M.rgba(red, green, blue, alpha, bg_hex)
  local bg_rgb = hexToRgb(bg_hex)
  -- new color
  red = (1 - alpha) * bg_rgb.r + alpha * red
  green = (1 - alpha) * bg_rgb.g + alpha * green
  blue = (1 - alpha) * bg_rgb.b + alpha * blue
  -- rgb to hex
  red = string.format("%02x", red)
  green = string.format("%02x", green)
  blue = string.format("%02x", blue)
  return "#" .. red .. green .. blue
end

-- blend a hex color. For example to have `opacity: 0.8`, we use `blend("#000000", 0.8)`
---@param hexcolor string
---@param background string
---@param alpha number
function M.blend(hexColor, background, alpha)
  local rgb = hexToRgb(hexColor)
  return M.rgba(rgb.r, rgb.g, rgb.b, alpha, background)
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

---@param skeleton table
function M.initialise(skeleton)
  for group, properties in pairs(skeleton) do
    highlight(group, properties)
  end
end

---@param title string
---@param items table
---@param handler function
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

---@param theme_palette table
---@param config table
function M.highlightBufferLineIcon(theme_palette, config)
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    return
  end
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      local ft = vim.bo.filetype
      local _, icon_name = webDevicons.get_icon_by_filetype(ft, { default = true })
      local _, icon_color = webDevicons.get_icon_color_by_filetype(ft, { default = true })
      if not icon_name then
        return
      end
      local iconSkeleton = {
        ["BufferLine" .. icon_name .. "Selected"] = {
          bg = config.transparent_background and "NONE" or theme_palette.tab.activeBackground,
          fg = icon_color,
          sp = theme_palette.tab.activeBorder,
          underline = config.plugins.bufferline.underline_selected
        },
        ["BufferLine" .. icon_name] = {
          bg = theme_palette.tab.inactiveBackground,
          fg = icon_color,
        },
        ["BufferLine" .. icon_name .. "Inactive"] = {
          bg = config.transparent_background and "NONE" or theme_palette.tab.unfocusedActiveBackground,
          fg = icon_color,
          sp = theme_palette.tab.unfocusedActiveBorder,
          underline = config.plugins.bufferline.underline_visible
        },
      }
      M.initialise(iconSkeleton)
    end,
  })
end

-- generate list of skeletons from plugin with `attribute` is name of plugin and `value` is plugin highlight
---@param plugins table
function M.load_skeletons(plugins)
  local editor = require("monokai-pro.editor")
  local syntax = require("monokai-pro.syntax")
  local semantic_tokens = require("monokai-pro.semantic_tokens")
  local special = require("monokai-pro.special")
  local skeletons = {
    ["editor"] = editor,
    ["syntax"] = syntax,
    ["special"] = special,
    ["semantic_tokens"] = semantic_tokens,
  }

  for _, p in ipairs(plugins) do
    local plugin_ok, pluginConfig = pcall(require, "monokai-pro.plugins." .. p)
    if not plugin_ok then
      local msg = "There is no highlight config named " .. p
      local level = "warn"
      util.notify(msg, level)
      goto continue
    end
    skeletons[p] = pluginConfig
    ::continue::
  end
  return skeletons
end

return M
