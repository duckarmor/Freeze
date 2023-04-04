--!strict
--[=[
	Returns a list of values. Order is undefined.

	```lua
	Dictionary.values({ a = 1, b = 2, c = 3 })
	-- { 1, 2, 3 }
	```

	@within Dictionary
	@function values
	@return { Value }
]=]

return function<Key, Value>(dictionary: { [Key]: Value })
	local new = {}

	for _, value in dictionary do
		table.insert(new, value)
	end

	return table.freeze(new)
end
