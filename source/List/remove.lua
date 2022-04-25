--[=[
	Returns a new list which excludes this `index`. Values at indices above `index` are shifted down by 1 to fill the position.

	`index` may be a negative number, which indexes back from the end of the list.
	`list.remove(-1)` removes the last item in the list.

	```lua
	List.new({ "a", "b", "c", "d" }).remove(3)
	-- List( "a", "b", "d" )
	```

	@within List
	@function remove
	@param index number
	@return List
]=]

return function(List, isCollection)
	return function(self, index: number)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self

		if index < 1 then
			index += len
		end

		assert(index > 0 and index <= len, string.format("index %d out of bounds of list of length %d", index, len))

		local new = {}
		local newIndex = 1

		for i, v in ipairs(self) do
			if i ~= index then
				new[newIndex] = v
				newIndex += 1
			end
		end

		return if wasCollection then List(new) else new
	end
end
