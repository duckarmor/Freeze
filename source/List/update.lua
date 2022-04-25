--[=[
	Returns a new list with the entry at `index` updated to the result of `updater`.

	If the entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	List.new({ "a", "b", "c" }).update(2, function(value)
		return string.rep(value, 5)
	end)
	-- List( "a", "bbbbb", "c" )

	List.new({ "a", "b", "c" }).update(4, function(value)
		return string.rep(value, 5)
	end, "d")
	-- List( "a", "b", "c", "ddddd" )
	```

	@within List
	@function update
	@param index number
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return List
]=]

return require(script.Parent.Parent.Collection.update)
