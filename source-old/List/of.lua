--[=[
	Constructs a new List object with the given values.

	```lua
	local myList = List.of( 1, 2, 3 )
	```

	@within List
	@function of
	@param values ...any
	@return List
]=]
return function(List, _isCollection)
	return function(...)
		return List.new({ ... })
	end
end
