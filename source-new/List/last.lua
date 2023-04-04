--!strict
local get = require(script.Parent.get)

--[=[
	Returns the last value in the list.

	```lua
	List.last({ "a", "b", "c" })
	-- "c"

	List.last({ }, "default")
	-- "default"
	```

	@within List
	@function last
	@param notSetValue Value?
	@return Value?
]=]

return function<Value>(list: { Value }, notSetValue: Value)
	return get(list, -1, notSetValue)
end
