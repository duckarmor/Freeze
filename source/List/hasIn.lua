--[=[
	Returns true if the value is found by following a path of keys of indices.

	```lua
	List.new({
		{ "a", { "b", "c" } },
		{ "x", { "y", "z" } },
	}).hasIn({ 2, 1 })
	-- true
	```

	@within List
	@function hasIn
	@param keyPath { any }
	@return boolean
]=]

return require(script.Parent.Parent.Collection.hasIn)
