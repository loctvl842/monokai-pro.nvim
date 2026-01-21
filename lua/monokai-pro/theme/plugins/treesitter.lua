---@type MonokaiPro.PluginSpec
return {
  name = "nvim-treesitter/nvim-treesitter",

  highlights = function(c, config)
    local styles = config.styles or {}

    -- stylua: ignore
    local highlights = {
      -- Annotations & Attributes
      ["@annotation"]                       = { fg = c.base.cyan, italic = styles.annotation and styles.annotation.italic },
      ["@attribute"]                        = { fg = c.base.green },

      -- Booleans & Constants
      ["@boolean"]                          = { fg = c.base.magenta },
      ["@constant"]                         = { fg = c.base.magenta },
      ["@constant.builtin"]                 = { fg = c.base.magenta },
      ["@constant.macro"]                   = { fg = c.base.magenta },

      -- Constructors & Fields
      ["@constructor"]                      = { fg = c.base.green },
      ["@field"]                            = { fg = c.base.red },

      -- Diff Changes
      ["@diff.delta"]                       = { fg = c.base.yellow },
      ["@diff.minus"]                       = { fg = c.base.red },
      ["@diff.plus"]                        = { fg = c.base.green },

      -- Functions & Methods
      ["@function"]                         = { fg = c.base.green },
      ["@function.builtin"]                 = { fg = c.base.green },
      ["@function.call"]                    = { fg = c.base.green },
      ["@function.macro"]                   = { fg = c.base.green },
      ["@function.method"]                  = { fg = c.base.green },
      ["@function.method.call"]             = { fg = c.base.green },

      -- Keywords
      ["@keyword"]                          = { fg = c.base.red, italic = styles.keyword and styles.keyword.italic },
      ["@keyword.conditional"]              = { fg = c.base.red },
      ["@keyword.coroutine"]                = { fg = c.base.red },
      ["@keyword.debug"]                    = { fg = c.base.red },
      ["@keyword.directive"]                = { fg = c.base.red },
      ["@keyword.directive.define"]         = { fg = c.base.red },
      ["@keyword.exception"]                = { fg = c.base.red },
      ["@keyword.function"]                 = { fg = c.base.cyan, italic = true },
      ["@keyword.import"]                   = { fg = c.base.red },
      ["@keyword.operator"]                 = { fg = c.base.red },
      ["@keyword.repeat"]                   = { fg = c.base.red },
      ["@keyword.return"]                   = { fg = c.base.red },
      ["@keyword.storage"]                  = { fg = c.base.red },
      ["@keyword.type"]                     = { fg = c.base.cyan, italic = true },

      -- Numbers & Operators
      ["@number"]                           = { fg = c.base.magenta },
      ["@number.float"]                     = { fg = c.base.magenta },
      ["@operator"]                         = { fg = c.base.red },

      -- Parameters & Variables
      ["@variable"]                         = { fg = c.base.white },
      ["@variable.builtin"]                 = { fg = c.base.dimmed1, italic = true },
      ["@variable.member"]                  = { fg = c.base.white },
      ["@variable.parameter"]               = { fg = c.base.blue, italic = styles.parameter and styles.parameter.italic },
      ["@variable.parameter.builtin"]       = { fg = c.base.blue, italic = styles.parameter and styles.parameter.italic },

      -- Punctuation
      ["@punctuation.bracket"]              = { fg = c.base.red },
      ["@punctuation.delimiter"]            = { fg = c.base.dimmed2 },
      ["@punctuation.special"]              = { fg = c.base.dimmed2 },

      -- Strings & Characters
      ["@string"]                           = { fg = c.base.yellow },
      ["@string.documentation"]             = { fg = c.base.dimmed3 },
      ["@string.escape"]                    = { fg = c.base.magenta },
      ["@string.regexp"]                    = { fg = c.base.yellow },
      ["@character"]                        = { fg = c.base.yellow },
      ["@character.printf"]                 = { fg = c.base.yellow },
      ["@character.special"]                = { fg = c.base.yellow },

      -- Tags & Markup
      ["@tag"]                              = { fg = c.base.red },
      ["@tag.attribute"]                    = { fg = c.base.cyan, italic = styles.tag_attribute and styles.tag_attribute.italic },
      ["@tag.builtin"]                      = { fg = c.base.red },
      ["@tag.delimiter"]                    = { fg = c.base.dimmed2 },

      -- Markup Highlight Groups
      ["@markup"]                           = { fg = c.base.white },
      ["@markup.emphasis"]                  = { fg = c.base.white, italic = true },
      ["@markup.environment"]               = { fg = c.base.white },
      ["@markup.environment.name"]          = { fg = c.base.white },
      ["@markup.heading"]                   = { fg = c.base.green, bold = true },
      ["@markup.italic"]                    = { fg = c.base.white, italic = true },
      ["@markup.link"]                      = { fg = c.base.blue, underline = true },
      ["@markup.link.label"]                = { fg = c.base.blue, underline = true },
      ["@markup.link.label.symbol"]         = { fg = c.base.blue, underline = true },
      ["@markup.link.url"]                  = { fg = c.base.blue, underline = true },
      ["@markup.list"]                      = { fg = c.base.white },
      ["@markup.list.checked"]              = { fg = c.base.white },
      ["@markup.list.markdown"]             = { fg = c.base.white },
      ["@markup.list.unchecked"]            = { fg = c.base.white },
      ["@markup.math"]                      = { fg = c.base.yellow },
      ["@markup.raw"]                       = { fg = c.base.yellow },
      ["@markup.raw.markdown_inline"]       = { fg = c.base.yellow },
      ["@markup.strikethrough"]             = { fg = c.base.white, strikethrough = true },
      ["@markup.strong"]                    = { fg = c.base.white, bold = true },
      ["@markup.underline"]                 = { fg = c.base.white, underline = true },

      -- Types
      ["@type"]                             = { fg = c.base.cyan },
      ["@type.builtin"]                     = { fg = c.base.cyan, italic = true },
      ["@type.definition"]                  = { fg = c.base.green },
      ["@type.qualifier"]                   = { fg = c.base.cyan },
      ["@module"]                           = { fg = c.base.cyan },
      ["@module.builtin"]                   = { fg = c.base.cyan },
      ["@namespace.builtin"]                = { fg = c.base.cyan },

      -- Labels
      ["@label"]                            = { fg = c.base.cyan },

      -- Language specific: C++
      ["@constant.cpp"]                     = { fg = c.base.cyan },
      ["@constant.macro.cpp"]               = { fg = c.base.red },
      ["@keyword.cpp"]                      = { fg = c.base.cyan, italic = styles.keyword and styles.keyword.italic },
      ["@namespace.cpp"]                    = { fg = c.base.green },
      ["@operator.cpp"]                     = { fg = c.base.red },
      ["@punctuation.delimiter.cpp"]        = { fg = c.sideBar.foreground },
      ["@type.cpp"]                         = { fg = c.base.blue, italic = styles.type and styles.type.italic },
      ["@variable.cpp"]                     = { fg = c.base.white },

      -- Language specific: Dockerfile/Bash
      ["@function.call.bash"]               = { fg = c.base.green },
      ["@keyword.dockerfile"]               = { fg = c.base.red },
      ["@lsp.type.class.dockerfile"]        = { fg = c.base.cyan },
      ["@parameter.bash"]                   = { fg = c.base.white },

      -- Language specific: Go
      ["@keyword.function.go"]              = { fg = c.base.red },
      ["@module.go"]                        = { fg = c.base.white },
      ["@string.escape.go"]                 = { fg = c.base.magenta },

      -- Language specific: LaTeX
      ["@function.macro.latex"]             = { fg = c.base.green },
      ["@punctuation.special.latex"]        = { fg = c.base.red },
      ["@string.latex"]                     = { fg = c.base.cyan },
      ["@text.emphasis.latex"]              = { italic = true },
      ["@text.environment.latex"]           = { fg = c.base.green },
      ["@text.environment.name.latex"]      = { fg = c.base.blue, italic = true },
      ["@text.math.latex"]                  = { fg = c.base.magenta },
      ["@text.strong.latex"]                = { bold = true },

      -- Language specific: Markdown
      ["@conceal.markdown"]                 = { bg = c.base.black },
      ["@markup.italic.markdown_inline"]    = { italic = true },
      ["@markup.link.label.markdown_inline"]= { fg = c.base.red },
      ["@markup.link.url.markdown_inline"]  = { fg = c.base.green, underline = true },
      ["@markup.raw.block.markdown"]        = { bg = c.base.black },
      ["@markup.raw.delimiter.markdown"]    = { bg = c.base.black, fg = c.base.dimmed2 },
      ["@markup.strong.markdown_inline"]    = { bold = true },
      ["@none.markdown"]                    = { bg = c.base.black },
      ["@punctuation.special.markdown"]     = { fg = c.base.dimmed2 },
      ["@text.emphasis.markdown_inline"]    = { fg = c.base.white, italic = true },
      ["@text.literal.block.markdown"]      = { bg = c.editor.background },
      ["@text.literal.markdown_inline"]     = { bg = c.base.dimmed4, fg = c.base.white },
      ["@text.quote.markdown"]              = { bg = c.base.dimmed5, fg = c.base.white },
      ["@text.reference.markdown_inline"]   = { fg = c.base.red },
      ["@text.strong.markdown_inline"]      = { bold = true },
      ["@text.uri.markdown_inline"]         = { fg = c.base.green, sp = c.base.green, underline = true },

      -- Language specific: SCSS
      ["@function.scss"]                    = { fg = c.base.cyan },
      ["@keyword.scss"]                     = { fg = c.base.red },
      ["@number.scss"]                      = { fg = c.base.magenta },
      ["@property.scss"]                    = { fg = c.base.green },
      ["@string.scss"]                      = { fg = c.base.blue, italic = true },
      ["@type.scss"]                        = { fg = c.base.cyan },

      -- Language specific: Lua
      ["@comment.documentation.lua"]        = { fg = c.base.cyan },
      ["@conditional.lua"]                  = { fg = c.base.red },
      ["@field.lua"]                        = { fg = c.base.white },
      ["@function.builtin.lua"]             = { fg = c.base.green },
      ["@keyword.function.lua"]             = { fg = c.base.red },
      ["@keyword.lua"]                      = { fg = c.base.red, italic = styles.keyword and styles.keyword.italic },
      ["@namespace.lua"]                    = { fg = c.base.red },
      ["@parameter.lua"]                    = { fg = c.base.blue, italic = true },
      ["@variable.lua"]                     = { fg = c.base.white },

      -- Language specific: YAML
      ["@number.yaml"]                      = { fg = c.base.magenta },
      ["@property.yaml"]                    = { fg = c.base.red },
      ["@punctuation.special.yaml"]         = { fg = c.base.white },
      ["@string.yaml"]                      = { fg = c.base.yellow },
    }

    -- Add markdown heading highlights
    for i = 1, 9 do
      highlights["@markup.heading." .. i .. ".markdown"] = { fg = c.base.yellow }
      highlights["@markup.heading." .. i .. ".marker.markdown"] = { fg = c.base.dimmed2 }
    end

    return highlights
  end,
}
