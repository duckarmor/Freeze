--[=[
	Returns true if the value is found within the Dictionary.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).includes(2)
	-- true
	```

	@within Dictionary
	@function includes
	@param value any
	@return boolean
]=]

return require(script.Parent.Parent.Collection.includes)
