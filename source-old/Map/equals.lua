--[=[
	Returns true if both collections have value equality.

	```lua
	local map1 = List.new({ a = 1, b = 2, c = 3 })
	local map1 = List.new({ a = 1, b = 2, c = 3 })

	map1.equals(map1)
	-- true
	```

	@within Dictionary
	@function equals
	@param other any
	@return Dictionary
]=]

return require(script.Parent.Parent.Collection.equals)
