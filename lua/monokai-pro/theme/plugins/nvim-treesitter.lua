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
    ["@parameter"] = { fg = c.base.white },
    ["@string.documentation"] = { fg = c.base.dimmed3 },
    ["@type.builtin"] = { fg = c.base.cyan },
    ["@_isinstance"] = { fg = c.base.green },

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
    ["@type.python"] = { fg = c.base.white },
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
    ["@parameter.python"] = { fg = c.base.blue, italic = true },
    -- lua
    ["@variable.lua"] = { fg = c.base.white },
    ["@function.builtin.lua"] = { fg = c.base.green },
    ["@field.lua"] = { fg = c.base.white },
    ["@keyword.lua"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.lua"] = { fg = c.base.red },
    ["@conditional.lua"] = { fg = c.base.red },
    ["@namespace.lua"] = { fg = c.base.red },
    ["@comment.documentation.lua"] = { fg = c.base.cyan },
    ["@parameter.lua"] = { fg = c.base.blue, italic = true },
    -- latex
    ["@text.environment.latex"] = { fg = c.base.green },
    ["@text.environment.name.latex"] = { fg = c.base.blue, italic = true },
    ["@punctuation.special.latex"] = { fg = c.base.red },
    ["@text.math.latex"] = { fg = c.base.magenta },
    ["@text.strong.latex"] = { bold = true },
    ["@text.emphasis.latex"] = { italic = true },
    ["@string.latex"] = { fg = c.base.cyan },
    ["@function.macro.latex"] = { fg = c.base.green },
    -- Dockerfile
    ["@keyword.dockerfile"] = { fg = c.base.red },
    ["@lsp.type.class.dockerfile"] = { fg = c.base.cyan },
    ["@function.call.bash"] = { fg = c.base.green },
    ["@parameter.bash"] = { fg = c.base.white },
    -- Markdown
    ["@text.literal.block.markdown"] = { bg = c.editor.background },
    ["@text.strong.markdown_inline"] = { fg = c.base.white, bold = true },
    ["@text.emphasis.markdown_inline"] = { fg = c.base.white, italic = true },
    ["@text.literal.markdown_inline"] = { bg = c.base.dimmed4, fg = c.base.white },
    ["@text.quote.markdown"] = { bg = c.base.dimmed5, fg = c.base.white },
    ["@none.markdown"] = { bg = c.base.dark },
    ["@text.uri.markdown_inline"] = { fg = c.base.green, sp = c.base.green, underline = true },
    ["@text.reference.markdown_inline"] = { fg = c.base.red },
    ["@punctuation.special.markdown"] = { fg = c.base.dimmed2 },
    ["@conceal.markdown"] = { bg = c.base.dark },
  }
end

return M
