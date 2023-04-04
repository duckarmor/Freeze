--!strict
--[=[
	Returns a new list which includes `value` at `index`.
	If `index` already exists, it will be replaced.

	```lua
	List.set({"a", "b", "c"}, 1, "A")
	-- { "A", "b", "c" }
	```

	@within List
	@function set
]=]

return function<Value>(list: { Value }, index: number, value: Value): { Value }
	if list[index] == value then
		return list
	end

	local newList = table.clone(list)
	newList[index] = value
	return table.freeze(newList)
end
