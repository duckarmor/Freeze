--[=[
	Returns a new map where keys and values are flipped.

	```lua
	Map.new({ a = "x", b = "y", c = "z" ).flip()
	-- Map( x = "a", y = "b", z = "c" )
	```

	@within Map
	@function flip
	@return Map
]=]

return function(Map, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, value in pairs(self) do
			new[value] = key
		end

		return if wasCollection then Map(new) else new
	end
end
