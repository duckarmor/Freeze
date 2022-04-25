--[=[
	Converts this list to a Map.

	```lua
	List.new({ "a", "b", "c", "d" }).toMap()
	-- Map( 1 = "a", 2 = "b", 3 = "c", 4 = "d" )
	```

	@within List
	@function toMap
	@return Map
]=]

return function(_List, isCollection)
	return function(self)
		local Map = require(script.Parent.Parent.Map)
		self = if isCollection(self) then self.collection else self

		return Map.new(self)
	end
end
