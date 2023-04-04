--!strict
local slice = require(script.Parent.slice)

--[=[
	Returns a new list which excludes the first `amount` of entries.

	```lua
	List.skip({ "a", "b", "c", "d" }, 2)
	-- { "c", "d" }
	```

	@within List
	@function skip
	@param amount number
	@return { Value }
]=]

return function<Value>(list: { Value }, amount: number)
	return slice(list, math.max(1, amount + 1))
end
