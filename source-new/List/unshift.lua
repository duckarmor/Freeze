--!strict
--[=[
	Returns a new list with the provided `values` prepended, shifting other values ahead to higher indices.

	```lua
	List.unshift({ "b", "c" }, "a")
	-- { "a", "b", "c" }
	```

	@within List
	@function unshift
	@param values ...Value
	@return { Value }
]=]

return function<Value>(list: { Value }, ...: Value)
	local argCount = select("#", ...)

	local new = table.clone(list)

	for i = argCount, 1, -1 do
		local v = select(i, ...)
		table.insert(new, 1, v)
	end

	return table.freeze(new)
end
