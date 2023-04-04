--!strict
local findPair = require(script.Parent.Parent.utils.findPair)
--[=[
	Returns the first value for which the `predicate` returns true.

	```lua
	Dictionary.find({ a = 1, b = 2, c = 3 }, function(value, key)
		return value % 2 == 0
	end)
	-- 2
	```

	@within Dictionary
	@function find
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, predicate: (Value, Key) -> boolean, notSetValue: Value?): Value?
	local _, value = findPair(dictionary, predicate)
	return if value == nil then notSetValue else value
end
