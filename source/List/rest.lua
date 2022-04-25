--[=[
	Returns a new list containing all entries except the first.

	```lua
	List.new({ "a", "b", "c", "d" }).rest()
	-- List( "b", "c", "d" )
	```

	@within List
	@function reset
	@return List
]=]

local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self)
		return slice(List, isCollection)(self, 2)
	end
end
