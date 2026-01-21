--- Event-based lazy loading trigger
local state = require("monokai-pro.theme.triggers")

local M = {}

--- Check if an event has already fired
---@param event string
---@return boolean
local function event_already_fired(event)
  if event == "VimEnter" or event == "UIEnter" then
    return vim.v.vim_did_enter == 1
  end
  -- For other events, we can't reliably detect if they've fired
  -- so we return false and let the autocmd handle it
  return false
end

--- Setup autocmd trigger for a plugin
---@param spec MonokaiPro.PluginSpec Plugin spec
---@param events string|string[] Event(s) to trigger on
function M.setup(spec, events)
  if type(events) == "string" then
    events = { events }
  end

  -- Check if any of the events have already fired
  for _, event in ipairs(events) do
    if event_already_fired(event) then
      state.apply(spec.name)
      return
    end
  end

  vim.api.nvim_create_autocmd(events, {
    once = true,
    callback = function()
      state.apply(spec.name)
    end,
  })
end

return M
