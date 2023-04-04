--!strict
local findPair = require(script.Parent.Parent.utils.findPair)

--[=[
	Returns the first value for which the `predicate` returns true.

	```lua
	List.find({ "a", "B", "c" }, function(value, key)
		return value == string.upper(v)
	end)
	-- "B"
	```

	@within List
	@function find
	@param predicate (Value, Key) -> (boolean)
	@return Value?
]=]

return function<Value>(list: { Value }, predicate, notSetValue)
	local _, value = findPair(list, predicate)
	return if value == nil then notSetValue else value
end
