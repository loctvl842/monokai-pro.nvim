local Git = {
	SignAdd = { fg = C.gitDecoration.addedResourceForeground },
	SignChange = { fg = C.gitDecoration.modifiedResourceForeground },
	SignDelete = { fg = C.gitDecoration.deletedResourceForeground },
	GitSignsAdd = { link = "SignAdd" },
	GitSignsChange = { link = "SignChange" },
	GitSignsDelete = { link = "SignDelete" },
}

return Git
