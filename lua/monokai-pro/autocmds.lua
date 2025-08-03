local util = require("monokai-pro.util")

local function augroup(name)
  return vim.api.nvim_create_augroup("MonokaiPro$" .. name, { clear = true })
end

local bufferline_icon_group = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
-- draw bufferline icons
vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
  group = augroup("bufferline"),
  pattern = "*",
  callback = function()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf_id in ipairs(buffers) do
      util.try(function()
        local buf_name = vim.api.nvim_buf_get_name(buf_id)
        if buf_name ~= nil and buf_name ~= "" then
          -- Get extension
          local filename = vim.fn.fnamemodify(buf_name, ":t")
          local extension = vim.fn.fnamemodify(buf_name, ":e")
          local icon = util.devicons.get(filename, extension)
          if icon == nil then
            return
          end
          bufferline_icon_group =
            require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon(icon.hl_name, icon.color)
          util.theme.draw(bufferline_icon_group)
        end
      end, {
        on_error = function()
          -- Error after installing a plugin
          -- do nothing
        end,
      })
    end
  end,
})
