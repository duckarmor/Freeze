--[=[
	Returns a new list with the provided `values` prepended, shifting other values ahead to higher indices.

	```lua
	List.new({ 2, 3, 4 }).unshift(1)
	-- List( 1, 2, 3, 4 )
	```

	@within List
	@function unshift
	@param values ...Value
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, ...: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local argCount = select("#", ...)

		local new = table.clone(self)

		for i = argCount, 1, -1 do
			local v = select(i, ...)
			table.insert(new, 1, v)
		end

		return if wasCollection then List(new) else new
	end
end
