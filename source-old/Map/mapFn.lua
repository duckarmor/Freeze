--[=[
	Returns a new Dictionary with keys and values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the key.

	If `mapper` returns nil for value, the entry will be filtered.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).map(function(value, _key)
		return value * 10
	end)
	-- Dictionary( a = 10, b = 20, c = 30 )
	```

	@within Dictionary
	@function map
	@param mapper (Value, Key) -> (Value?, Key?)
	@return Dictionary
]=]

local map = require(script.Parent.Parent.Collection.map)

return function(Dictionary, isCollection)
	return map(Dictionary, isCollection)
end
