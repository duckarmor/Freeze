--!strict
--[=[
	Returns a list of keys. Order is undefined.

	```lua
	Dictionary.keys({ a = 1, b = 2, c = 3 })
	-- { "a", "b", "c" }
	```

	@within Dictionary
	@function keys
	@return { Key }
]=]

return function<Key, Value>(dictionary: { [Key]: Value })
	local new = {}

	for key, _ in dictionary do
		table.insert(new, key)
	end

	return new
end
