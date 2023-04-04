--[=[
	Returns true if the value is found within the Map.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).includes(2)
	-- true
	```

	@within Map
	@function includes
	@param value any
	@return boolean
]=]

return require(script.Parent.Parent.Collection.includes)
