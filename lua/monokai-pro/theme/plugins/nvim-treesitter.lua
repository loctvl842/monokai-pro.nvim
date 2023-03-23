local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  local styles = config.styles
  return {
    ["@include"] = { fg = c.base.red }, -- `import`
    ["@variable"] = { fg = c.base.white },
    ["@punctuation.delimiter"] = { fg = c.base.dimmed2 }, -- `;`
    ["@punctuation.bracket"] = { fg = c.base.dimmed2 }, -- `(`
    ["@constructor"] = { fg = c.base.red }, -- `StrictMode` in `<React.StrictMode>`
    ["@tag.delimiter"] = { fg = c.base.dimmed2 }, -- `<`, `>` in `<div>`
    ["@operator"] = { fg = c.base.red }, -- `=`, `=>`
    ["@keyword"] = { fg = c.base.cyan, italic = styles.keyword.italic }, -- `const`, `export`, `default`
    ["@parameter"] = { fg = c.base.white,  },

    ["@keyword.return"] = { fg = c.base.red },
    ["@keyword.operator"] = { fg = c.base.red },
    ["@method.call"] = { fg = c.base.green },
    ["@property"] = { fg = c.base.white },
    ["@function"] = { fg = c.base.green },
    ["@constant.builtin"] = { fg = c.base.magenta },
    ["@tag"] = { fg = c.base.red },
    ["@tag.attribute"] = { fg = c.base.cyan, italic = styles.tag_attribute.italic },
    ["@attribute"] = { fg = c.base.cyan },
    ["@conditional"] = { fg = c.base.red },
    ["@repeat"] = { fg = c.base.red },
    ["@keyword.function"] = { fg = c.base.cyan, bold = true, italic = styles.keyword.italic },
    ["@number"] = { fg = c.base.magenta },
    ["@boolean"] = { fg = c.base.magenta },
    ["@type.qualifier"] = { fg = c.base.red, italic = styles.type.italic },
    ["@annotation"] = { fg = c.base.cyan, italic = styles.annotation.italic },
    ["@field"] = { fg = c.base.red },
    -- scss
    ["@keyword.scss"] = { fg = c.base.red },
    ["@function.scss"] = { fg = c.base.cyan },
    ["@property.scss"] = { fg = c.base.green },
    ["@string.scss"] = { fg = c.base.blue, italic = true },
    ["@number.scss"] = { fg = c.base.magenta },
    ["@type.scss"] = { fg = c.base.cyan },
    -- cpp
    ["@keyword.cpp"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@namespace.cpp"] = { fg = c.base.white },
    ["@operator.cpp"] = { fg = c.base.red },
    ["@type.cpp"] = { fg = c.base.blue, italic = styles.type.italic },
    ["@variable.cpp"] = { fg = c.base.white },
    ["@constant.cpp"] = { fg = c.base.cyan },
    ["@constant.macro.cpp"] = { fg = c.base.red },
    ["@punctuation.delimiter.cpp"] = { fg = c.sideBar.foreground },
    -- python
    ["@type.python"] = { fg = c.base.cyan },
    ["@keyword.python"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@variable.builtin.python"] = {
      fg = c.editorSuggestWidget.foreground,
      italic = true,
    },
    ["@field.python"] = { fg = c.base.white },
    ["@variable.python"] = { fg = c.base.white },
    ["@constructor.python"] = { fg = c.base.green },
    ["@method.python"] = { fg = c.base.green },
    ["@function.builtin.python"] = { fg = c.base.cyan, italic = true },
    ["@exception.python"] = { fg = c.base.red, italic = true },
    ["@constant.python"] = { fg = c.base.magenta },
    ["@keyword.function.python"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@operator.python"] = { fg = c.base.red },
    ["@varibale.builtin.python"] = { fg = c.base.blue, italic = true },
    -- lua
    ["@variable.lua"] = { fg = c.base.white },
    ["@function.builtin.lua"] = { fg = c.base.green },
    ["@field.lua"] = { fg = c.base.white },
    ["@keyword.lua"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.lua"] = { fg = c.base.red },
    ["@conditional.lua"] = { fg = c.base.red },
    ["@namespace.lua"] = { fg = c.base.red },
  }
end

return M
