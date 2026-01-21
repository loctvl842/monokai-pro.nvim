--- Groups registry with auto-discovery
---@class MonokaiPro.Theme.Groups
local M = {}

--- Cache for loaded specs
---@type MonokaiPro.GroupSpec[]|nil
local specs_cache = nil

--- Discover and load all group specs from this directory
---@return MonokaiPro.GroupSpec[]
function M.load_specs()
  if specs_cache then
    return specs_cache
  end

  local specs = {}
  local groups_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

  for _, file in ipairs(vim.fn.glob(groups_dir .. "/*.lua", false, true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      local module_path = "monokai-pro.theme.groups." .. name
      local ok, spec = pcall(require, module_path)
      if ok and type(spec) == "table" and spec.highlights then
        table.insert(specs, spec)
      end
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
