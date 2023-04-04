--[=[
	Returns the value if found by following a path of keys, otherwise returns `notSetValue` if the given value is nil.

	```lua
	Dictionary.new({
		a = { b = "c" },
		x = { y = "z" },
	}).getIn({ "a", "b" }, "default")
	-- "c"
	```

	@within Dictionary
	@function getIn
	@param keyPath { any }
	@param notSetValue Value
	@return Value?
]=]

return require(script.Parent.Parent.Collection.getIn)
