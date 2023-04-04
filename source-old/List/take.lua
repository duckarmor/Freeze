--[=[
	Returns a new list which includes the first `amount` of entires.

	```lua
	List.new({ "a", "b", "c", "d" }).take(2)
	-- List( "a", "b" )
	```

	@within List
	@function take
	@param amount number
	@return List
]=]

local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self, amount: number)
		return slice(List, isCollection)(self, 1, math.max(1, amount))
	end
end
