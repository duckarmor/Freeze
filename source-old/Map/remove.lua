--[=[
	Returns a new map which excludes this `key`.

	```lua
	Dictionary.new({ a = 10, b = 20, c = 30 }).remove("c")
	-- Dictionary( a = 10, b = 20 )
	```

	@within Dictionary
	@function remove
	@param key Key
	@return Dictionary
]=]

local set = require(script.Parent.set)

return function(Dictionary, isCollection)
	return function<Key, Value>(self, key: Key)
		return set(Dictionary, isCollection)(self, key, nil)
	end
end
