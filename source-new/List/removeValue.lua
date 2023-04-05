--!strict
--[=[
	Returns a List having removed the first entry with the given `value`.

	If no values are present, it will return the original List with no changes.

	```lua
	List.removeValue({ "a", "b", "c" }, "a")
	-- { "b", "c" }
	```

	@within List
]=]

local function removeValue<Value>(list: { Value }, value: Value): { Value }
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

return removeValue
