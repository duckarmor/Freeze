--!strict
--[=[
	Returns true if the index exists within the List.

	```lua
	List.has({ "a", "b", "c" }, 2)
	-- true
	```

	@within List
	@function has
	@param index number
	@return boolean
]=]

return function<Value>(list: { Value }, index: number): boolean
	return list[index] ~= nil
end
