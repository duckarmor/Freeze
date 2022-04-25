--[=[
	Returns a merged result of all given maps.

	If `Freeze.None` is a value assigned to a key, it will delete that key from the resulting map.

	##### Alias
	`join`

	```lua
	Map.new({ a = 10, b = 20 }).merge({ c = 30 })
	-- Map( a = 10, b = 20, c = 30 )

	Map.new({ a = 10, b = 20 }).merge({ c = 30, d = 40 }, { b = Freeze.None })
	-- Map( a = 10, c = 30, d = 40 )
	```

	@within Map
	@function merge
	@param maps ...Map
	@return Map
]=]

local merge = require(script.Parent.Parent.functional.merge)

return function(Map, isCollection)
	return function(...)
		local new = merge(...)

		return if isCollection(select(1, ...)) then Map(new) else new
	end
end
