--!strict
--[=[
	Returns a new list having removed the first entry with the given `value`.

	```lua
	List.removeValue({ "a", "b", "c" }, "a")
	-- { "b", "c" }
	```

	@within List
	@function removeValue
	@param value Value
	@return { Value }
]=]

return function<Value>(list: { Value }, value: Value)
	local new = table.create(#list)

	local didRemove = false
	for _, v in list do
		if v == value then
			didRemove = true
		else
			table.insert(new, v)
		end
	end

	return if didRemove then table.freeze(new) else list
end
