--[=[
	Returns a new map having removed the first entry with the given `value`.

	```lua
	Map.new({ a = 10, b = 20, c = 30 }).removeValue(10)
	-- Map( b = 20, c = 30 )
	```

	@within Map
	@function removeValue
	@param value Value
	@return Map
]=]

return function(Map, isCollection)
	return function<Key, Value>(self, value: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for k, v in pairs(self) do
			if v ~= value then
				new[k] = v
			end
		end

		return if wasCollection then Map(new) else new
	end
end
