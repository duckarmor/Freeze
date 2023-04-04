--!strict
--[=[
	Inserts values given starting from the given index, pushing existing values towards the end.
	The inserted value will be clamped to the beginning or end of the list if the given index is out of bounds.

	```lua
	List.insert({ "a", "b", "c" }, 2, "X", "Y", "Z")
	-- { "a", "X", "Y", "Z", "b", "c" }
	```

	@within List
	@function insert
	@param index number
	@param values ...Value
	@return { Value }
]=]

return function<Value>(list: { Value }, index: number, ...: Value)
	local len = #list

	if index < 1 then
		index = len + index
	end

	index = math.clamp(index, 1, len + 1)

	local new = {}
	local resultIndex = 1

	for i = 1, len + 1 do
		if i == index then
			for j = 1, select("#", ...) do
				new[resultIndex] = select(j, ...)
				resultIndex = resultIndex + 1
			end
		end

		new[resultIndex] = list[i]
		resultIndex = resultIndex + 1
	end

	return table.freeze(new)
end
