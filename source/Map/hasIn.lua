--[=[
	Returns true if the value is found by following a path of keys.

	```lua
	Map.new({
		a = { b = "c" },
		x = { y = "z" },
	}).hasIn({ "a", "b" })
	-- true
	```

	@within Map
	@function hasIn
	@param keyPath { any }
	@return boolean
]=]

return require(script.Parent.Parent.Collection.hasIn)
