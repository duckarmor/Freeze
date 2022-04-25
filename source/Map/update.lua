--[=[
	Returns a new map with the entry at `key` updated to the result of `updater`.

	If the entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	Map.new({ a = 10, b = 20, c = 30 }).update("a", function(value)
		return value * 100
	end)
	-- Map( a = 10000, b = 20, c = 30 )

	Map.new({ a = 10, b = 20, c = 30 }).update("d", function(value)
		return value * 100
	end, 1)
	-- Map( a = 10000, b = 20, c = 30, d = 100 )
	```

	@within Map
	@function update
	@param key Key
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return Map
]=]

return require(script.Parent.Parent.Collection.update)
