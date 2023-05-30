local M = {}

---@param c Colorscheme
M.setup = function(c)
  local status_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not status_ok then
    return
  end

  local icons = {
    [".babelrc"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "185",
      name = "Babelrc",
    },
    [".bash_profile"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "BashProfile",
    },
    [".bashrc"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "Bashrc",
    },
    ["git"] = {
      icon = "󰊢",
      color = c.base.red,
      cterm_color = "196",
      name = "GitLogo",
    },
    [".gitattributes"] = {
      icon = "󰊢",
      color = c.base.blue,
      cterm_color = "59",
      name = "GitAttributes",
    },
    [".gitconfig"] = {
      icon = "󰊢",
      color = c.base.blue,
      cterm_color = "59",
      name = "GitConfig",
    },
    [".gitignore"] = {
      icon = "󰊢",
      color = c.base.blue,
      cterm_color = "59",
      name = "GitIgnore",
    },
    [".gitmodules"] = {
      icon = "󰊢",
      color = c.base.blue,
      cterm_color = "59",
      name = "GitModules",
    },
    [".npmignore"] = {
      icon = "",
      color = c.base.red,
      cterm_color = "161",
      name = "NPMIgnore",
    },
    [".npmrc"] = {
      icon = "",
      color = c.base.red,
      cterm_color = "161",
      name = "NPMrc",
    },
    [".settings.json"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "98",
      name = "SettingsJson",
    },
    [".zprofile"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "Zshprofile",
    },
    [".zshenv"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "Zshenv",
    },
    [".zshrc"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "Zshrc",
    },
    ["Brewfile"] = {
      icon = "",
      color = c.base.red,
      cterm_color = "52",
      name = "Brewfile",
    },
    ["COPYING"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "185",
      name = "License",
    },
    ["COPYING.LESSER"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "185",
      name = "License",
    },
    ["Gemfile$"] = {
      icon = "",
      color = c.base.red,
      cterm_color = "52",
      name = "Gemfile",
    },
    ["LICENSE"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "179",
      name = "License",
    },
    ["bash"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "113",
      name = "Bash",
    },
    ["bmp"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "140",
      name = "Bmp",
    },
    ["c"] = {
      icon = "󰙱",
      color = c.base.red,
      cterm_color = "75",
      name = "C",
    },
    ["c++"] = {
      icon = "󰙲",
      color = c.base.cyan,
      cterm_color = "204",
      name = "CPlusPlus",
    },
    ["cc"] = {
      icon = "󰙲",
      color = c.base.cyan,
      cterm_color = "204",
      name = "CPlusPlus",
    },
    ["cp"] = {
      icon = "󰙲",
      color = c.base.cyan,
      cterm_color = "67",
      name = "Cp",
    },
    ["cpp"] = {
      icon = "󰙲",
      color = c.base.cyan,
      cterm_color = "67",
      name = "Cpp",
    },
    ["css"] = {
      icon = "",
      color = c.base.cyan,
      cterm_color = "39",
      name = "Css",
    },
    ["cxx"] = {
      icon = "󰙲",
      color = c.base.cyan,
      cterm_color = "67",
      name = "Cxx",
    },
    ["db"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "188",
      name = "Db",
    },
    ["desktop"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "60",
      name = "DesktopEntry",
    },
    ["java"] = {
      icon = " ",
      color = c.base.cyan,
      cterm_color = "167",
      name = "Java",
    },
    ["js"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "185",
      name = "Js",
    },
    ["json"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "185",
      name = "Json",
    },
    ["jsx"] = {
      icon = "󰜈",
      color = c.base.cyan,
      cterm_color = "67",
      name = "Jsx",
    },
    ["lua"] = {
      icon = "󰢱",
      color = c.base.cyan,
      cterm_color = "74",
      name = "Lua",
    },
    ["md"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "white",
      name = "Md",
    },
    ["py"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "61",
      name = "Py",
    },
    ["sh"] = {
      icon = "",
      color = c.base.green,
      cterm_color = "59",
      name = "Sh",
    },
    ["sql"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "188",
      name = "Sql",
    },
    ["sqlite"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "188",
      name = "Sql",
    },
    ["sqlite3"] = {
      icon = "",
      color = c.base.magenta,
      cterm_color = "188",
      name = "Sql",
    },
    ["toml"] = {
      icon = "",
      color = c.base.yellow,
      cterm_color = "66",
      name = "Toml",
    },
    ["xml"] = {
      icon = "󰅴",
      color = c.base.blue,
      cterm_color = "173",
      name = "Xml",
    },
    [".env"] = {
      icon = "󰌾",
      color = c.base.yellow,
      cterm_color = "226",
      name = "Env",
    },
  }
  webDevicons.set_icon(icons)
end

return M
