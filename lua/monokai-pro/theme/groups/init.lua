--- Groups registry with static discovery
---@class MonokaiPro.Theme.Groups
local M = {}

-- Static registry: all group module names (no filesystem scanning)
M.group_names = { "editor", "extra", "semantic", "syntax" }

--- Cache for loaded specs
---@type MonokaiPro.GroupSpec[]|nil
local specs_cache = nil

--- Load all group specs from the static registry
---@return MonokaiPro.GroupSpec[]
function M.load_specs()
  if specs_cache then
    return specs_cache
  end

  local specs = {}
  for _, name in ipairs(M.group_names) do
    local module_path = "monokai-pro.theme.groups." .. name
    local ok, spec = pcall(require, module_path)
    if ok and type(spec) == "table" and spec.highlights then
      specs[#specs + 1] = spec
    end
  end

  specs_cache = specs
  return specs
end

--- Generate all group highlights
---@param scheme MonokaiPro.Scheme
---@param config MonokaiPro.Config
---@return table<string, vim.api.keyset.highlight>
function M.generate(scheme, config)
  local highlights = {}

  for _, spec in ipairs(M.load_specs()) do
    local group_highlights = spec.highlights(scheme, config)
    highlights = vim.tbl_deep_extend("force", highlights, group_highlights)

    -- Handle extra highlights if present
    if spec.extra then
      local extra_highlights = spec.extra(scheme, config)
      highlights = vim.tbl_deep_extend("force", highlights, extra_highlights)
    end
  end

  return highlights
end

--- Clear the specs cache
function M.clear_cache()
  specs_cache = nil
end

return M
