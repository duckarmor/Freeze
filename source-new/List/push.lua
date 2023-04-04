--!strict
--[=[
	Returns a new list with the provided `values` appended at the end of the list.

	##### Alias
	`append`

	```lua
	List.push({ 10, 20, 30 }, 40, 50, 60)
	-- { 10, 20, 30, 40, 50, 60 }
	```

	@within List
	@function push
	@param values ...Value
	@return { Value }
]=]

return function<Value>(list: { Value }, ...: Value)
	if #{ ... } == 0 then
		return list
	end

	local newCollection = table.clone(list)
	for _, value in { ... } do
		table.insert(newCollection, value)
	end

	return newCollection
end
