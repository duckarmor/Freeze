--[=[
	Returns the value if found by following a path of indices, otherwise returns `notSetValue` if the given value is nil.

	```lua
	List.new({
		{ "a", { "b", "c" } },
		{ "x", { "y", "z" } },
	}).getIn({ 2, 1 }, "default")
	-- "y"
	```

	@within List
	@function getIn
	@param keyPath { any }
	@param notSetValue Value
	@return Value?
]=]

return require(script.Parent.Parent.Collection.getIn)
