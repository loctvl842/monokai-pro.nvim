local Git = {
	SignAdd = { fg = C.gitDecorationAddedResourceForeground },
	SignChange = { fg = C.gitDecorationModifiedResourceForeground },
	SignDelete = { fg = C.gitDecorationDeletedResourceForeground },
	GitSignsAdd = { link = "SignAdd" },
	GitSignsChange = { link = "SignChange" },
	GitSignsDelete = { link = "SignDelete" },
}

return Git
