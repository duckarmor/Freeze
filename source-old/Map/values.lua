--[=[
	Returns a list of values.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).values()
	-- Dictionary( 1, 2, 3 )
	```

	@within Dictionary
	@function values
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for _, value in pairs(self) do
			table.insert(new, value)
		end

		return if wasCollection then Dictionary(new) else new
	end
end
