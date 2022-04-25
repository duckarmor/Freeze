--[=[
	Returns a new map having removed the value at this `keyPath`.

	```lua
	Map.new({ a = { b = { c = "d" } } }).removeIn({ "a", "b" })
	-- Map( a = {} )
	```

	@within Map
	@function removeIn
	@param keyPath { any }
	@return Map
]=]

return require(script.Parent.Parent.Collection.removeIn)
