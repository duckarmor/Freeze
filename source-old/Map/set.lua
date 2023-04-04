--[=[
	Returns a new map which includes `value` at `key`.
	If `key` already exists, it will be replaced.

	```lua
	Map.new({ a = 10, b = 20, c = 30 }).set("a", 100)
	-- Map( a = 100, b = 20, c = 30 )
	```

	@within Map
	@function set
	@param key Key
	@param value Value
	@return Map
]=]

return function(Map, isCollection)
	return function<Key, Value>(self, key: Key, value: Value)
		if key == nil then
			return self
		end

		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		newCollection[key] = value

		return if wasCollection then Map(newCollection) else newCollection
	end
end
