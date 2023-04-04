--!strict
local slice = require(script.Parent.slice)
--[=[
	Returns a new list which includes the last `amount` of entires.

	```lua
	List.takeLast({ "a", "b", "c" }, 2)
	-- { "b", "c" }
	```

	@within List
	@function takeLast
]=]

return function<Value>(list: { Value }, amount: number): { Value }
	return slice(list, -math.max(1, amount))
end
