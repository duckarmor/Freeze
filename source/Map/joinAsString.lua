--[=[
	Joins values together as a string, inserting a separator between each.

	The default separator is `","`.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).joinAsString(", ")
	-- "a=1, b=2, c=3"
	```

	@within Map
	@function joinAsString
	@return string
]=]

return require(script.Parent.Parent.Collection.joinAsString)
