--!strict
--[=[
	Joins values together as a string, inserting a separator between each.

	The default separator is `","`.

	```lua
	List.joinAsString({ "a", "b", "c" }, ", ")
	-- "a, b, c"
	```

	@within List
	@function joinAsString
	@param separator string?
	@return string
]=]

return function<Value>(list: { Value }, separator: string?): string
	return table.concat(list, separator or ",")
end
