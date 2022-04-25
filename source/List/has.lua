--[=[
	Returns true if the index exists within the List.

	```lua
	List.new({ "a", "b", "c" }).has(2)
	-- true
	```

	@within List
	@function has
	@param index number
	@return boolean
]=]

return function(_List, isCollection)
	return function(self, index: number): boolean
		self = if isCollection(self) then self.collection else self

		return self[index] ~= nil
	end
end
