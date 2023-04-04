--!strict
local slice = require(script.Parent.slice)

--[=[
	Returns a new list which includes the first `amount` of entires.

	```lua
	List.take({ "a", "b", "c", "d" }, 2)
	-- { "a", "b" }
	```

	@within List
	@function take
	@param amount number
	@return { Value }
]=]

return function<Value>(list: { Value }, amount: number)
	return slice(list, 1, math.max(1, amount))
end
