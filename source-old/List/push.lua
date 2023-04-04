--[=[
	Returns a new list with the provided `values` appended at the end of the list.

	##### Alias
	`append`

	```lua
	List.new({ 10, 20, 30 }).push(40, 50, 60)
	-- List( 10, 20, 30, 40, 50, 60 )
	```

	@within List
	@function push
	@param values ...Value
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, ...: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		for _, value in ipairs({ ... }) do
			table.insert(newCollection, value)
		end

		return if wasCollection then List(newCollection) else newCollection
	end
end
