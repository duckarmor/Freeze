--!strict
--[=[
	Returns a new List of only entries for which the `predicate` function returns true.

	```lua
	List.filter({ 1, 2, 3, 4 }, function(value, key)
		return value % 2 == 0
	end)
	-- { 2, 4 }
	```

	@within List
	@function filter
	@param predicate (Value, number) -> (boolean)
	@return { Value }
]=]

local function filter<Value>(list: { Value }, predicate: (Value, number) -> boolean)
	local new = table.create(#list)

	for i, v in list do
		if predicate(v, i) then
			table.insert(new, v)
		end
	end

	return new
end

return filter
