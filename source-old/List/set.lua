--[=[
	Returns a new list which includes `value` at `index`.
	If `index` already exists, it will be replaced.

	```lua
	List.new({ "a", "b", "c", "d" }).set(1, "A")
	-- List( "A", "b", "c", "d" )
	```

	@within List
	@function set
	@param index number
	@param value Value
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, index: number, value: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		newCollection[index] = value
		return if wasCollection then List.new(newCollection) else newCollection
	end
end
