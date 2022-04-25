--[=[
	Returns a new list which includes the last `amount` of entires.

	```lua
	List.new({ "a", "b", "c", "d" }).take(2)
	-- List( "c", "d" )
	```

	@within List
	@function takeLast
	@param amount number
	@return List
]=]

local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self, amount: number)
		return slice(List, isCollection)(self, -math.max(1, amount))
	end
end
