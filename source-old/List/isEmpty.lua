--[=[
	Returns true if the list is empty.

	```lua
	List.new({}).isEmpty()
	-- true
	```

	@within List
	@function isEmpty
	@return boolean
]=]

return require(script.Parent.Parent.Collection.isEmpty)
