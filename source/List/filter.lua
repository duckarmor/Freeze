--[=[
	Returns a new List of only entries for which the `predicate` function returns true.

	```lua
	List.new({ 1, 2, 3, 4 }).filter(function(value, key)
		return value % 2 == 0
	end)
	-- List( 2, 4 )
	```

	@within List
	@function filter
	@param predicate (Value, Key) -> (boolean)
	@return List
]=]
return function(List, isCollection)
	local function filter<Key, Value>(self, predicate: (Value, Key) -> (boolean))
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = table.create(#self)

		for i, v in ipairs(self) do
			if predicate(v, i) then
				table.insert(new, v)
			end
		end

		return if wasCollection then List(new) else new
	end

	return filter
end
