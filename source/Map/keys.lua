--[=[
	Returns a list of keys.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).keys()
	-- Map( "a", "b", "c" )
	```

	@within Map
	@function keys
	@return Map
]=]

return function(Map, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, _ in pairs(self) do
			table.insert(new, key)
		end

		return if wasCollection then Map(new) else new
	end
end
