---@type MonokaiPro.GroupSpec
return {
  name = "syntax",

  highlights = function(scheme, config)
    local styles = config.styles or {}

    return {
      -- Comments
      Comment = { fg = scheme.base.dimmed3, italic = styles.comment and styles.comment.italic },

      -- Constants
      Constant = { fg = scheme.base.magenta },
      String = { fg = scheme.base.yellow },
      Character = { fg = scheme.base.magenta },
      Number = { fg = scheme.base.magenta },
      Boolean = { fg = scheme.base.magenta },
      Float = { fg = scheme.base.magenta },

      -- Identifiers
      Identifier = { fg = scheme.base.white },
      Function = { fg = scheme.base.green },

      -- Statements
      Statement = { fg = scheme.base.magenta },
      Conditional = { fg = scheme.base.red },
      Repeat = { fg = scheme.base.red },
      Label = { fg = scheme.base.red },
      Operator = { fg = scheme.base.red },
      Keyword = { fg = scheme.base.red, italic = styles.keyword and styles.keyword.italic },
      Exception = { fg = scheme.base.red },

      -- Preprocessor
      PreProc = { fg = scheme.base.yellow },
      Include = { fg = scheme.base.red },
      Define = { fg = scheme.base.red },
      Macro = { fg = scheme.base.red },
      PreCondit = { fg = scheme.base.red },

      -- Types
      Type = { fg = scheme.base.white },
      StorageClass = { fg = scheme.base.red, italic = styles.storageclass and styles.storageclass.italic },
      Structure = { fg = scheme.base.cyan, italic = styles.structure and styles.structure.italic },
      Typedef = { fg = scheme.base.red },

      -- Special
      Special = { fg = scheme.base.blue },
      SpecialChar = { fg = scheme.base.blue },
      Delimiter = { fg = scheme.base.white },
      SpecialComment = { fg = scheme.base.dimmed3 },

      -- Text styles
      Underlined = { underline = true },
      Bold = { bold = true },
      Italic = { italic = true },

      -- Errors and todos
      Error = { fg = scheme.inputValidation.errorForeground },
      Todo = { bg = scheme.editor.background, fg = scheme.base.magenta, bold = true },

      -- Language specific
      javaAnnotation = { fg = scheme.base.dimmed2 },
    }
  end,
}
