--!strict
--[=[
	Returns a new map having removed the all pairs with the given `value`.

	```lua
	Dictionary.removeValue({ a = 10, b = 20, c = 30 }, 10)
	-- { b = 20, c = 30 }
	```

	@within Dictionary
	@function removeValue
	@param value Value
	@return { [Key]: Value }
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, value: Value)
	local new = {}

	local mutated = false
	for k, v in dictionary do
		if v == value then
			mutated = true
		else
			new[k] = v
		end
	end

	return if mutated then table.freeze(new) else dictionary
end
