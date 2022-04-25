--[=[
	Returns the value at the given index, otherwise returns `notSetValue` if the given value is not found.

	If `index` is negative, the index will start from the last value.

	```lua
	List.new({ "a", "b", "c", "d", "e", "f", "g" }).get(3, "default")
	-- "c"

	List.new({ "a", "b", "c", "d", "e", "f", "g" }).get(-3, "default")
	-- "e"

	List.new({ "a", "b", "c", "d", "e", "f", "g" }).get(100, "default")
	-- "default"
	```

	@within List
	@function get
	@param index number
	@param notSetValue Value
	@return Value?
]=]

return function(_List, isCollection)
	return function<Key, Value>(self, index: number, notSetValue: Value?): any?
		self = if isCollection(self) then self.collection else self

		if type(index) == "number" and index < 0 then
			index = #self + (index + 1)
		end

		local value = self[index]
		return if value then value else notSetValue
	end
end
