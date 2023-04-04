--!strict
local get = require(script.Parent.get)

--[=[
	Returns the first value in the list.

	```lua
	List.first({ "a", "b", "c" })
	-- "a"
	```

	@within List
	@function first
	@param notSetValue Value?
	@return Value?
]=]

return function<Value>(list: { Value }, notSetValue: Value?)
	return get(list, 1, notSetValue)
end
