local util = require("monokai-pro.util")
---@class MonokaiProOptions
---@field plugins? PluginConfig
---@field override? fun(c: Colorscheme)
---@field overridePalette? fun(filter: Filter) A function to override palette
---@field overrideScheme? fun(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) A function to override scheme
local config = {
  transparent_background = false,
  terminal_colors = true,
  devicons = false,
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  filter = vim.o.background == "light" and "classic" or "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  day_night = {
    enable = false,
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    "toggleterm",
    "telescope",
    "renamer",
    "notify",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
}

---@class Config: MonokaiProOptions
local M = setmetatable({}, {
  __index = function(_, k)
    return rawget(config or {}, k)
  end,
  __newindex = function(t, k, v)
    if rawget(config or {}, k) ~= nil then
      error("monokai-pro.nvim: Attempt to change option " .. k .. " directly, use `setup` instead")
    else
      rawset(t, k, v)
    end
  end,
  __call = function(t, ...)
    return t.setup(...)
  end,
})

---@param options? MonokaiProOptions
M.setup = function(options)
  config = vim.tbl_deep_extend("force", config, options or {})
  local day_night = config.day_night
  if day_night and day_night.enable then
    config.filter = util.is_daytime() and day_night.day_filter or day_night.night_filter
  end
end

---@param options? MonokaiProOptions
M.extend = function(options)
  config = vim.tbl_deep_extend("force", {}, config or options, options or {})
end

M.setup()

return M
