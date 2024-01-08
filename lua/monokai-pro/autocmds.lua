local utils = require("monokai-pro.util")

local function augroup(name)
  return vim.api.nvim_create_augroup("MonokaiPro$" .. name, { clear = true })
end

local bufferline_icon_group = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
-- draw bufferline icons
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWinEnter", "BufRead" }, {
  group = augroup("bufferline"),
  pattern = "*",
  callback = function()
    if vim.g.colors_name ~= "monokai-pro" then
      return true
    end
    bufferline_icon_group = require("monokai-pro.theme.plugins.bufferline").setup_bufferline_icon()
    utils.draw(bufferline_icon_group)
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  group = augroup("bufferline"),
  pattern = "*",
  callback = function()
    local buffers = vim.api.nvim_list_bufs()
    print(vim.inspect(buffers))
    for _, buf in ipairs(buffers) do
      local buf_name = vim.api.nvim_buf_get_name(buf)
      -- buf_name is a path. Get file name from buf_name
      local filename = vim.fn.fnamemodify(buf_name, ":t")
      print(buf_name)
      -- if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
      --
      -- end
    end
  end,
})
