--[=[
	Returns the number of entries that match the predicate.
	If the predicate is not given, all entries will be considered a match.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).count()
	-- 3

	Dictionary.new({ a = 1, b = 2, c = 3 }).count(function(value, _key)
		return value % 2 == 0
	end)
	-- 1
	```

	@within Dictionary
	@function count
	@param predicate ((Value, Key) -> (boolean))?
	@return number
]=]
return function(_List, isCollection)
	return function<Key, Value>(self, predicate: ((Value, Key) -> boolean)?): number
		self = if isCollection(self) then self.collection else self

		local count = 0

		for index, value in pairs(self) do
			if predicate == nil or predicate(value, index) then
				count += 1
			end
		end

		return count
	end
end
