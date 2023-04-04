--[=[
	Returns a new list which excludes the first `amount` of entries.

	```lua
	List.new({ "a", "b", "c", "d", "e", "f", "g" }).skip(3)
	-- List( "d", "e", "f", "g" )
	```

	@within List
	@function skip
	@param amount number
	@return List
]=]

local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self, amount: number)
		return slice(List, isCollection)(self, math.max(1, amount + 1))
	end
end
