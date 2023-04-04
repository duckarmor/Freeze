--[=[
	Returns a list of values.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).values()
	-- Map( 1, 2, 3 )
	```

	@within Map
	@function values
	@return Map
]=]

return function(Map, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for _, value in pairs(self) do
			table.insert(new, value)
		end

		return if wasCollection then Map(new) else new
	end
end
