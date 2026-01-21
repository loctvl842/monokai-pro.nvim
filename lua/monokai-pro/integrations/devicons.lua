---@class MonokaiPro.Integrations.Devicons
local M = {}

--- Setup devicons with Monokai Pro colors
function M.setup()
  local ok, web_devicons = pcall(require, "nvim-web-devicons")
  if not ok then
    return
  end

  local monokai = require("monokai-pro")
  local scheme = monokai.get_scheme()

  -- stylua: ignore
  local icons          = {
    [".babelrc"]       = { icon = "", color = scheme.base.yellow, cterm_color  = "185", name   = "Babelrc" },
    [".bash_profile"]  = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "BashProfile" },
    [".bashrc"]        = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "Bashrc" },
    ["git"]            = { icon = "󰊢", color = scheme.base.red, cterm_color     = "196", name   = "GitLogo" },
    [".gitattributes"] = { icon = "󰊢", color = scheme.base.blue, cterm_color    = "59", name    = "GitAttributes" },
    [".gitconfig"]     = { icon = "󰊢", color = scheme.base.blue, cterm_color    = "59", name    = "GitConfig" },
    [".gitignore"]     = { icon = "󰊢", color = scheme.base.blue, cterm_color    = "59", name    = "GitIgnore" },
    [".gitmodules"]    = { icon = "󰊢", color = scheme.base.blue, cterm_color    = "59", name    = "GitModules" },
    [".npmignore"]     = { icon = "", color = scheme.base.red, cterm_color     = "161", name   = "NPMIgnore" },
    [".npmrc"]         = { icon = "", color = scheme.base.red, cterm_color     = "161", name   = "NPMrc" },
    [".settings.json"] = { icon = "", color = scheme.base.magenta, cterm_color = "98", name    = "SettingsJson" },
    [".zprofile"]      = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "Zshprofile" },
    [".zshenv"]        = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "Zshenv" },
    [".zshrc"]         = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "Zshrc" },
    ["Brewfile"]       = { icon = "", color = scheme.base.red, cterm_color     = "52", name    = "Brewfile" },
    ["COPYING"]        = { icon = "", color = scheme.base.yellow, cterm_color  = "185", name   = "License" },
    ["COPYING.LESSER"] = { icon = "", color = scheme.base.yellow, cterm_color  = "185", name   = "License" },
    ["Gemfile$"]       = { icon = "", color = scheme.base.red, cterm_color     = "52", name    = "Gemfile" },
    ["LICENSE"]        = { icon = "", color = scheme.base.yellow, cterm_color  = "179", name   = "License" },
    ["bash"]           = { icon = "", color = scheme.base.green, cterm_color   = "113", name   = "Bash" },
    ["bmp"]            = { icon = "", color = scheme.base.magenta, cterm_color = "140", name   = "Bmp" },
    ["c"]              = { icon = "󰙱", color = scheme.base.red, cterm_color     = "75", name    = "C" },
    ["c++"]            = { icon = "󰙲", color = scheme.base.cyan, cterm_color    = "204", name   = "CPlusPlus" },
    ["cc"]             = { icon = "󰙲", color = scheme.base.cyan, cterm_color    = "204", name   = "CPlusPlus" },
    ["cp"]             = { icon = "󰙲", color = scheme.base.cyan, cterm_color    = "67", name    = "Cp" },
    ["cpp"]            = { icon = "󰙲", color = scheme.base.cyan, cterm_color    = "67", name    = "Cpp" },
    ["css"]            = { icon = "", color = scheme.base.cyan, cterm_color    = "39", name    = "Css" },
    ["cxx"]            = { icon = "󰙲", color = scheme.base.cyan, cterm_color    = "67", name    = "Cxx" },
    ["db"]             = { icon = "", color = scheme.base.yellow, cterm_color  = "188", name   = "Db" },
    ["desktop"]        = { icon = "", color = scheme.base.magenta, cterm_color = "60", name    = "DesktopEntry" },
    ["java"]           = { icon = "", color = scheme.base.cyan, cterm_color    = "167", name   = "Java" },
    ["js"]             = { icon = "", color = scheme.base.yellow, cterm_color  = "185", name   = "Js" },
    ["json"]           = { icon = "", color = scheme.base.magenta, cterm_color = "185", name   = "Json" },
    ["jsx"]            = { icon = "󰜈", color = scheme.base.cyan, cterm_color    = "67", name    = "Jsx" },
    ["lua"]            = { icon = "󰢱", color = scheme.base.cyan, cterm_color    = "74", name    = "Lua" },
    ["md"]             = { icon = "", color = scheme.base.green, cterm_color   = "white", name = "Md" },
    ["py"]             = { icon = "", color = scheme.base.green, cterm_color   = "61", name    = "Py" },
    ["sh"]             = { icon = "", color = scheme.base.green, cterm_color   = "59", name    = "Sh" },
    ["sql"]            = { icon = "", color = scheme.base.magenta, cterm_color = "188", name   = "Sql" },
    ["sqlite"]         = { icon = "", color = scheme.base.magenta, cterm_color = "188", name   = "Sql" },
    ["sqlite3"]        = { icon = "", color = scheme.base.magenta, cterm_color = "188", name   = "Sql" },
    ["toml"]           = { icon = "", color = scheme.base.yellow, cterm_color  = "66", name    = "Toml" },
    ["xml"]            = { icon = "󰅴", color = scheme.base.blue, cterm_color    = "173", name   = "Xml" },
    [".env"]           = { icon = "󰌾", color = scheme.base.yellow, cterm_color  = "226", name   = "Env" },
    ["ts"]             = { icon = "󰛦", color = scheme.base.cyan, cterm_color    = "74", name    = "Ts" },
    ["go"]             = { icon = "", color = scheme.base.cyan, cterm_color    = "74", name    = "Go" },
    ["go.mod"]         = { icon = "", color = scheme.base.blue, cterm_color    = "197", name   = "GoMod" },
    ["go.sum"]         = { icon = "", color = scheme.base.yellow, cterm_color  = "197", name   = "GoSum" },
  }

  web_devicons.set_icon(icons)
end

return M
