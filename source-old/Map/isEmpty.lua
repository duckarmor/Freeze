--[=[
	Returns true if the map is empty.

	```lua
	Dictionary.new({}).isEmpty()
	-- true
	```

	@within Dictionary
	@function isEmpty
	@return boolean
]=]

return require(script.Parent.Parent.Collection.isEmpty)
