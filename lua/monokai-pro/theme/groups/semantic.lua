local colors = require("monokai-pro.colors")

---@type MonokaiPro.GroupSpec
return {
  name = "semantic",

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      -- Basic types
      ["@lsp.type.boolean"]                       = { link = "@boolean" },
      ["@lsp.type.builtinType"]                   = { link = "@type.builtin" },
      ["@lsp.type.class"]                         = {},
      ["@lsp.type.comment"]                       = { link = "@comment" },
      ["@lsp.type.decorator"]                     = { link = "@attribute" },
      ["@lsp.type.deriveHelper"]                  = { link = "@attribute" },
      ["@lsp.type.enum"]                          = { link = "@type" },
      ["@lsp.type.enumMember"]                    = { link = "@constant" },
      ["@lsp.type.escapeSequence"]                = { link = "@string.escape" },
      ["@lsp.type.formatSpecifier"]               = { link = "@markup.list" },
      ["@lsp.type.generic"]                       = { link = "@variable" },
      ["@lsp.type.interface"]                     = { fg = colors.lighten(scheme.base.cyan, 10) },
      ["@lsp.type.keyword"]                       = { link = "@keyword" },
      ["@lsp.type.lifetime"]                      = { link = "@keyword.storage" },
      ["@lsp.type.namespace"]                     = { link = "@module" },
      ["@lsp.type.namespace.python"]              = { link = "@variable" },
      ["@lsp.type.number"]                        = { link = "@number" },
      ["@lsp.type.operator"]                      = { link = "@operator" },
      ["@lsp.type.parameter"]                     = {},
      ["@lsp.type.property"]                      = { link = "@property" },
      ["@lsp.type.selfKeyword"]                   = { link = "@variable.builtin" },
      ["@lsp.type.selfTypeKeyword"]               = { link = "@variable.builtin" },
      ["@lsp.type.string"]                        = { link = "@string" },
      ["@lsp.type.type"]                          = {},
      ["@lsp.type.typeAlias"]                     = { link = "@type.definition" },
      ["@lsp.type.unresolvedReference"]           = { undercurl = true, sp = scheme.base.red },
      ["@lsp.type.variable"]                      = {},

      -- Type modifiers
      ["@lsp.typemod.class.defaultLibrary"]       = { link = "@type.builtin" },
      ["@lsp.typemod.enum.defaultLibrary"]        = { link = "@type.builtin" },
      ["@lsp.typemod.enumMember.defaultLibrary"]  = { link = "@constant.builtin" },
      ["@lsp.typemod.function.defaultLibrary"]    = { link = "@function.builtin" },
      ["@lsp.typemod.keyword.async"]              = { link = "@keyword.coroutine" },
      ["@lsp.typemod.keyword.injected"]           = { link = "@keyword" },
      ["@lsp.typemod.macro.defaultLibrary"]       = { link = "@function.builtin" },
      ["@lsp.typemod.method.defaultLibrary"]      = { link = "@function.builtin" },
      ["@lsp.typemod.operator.injected"]          = { link = "@operator" },
      ["@lsp.typemod.string.injected"]            = { link = "@string" },
      ["@lsp.typemod.struct.defaultLibrary"]      = { link = "@type.builtin" },
      ["@lsp.typemod.type.defaultLibrary"]        = { fg = colors.lighten(scheme.base.cyan, 15) },
      ["@lsp.typemod.typeAlias.defaultLibrary"]   = { fg = colors.lighten(scheme.base.cyan, 15) },
      ["@lsp.typemod.variable.callable"]          = { link = "@function" },
      ["@lsp.typemod.variable.defaultLibrary"]    = { link = "@variable.builtin" },
      ["@lsp.typemod.variable.injected"]          = { link = "@variable" },
      ["@lsp.typemod.variable.static"]            = { link = "@constant" },
    }
  end,

  extra = function(scheme, config)
    return {
      SPNormalFloat = { bg = scheme.editorSuggestWidget.background, fg = scheme.editorSuggestWidget.foreground },
      SPFloatBorder = { bg = scheme.editor.background, fg = scheme.editorSuggestWidget.background },
      SPCursorLine = { bg = scheme.editorLineNumber.foreground, fg = scheme.base.yellow, bold = true },
      SPTitle = { bg = scheme.base.yellow, fg = scheme.base.black, bold = true },
    }
  end,
}
