--!strict
local findPair = require(script.Parent.Parent.utils.findPair)

--[=[
	Returns the first [index, value] pair for which the `predicate` returns true.

	```lua
	List.findPair({ "a", "B", "c" }, function(value, index)
		return value == string.upper(v)
	end)
	-- ( 2, "B" )
	```

	@within List
	@function findEntry
	@param predicate (Value, index) -> (boolean)
	@return (number, Value)?
]=]

return function<Value>(list: { Value }, predicate)
	return findPair(list, predicate)
end
