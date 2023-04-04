--[=[
	Returns a new Map with keys and values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the key.

	If `mapper` returns nil for value, the entry will be filtered.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).map(function(value, _key)
		return value * 10
	end)
	-- Map( a = 10, b = 20, c = 30 )
	```

	@within Map
	@function map
	@param mapper (Value, Key) -> (Value?, Key?)
	@return Map
]=]

local map = require(script.Parent.Parent.Collection.map)

return function(Map, isCollection)
	return map(Map, isCollection)
end
