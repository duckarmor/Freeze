--[=[
	Converts this list to a Dictionary.

	```lua
	List.new({ "a", "b", "c", "d" }).toMap()
	-- Dictionary( 1 = "a", 2 = "b", 3 = "c", 4 = "d" )
	```

	@within List
	@function toMap
	@return Dictionary
]=]

return function(_List, isCollection)
	return function(self)
		local Dictionary = require(script.Parent.Parent.Dictionary)
		self = if isCollection(self) then self.collection else self

		return Dictionary.new(self)
	end
end
