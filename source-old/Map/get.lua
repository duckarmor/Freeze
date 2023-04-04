--[=[
	Returns the value at the given key, otherwise returns `notSetValue` if the given value is not found.
	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).get("a", "default")
	-- 1

	Dictionary.new({ a = 1, b = 2, c = 3 }).get("foobar", "default")
	-- "default"
	```

	@within Dictionary
	@function get
	@param key Key
	@param notSetValue Value
	@return Value?
]=]

return function(_Map, isCollection)
	return function(self, key, notSetValue)
		self = if isCollection(self) then self.collection else self

		local value = self[key]
		return if value then value else notSetValue
	end
end
