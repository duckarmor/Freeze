--[=[
	Returns true if the map is empty.

	```lua
	Map.new({}).isEmpty()
	-- true
	```

	@within Map
	@function isEmpty
	@return boolean
]=]

return require(script.Parent.Parent.Collection.isEmpty)
