--[=[
	Returns an empty Dictionary.

	```lua
	Dictionary.emptyMap()
	-- Dictionary( )
	```

	@within Dictionary
	@function emptyMap
	@return Dictionary
]=]

return function(Dictionary, _isCollection)
	return function()
		return Dictionary.new({})
	end
end
