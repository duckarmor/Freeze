--!strict
local count = require(script.Parent.Parent.utils.count)

--[=[
	Returns the number of entries that match the predicate.
	If the predicate is not given, all entries will be considered a match.

	```lua
	Dictionary.count({ a = 1, b = 2, c = 3 }).count()
	-- 3

	Dictionary.count({ a = 1, b = 2, c = 3 }, function(value, key)
		return value % 2 == 0
	end)
	-- 1
	```

	@within Dictionary
	@function count
	@param predicate ((Value, Key) -> (boolean))?
	@return number
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, predicate: ((Value, Key) -> boolean)?)
	return count(dictionary, predicate)
end
