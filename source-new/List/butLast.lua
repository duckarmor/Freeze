--!strict
local slice = require(script.Parent.slice)

--[=[
	Returns a new List containing all entires except the last.
	Equivalent to `slice(1, -1)`.

	```lua
	List.butLast({ 1, 2, 3 })
	-- { 1, 2 }
	```

	@within List
	@function butLast
	@return { Value }
]=]

return function<Value>(list: { Value })
	return slice(list, 1, -1)
end
