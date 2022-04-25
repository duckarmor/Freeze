--[=[
	Returns a new map which excludes this `key`.

	```lua
	Map.new({ a = 10, b = 20, c = 30 }).remove("c")
	-- Map( a = 10, b = 20 )
	```

	@within Map
	@function remove
	@param key Key
	@return Map
]=]

local set = require(script.Parent.set)

return function(Map, isCollection)
	return function<Key, Value>(self, key: Key)
		return set(Map, isCollection)(self, key, nil)
	end
end
