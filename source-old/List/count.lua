--[=[
	Returns the number of entries that match the predicate.
	If the predicate is not given, all entries will be considered a match.

	```lua
	List.new({ "a", "b", "c" }).count()
	-- 3
	```

	@within List
	@function count
	@param predicate ((Value, Key) -> (boolean))?
	@return number
]=]
return function(_List, isCollection)
	local function count<Key, Value>(self, predicate: ((Value, Key) -> (boolean))?)
		self = if isCollection(self) then self.collection else self

		local sum = 0

		for index, value in ipairs(self) do
			if predicate == nil or predicate(value, index) then
				sum += 1
			end
		end

		return sum
	end

	return count
end
