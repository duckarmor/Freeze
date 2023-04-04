--!strict
--[=[
	Returns a dictionary of only entries for which the `predicate` function returns true.

	```lua
	Dictionary.filter({ a = 1, b = 2, c = 3, d = 4 }, function(value, key)
		return value % 2 == 0
	end)
	-- { b = 2, d = 4 }
	```

	@within Dictionary
	@function filter
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, predicate: ((Value, Key) -> boolean)): { [Key]: Value }
	local new = {}

	for k, v in dictionary do
		if predicate(v, k) == true then
			new[k] = v
		end
	end

	return table.freeze(new)
end
