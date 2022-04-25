--[=[
	Returns a new list with the entry at `keyPath` updated to the result of `updater`.

	If any entry does not exist along `keyPath`, an empty map will be created in its place.
	If the final entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	List.new({ "a", "b", "c", { "d", "e" } }).updateIn({ 4, 1 }, function(value)
		return string.rep(value, 5)
	end)
	-- List( "a", "b", "c" { "ddddd", "e" } )

	List.new({ "a", "b", "c", { "d", "e" } }).updateIn({ 4, 3, 1 }, function(value)
		return string.rep(value, 5)
	end, "g")
	-- List( "a", "b", "c", { "d", "e", { "ggggg" } } )
	```

	@within List
	@function updateIn
	@param keyPath { any }
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return List
]=]

return require(script.Parent.Parent.Collection.updateIn)
