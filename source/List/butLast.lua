--[=[
	Returns a new List containing all entires except the last.
	Equivalent to `slice(1, -1)`.

	```lua
	List.of( 1, 2, 3 ).butLast()
	-- List( 1, 2 )
	```

	@within List
	@function butLast
	@return List
]=]

local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self)
		return slice(List, isCollection)(self, 1, -1)
	end
end
