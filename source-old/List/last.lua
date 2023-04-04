--[=[
	Returns the last value in the list.

	```lua
	List.new({ "a", "b", "c" }).last()
	-- "c"
	```

	@within List
	@function last
	@param notSetValue Value?
	@return Value?
]=]

local get = require(script.Parent.get)

return function(List, isCollection)
	return function<Key, Value>(self, notSetValue: Value): Value?
		return get(List, isCollection)(self, -1, notSetValue)
	end
end
