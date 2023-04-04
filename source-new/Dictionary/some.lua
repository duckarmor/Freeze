--!strict
local some = require(script.Parent.Parent.utils.some)
--[=[
	Returns true if `predicate` returns true for any entry in the dictionary.

	```lua
	Dictionary.some({ a = 1, b = 2, c = 3 }), function(value, key)
		return value % 2 == 0
	end)
	-- true
	```

	@within Dictionary
	@function some
	@param predicate (Value, Key) -> (boolean)
	@return boolean
]=]

return function(dictionary, predicate)
	return some(dictionary, predicate)
end
