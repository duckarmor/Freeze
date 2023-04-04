--[=[
	Returns a list of keys.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).keys()
	-- Dictionary( "a", "b", "c" )
	```

	@within Dictionary
	@function keys
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, _ in pairs(self) do
			table.insert(new, key)
		end

		return if wasCollection then Dictionary(new) else new
	end
end
