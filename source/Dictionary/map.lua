--!strict
local mapImpl = require(script.Parent.Parent.utils.map)
local maybeFreeze = require(script.Parent.Parent.utils.maybeFreeze)
--[=[
	Returns a new Dictionary with keys and values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the key.

	If `mapper` returns nil for value, the entry will be filtered.

	```lua
	Dictionary.map({ a = 1, b = 2, c = 3 }, function(value, _key)
		return value * 10
	end)
	-- { a = 10, b = 20, c = 30 }
	```

	@within Dictionary
]=]

local function map<Key, Value, NewValue>(dictionary: { [Key]: Value }, mapper: (Value, Key) -> (NewValue?, Key?)): { [Key]: NewValue? }
	return maybeFreeze(mapImpl(dictionary, mapper))
end

return map
