local M = {}

--- @param c Colorscheme The color palette
M.setup = function(c, _, _)
  return {
    WinBar = {
      bg = c.editor.background,
      fg = c.breadcrumb.foreground,
    },
    BreadcrumbIconsArray = { fg = c.base.red },
    BreadcrumbIconsBoolean = { fg = c.base.red },
    BreadcrumbIconsClass = { fg = c.base.cyan },
    BreadcrumbIconsColor = { fg = c.base.magenta },
    BreadcrumbIconsConstant = { fg = c.base.magenta },
    BreadcrumbIconsConstructor = { fg = c.base.green },
    BreadcrumbIconsEnum = { fg = c.base.blue },
    BreadcrumbIconsEnumMember = { fg = c.base.blue },
    BreadcrumbIconsEvent = { fg = c.base.blue },
    BreadcrumbIconsField = { fg = c.base.blue },
    BreadcrumbIconsFile = { fg = c.editorLineNumber.activeForeground },
    BreadcrumbIconsFolder = { fg = c.editorLineNumber.activeForeground },
    BreadcrumbIconsFunction = { fg = c.base.green },
    BreadcrumbIconsInterface = { fg = c.base.cyan },
    BreadcrumbIconsKey = { fg = c.base.blue },
    BreadcrumbIconsKeyword = { fg = c.base.red },
    BreadcrumbIconsMethod = { fg = c.base.green },
    BreadcrumbIconsModule = { fg = c.base.cyan },
    BreadcrumbIconsNamespace = { fg = c.base.cyan },
    BreadcrumbIconsNull = { fg = c.base.magenta },
    BreadcrumbIconsNumber = { fg = c.base.magenta },
    BreadcrumbIconsObject = { fg = c.base.cyan },
    BreadcrumbIconsOperator = { fg = c.base.red },
    BreadcrumbIconsPackage = { fg = c.base.magenta },
    BreadcrumbIconsProperty = { fg = c.base.blue },
    BreadcrumbIconsReference = { fg = c.base.magenta },
    BreadcrumbIconsSnippet = { fg = c.base.green },
    BreadcrumbIconsString = { fg = c.base.yellow },
    BreadcrumbIconsStruct = { fg = c.base.red },
    BreadcrumbIconsText = { fg = c.base.yellow },
    BreadcrumbIconsTypeParameter = { fg = c.base.blue },
    BreadcrumbIconsUnit = { fg = c.base.magenta },
    BreadcrumbIconsVariable = { fg = c.base.cyan },
  }
end

return M
