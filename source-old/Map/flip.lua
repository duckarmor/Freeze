--[=[
	Returns a new map where keys and values are flipped.

	```lua
	Dictionary.new({ a = "x", b = "y", c = "z" ).flip()
	-- Dictionary( x = "a", y = "b", z = "c" )
	```

	@within Dictionary
	@function flip
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, value in pairs(self) do
			new[value] = key
		end

		return if wasCollection then Dictionary(new) else new
	end
end
