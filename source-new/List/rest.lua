--!strict

local slice = require(script.Parent.slice)

--[=[
	Returns a new list containing all entries except the first.

	```lua
	List.rest({ "a", "b", "c" })
	-- { "b", "c" }
	```

	@within List
	@function rest
]=]

return function<Value>(list: { Value }): { Value }
	return slice(list, 2)
end
