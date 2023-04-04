--[=[
	Returns a new list having set `value` at this `keyPath`.
	If any keys in `keyPath` do not exist, a new map will be created at that key.

	```lua
	List.new({ "a", "b", "c", { "d" , "e" } }).setIn({ 4, 1 }, "D")
	-- List( "a", "b", "c" { "D", "e" } )
	```

	@within List
	@function setIn
	@param keyPath { any }
	@param value Value
	@return List
]=]

return require(script.Parent.Parent.Collection.setIn)
