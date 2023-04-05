--!strict
--[=[
	Returns a List which includes the same entries, sorted by using a `comparator`.

	If a `comparator` is not provided, a default comparator uses `<` and `>`.

	```lua
	List.sort({ 4, 2, 1, 3 })
	-- { 1, 2, 3, 4 }
	```

	@within List
]=]

local function sort<Value>(list: { Value }, comparator: ((Value, Value) -> boolean)?)
	local new = table.clone(list)
	table.sort(new, comparator)

	return table.freeze(new)
end

return sort
