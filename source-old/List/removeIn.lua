--[=[
	Returns a new list having removed the value at this `keyPath`.

	```lua
	List.new({ "a", "b", "c", { "d", "e" } }).removeIn({ 4, 1 })
	-- List( "a", "b", "c"", { nil, "e" })
	```

	@within List
	@function removeIn
	@param keyPath { any }
	@return List
]=]

return require(script.Parent.Parent.Collection.removeIn)
