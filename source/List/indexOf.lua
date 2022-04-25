--[=[
	Returns the index of the value if found within the List, otherwise returns nil.

	```lua
	List.new({ "a", "b", "c" }).indexOf("b")
	-- 2
	```

	@within List
	@function indexOf
	@param value any
	@return Key?
]=]

local keyOf = require(script.Parent.Parent.Collection.keyOf)

return function(List, isCollection)
	return function(self, searchValue)
		local key = keyOf(List, isCollection)(self, searchValue)
		return if key == nil then nil else key
	end
end
