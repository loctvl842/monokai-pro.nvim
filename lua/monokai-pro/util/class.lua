---@class monokai-pro.util.class
local M = {}

---Checks if an instance is an instance of a class
---@param instance any The instance to check
---@param class table The class to check
function M.instanceof(instance, class)
  while instance do
    if instance == class then
      return true
    end
    instance = instance.super
  end
  return false
end

function M.typeof(instance)
  return getmetatable(instance)
end

return M
