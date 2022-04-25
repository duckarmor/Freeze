--[=[
	Joins values together as a string, inserting a separator between each.

	The default separator is `","`.

	```lua
	List.new({ "a", "b", "c" }).joinAsString(", ")
	-- "a, b, c"
	```

	@within List
	@function joinAsString
	@return string
]=]

return require(script.Parent.Parent.Collection.joinAsString)
