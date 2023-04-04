--!strict
--[=[
	Returns a new list in reverse order.

	```lua
	List.reverse({ "a", "b", "c" })
	-- { "c", "b", "a" }
	```

	@within List
	@function reverse
	@return { Value }
]=]

return function<Value>(list: { Value })
	local len = #list
	local new = table.create(len)

	local back = len + 1

	for i, _ in list do
		new[i] = list[back - i]
	end

	return new
end
