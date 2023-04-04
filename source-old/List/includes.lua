--[=[
	Returns true if the value is found within the List.

	```lua
	List.new({ "a", "b", "c" }).includes("b")
	-- true
	```

	@within List
	@function includes
	@param value any
	@return boolean
]=]

return require(script.Parent.Parent.Collection.includes)
