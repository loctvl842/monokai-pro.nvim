local Palette = {}
Palette.__index = Palette

--- Constructor for creating a new Palette object
--- @param name string The name of the palette
--- @param colors table The colors in the palette
--- @return # A new Palette object
function Palette.new(name, colors)
	local self = setmetatable({}, Palette)
	self.name = name
	self.colors = colors
	return self
end

--- Returns the name of the palette
--- @return string name The name of the palette
function Palette:getName()
	return self.name
end

--- Returns the colors in the palette
--- @return table colors The colors in the palette
function Palette:getColors()
	return self.colors
end

return Palette
