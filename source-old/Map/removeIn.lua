--[=[
	Returns a new map having removed the value at this `keyPath`.

	```lua
	Dictionary.new({ a = { b = { c = "d" } } }).removeIn({ "a", "b" })
	-- Dictionary( a = {} )
	```

	@within Dictionary
	@function removeIn
	@param keyPath { any }
	@return Dictionary
]=]

return require(script.Parent.Parent.Collection.removeIn)
