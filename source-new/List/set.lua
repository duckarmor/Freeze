--!strict
--[=[
	Returns a new list which includes `value` at `index`.
	If `index` already exists, it will be replaced.

	```lua
    List.set({"a", "b", "c"}, 1, "A")
	-- { "A", "b", "c" }
	```

	@within List
    @param list { Value }
	@param index number
	@param value Value
	@return { Value }
]=]

return function<Value>(list: { Value }, index: number, value: Value)
	if list[index] == value then
		return list
	end

	local newList = table.clone(list)
	newList[index] = value
	return table.freeze(newList)
end
