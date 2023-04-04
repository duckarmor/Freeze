--!strict
local keyOf = require(script.Parent.Parent.utils.keyOf)

--[=[
	Returns the index of the value if found within the List, otherwise returns nil.

	```lua
	List.indexOf({ "a", "b", "c" }, "b")
	-- 2
	```

	@within List
	@function indexOf
	@param value Value
	@return number?
]=]

return function<Value>(list: { Value }, searchValue: Value)
	local key = keyOf(list, searchValue)
	return if key == nil then nil else key
end
