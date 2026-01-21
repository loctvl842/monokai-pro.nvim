---@class MonokaiPro.ConfigModule
local M = {}

local defaults = require("monokai-pro.config.defaults")

---@type MonokaiPro.Config
local current_config = vim.deepcopy(defaults)

--- Setup the configuration
---@param user_config? MonokaiPro.Config
function M.setup(user_config)
  current_config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), user_config or {})

  -- Handle day/night mode
  local day_night = current_config.day_night
  if day_night and day_night.enable then
    current_config.filter = M.is_daytime() and day_night.day_filter or day_night.night_filter
  end

  -- Handle light background
  if vim.o.background == "light" and current_config.filter ~= "light" then
    current_config.filter = "light"
  end
end

--- Extend the current configuration (used when switching filters)
---@param user_config? MonokaiPro.Config
function M.extend(user_config)
  current_config = vim.tbl_deep_extend("force", current_config, user_config or {})
end

--- Get the current configuration
---@return MonokaiPro.Config
function M.get()
  return current_config
end

--- Check if the current time is daytime (6am to 6pm)
---@return boolean
function M.is_daytime()
  local current_hour = tonumber(os.date("%H"))
  return current_hour >= 6 and current_hour < 18
end

--- Get all available filters
---@return MonokaiPro.Filter[]
function M.get_filters()
  return { "pro", "classic", "octagon", "machine", "ristretto", "spectrum", "light" }
end

--- Check if a filter is valid
---@param filter string
---@return boolean
function M.is_valid_filter(filter)
  return vim.tbl_contains(M.get_filters(), filter)
end

return M
