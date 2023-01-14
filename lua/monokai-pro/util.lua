local hp = require("monokai-pro.color_helper")
local Menu = require("nui.menu")
local NuiText = require("nui.text")

local M = {}

local getRealColor = function(hex_color, base)
  if hex_color == nil or string.len(hex_color) ~= 9 then
    return hex_color
  end
  local config = require("monokai-pro.config").options
  --- @module "monokai-pro.palette.pro"
  local c = require("monokai-pro.palette." .. config.filter)
  if base == nil then
    base = c.editor.background
  end
  if string.len(base) == 9 then
    base = hp.hexExtend(base, c.editor.background)
  end
  return hp.hexExtend(hex_color, base)
end

local genHlValue = function(value)
  local bg_value = getRealColor(value.bg, value.bg_base)
  local fg_value = getRealColor(value.fg, value.fg_base)
  local sp_value = getRealColor(value.sp, bg_value)
  value.bg = bg_value
  value.fg = fg_value
  value.sp = sp_value
  value.bg_base = nil
  value.fg_base = nil
  value.style = nil
  return value
end

local highlight = function(group, value)
  local link = value.link
  if link ~= nil then
    local cmd = "hi! link " .. group .. " " .. link
    vim.api.nvim_command(cmd)
    return
  end
  local generatedHlValue = genHlValue(value)
  vim.api.nvim_set_hl(0, group, generatedHlValue)
end

M.create_menu = function(title, items, handler)
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
    relative = "editor",
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

local draw = function(groups)
  if groups == nil then
    return
  end
  for group, value in pairs(groups) do
    highlight(group, value)
  end
end

M.notify = function(msg, level, opts)
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

---@param slices Slices
M.load = function(slices)
  if vim.g.colors_name then
    vim.cmd([[hi clear]])
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "monokai-pro"

  for sliceName, groups in pairs(slices) do
    local draw_success, _ = pcall(draw, groups)
    if not draw_success then
      local msg = "Failed to draw slice: " .. sliceName
      local level = "error"
      M.notify(msg, level)
      goto continue
    end
    ::continue::
  end

  local bufferline_icon_group = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
  draw(bufferline_icon_group)
  -- draw bufferline icons
  vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
    pattern = "*",
    callback = function()
      bufferline_icon_group = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
      draw(bufferline_icon_group)
    end,
  })
end

return M
