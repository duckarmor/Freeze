--[=[
	Returns a new List with values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the index.

	If `mapper` returns nil, the entry will be filtered.

	```lua
	List.new({ 1, 2, 3 }).map(function(value, _key)
		return value * 10
	end)
	-- List( 10, 20, 30 )
	```

	@within List
	@function map
	@param mapper (Value, Key) -> (Value?, Key?)
	@return List
]=]

return require(script.Parent.Parent.Collection.map)
