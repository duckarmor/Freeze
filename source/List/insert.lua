--[=[
	Inserts values given starting from the given index, pushing existing values towards the end.

	```lua
	List.new({ "a", "b", "c" }).insert(2, "x", "y", "z")
	-- List( "a", "x", "y", "z", "b", "c" )
	```

	@within List
	@function insert
	@param index number
	@param values ...Value
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, index: number, ...: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self

		if index < 1 then
			index = len + index
		end

		index = math.clamp(index, 1, len + 1)

		local new = {}
		local resultIndex = 1

		for i = 1, len + 1 do
			if i == index then
				for j = 1, select("#", ...) do
					new[resultIndex] = select(j, ...)
					resultIndex = resultIndex + 1
				end
			end

			new[resultIndex] = self[i]
			resultIndex = resultIndex + 1
		end

		return if wasCollection then List(new) else new
	end
end
