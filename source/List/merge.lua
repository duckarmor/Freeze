--[=[
	Returns a merged result of all given lists.

	If `Freeze.None` is a value assigned to a key, it will delete that key from the resulting list.

	##### Alias
	`join`

	```lua
	List.new({ 10, nil, 30 }).merge({ nil, 20, nil })
	-- List( 10, 20, 30 )

	List.new({ "a", "b", "c" }).merge({ "x" }, { nil, "y", Freeze.None })
	-- List( "x", "y" )
	```

	@within List
	@function merge
	@param lists ...List
	@return List
]=]

local merge = require(script.Parent.Parent.functional.merge)

return function(List, isCollection)
	return function(...)
		local new = merge(...)

		return if isCollection(select(1, ...)) then List(new) else new
	end
end
