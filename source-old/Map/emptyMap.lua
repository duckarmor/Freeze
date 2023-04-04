--[=[
	Returns an empty Map.

	```lua
	Map.emptyMap()
	-- Map( )
	```

	@within Map
	@function emptyMap
	@return Map
]=]

return function(Map, _isCollection)
	return function()
		return Map.new({})
	end
end
