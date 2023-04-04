--[=[
	Returns true if both collections have value equality.

	```lua
	local list1 = List.new({ "a", "b", "c" })
	local list2 = List.new({ "a", "b", "c" })

	list1.equals(list2)
	-- true
	```

	@within List
	@function equals
	@param other any
	@return List
]=]

return require(script.Parent.Parent.Collection.equals)
