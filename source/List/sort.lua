--[=[
	Returns a new list which includes the same entries, sorted by using a `comparator`.

	If a `comparator` is not provided, a default comparator uses `<` and `>`.

	```lua
	List.new({ -10, 15, 10, -20 }).sort()
	-- List( -20, -10, 10, 15 )
	```

	@within List
	@function sort
	@param comparator ((Value, Value) -> (boolean))?
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, comparator: ((Value, Value) -> (boolean))?)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = table.clone(self)
		table.sort(new, comparator)

		return if wasCollection then List(new) else new
	end
end
