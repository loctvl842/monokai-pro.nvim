-- Barbecue theme for Monokai Pro
-- This file is auto-discovered by barbecue

local monokai = require("monokai-pro")
local scheme = monokai.get_scheme()

return {
  normal = { fg = scheme.breadcrumb.foreground, bg = scheme.editor.background },
  ellipsis = { fg = scheme.base.dimmed3 },
  separator = { fg = scheme.base.dimmed3 },
  modified = { fg = scheme.base.yellow },
  dirname = { fg = scheme.base.dimmed2 },
  basename = { fg = scheme.base.white, bold = true },
  context = { fg = scheme.base.dimmed1 },

  -- Context kinds (from breadcrumb colors)
  context_file = { fg = scheme.base.yellow },
  context_module = { fg = scheme.base.cyan },
  context_namespace = { fg = scheme.base.cyan },
  context_package = { fg = scheme.base.magenta },
  context_class = { fg = scheme.base.cyan },
  context_method = { fg = scheme.base.green },
  context_property = { fg = scheme.base.blue },
  context_field = { fg = scheme.base.blue },
  context_constructor = { fg = scheme.base.green },
  context_enum = { fg = scheme.base.blue },
  context_interface = { fg = scheme.base.cyan },
  context_function = { fg = scheme.base.green },
  context_variable = { fg = scheme.base.cyan },
  context_constant = { fg = scheme.base.magenta },
  context_string = { fg = scheme.base.yellow },
  context_number = { fg = scheme.base.magenta },
  context_boolean = { fg = scheme.base.magenta },
  context_array = { fg = scheme.base.red },
  context_object = { fg = scheme.base.cyan },
  context_key = { fg = scheme.base.blue },
  context_null = { fg = scheme.base.magenta },
  context_enum_member = { fg = scheme.base.blue },
  context_struct = { fg = scheme.base.red },
  context_event = { fg = scheme.base.blue },
  context_operator = { fg = scheme.base.red },
  context_type_parameter = { fg = scheme.base.blue },
}
