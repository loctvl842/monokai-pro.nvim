---@class monokai-pro.util.ui
local M = {}

function M.create_menu(title, items, handler)
  local nui_ok, _ = pcall(require, "nui.menu")
  if not nui_ok then
    return
  end

  local Menu = require("nui.menu")
  local NuiText = require("nui.text")
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
      style = {
        "█",
        "█",
        "█",
        "█",
        "▀",
        "▀",
        "▀",
        "█",
      },
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
