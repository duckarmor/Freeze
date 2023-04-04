--!strict
--[=[
	Returns a new list excluding the last index of this list.


	```lua
	List.pop({ 10, 20, 30 })
	-- { 10, 20 }

    List.pop({ 10, 20, 30 }, 2)
	-- { 10 }
	```

	@within List
	@function pop
	@param amount number?
	@return { Value }
]=]

return function<Value>(list: { Value }, amount: number?)
	local useAmount = math.max(1, amount or 1)

	local len = #list

	local new = table.create(len)

	for i = 1, len - useAmount do
		new[i] = list[i]
	end

	return table.freeze(new)
end
