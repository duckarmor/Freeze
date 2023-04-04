--!strict
local merge = require(script.Parent.Parent.utils.merge)

--[=[
	Returns a merged result of all given lists.

	If `Freeze.None` is a value assigned to a key, it will delete that key from the resulting list.

	##### Alias
	`join`

	```lua
	List.merge({ 10, nil, 30 }, { nil, 20, nil })
	-- { 10, 20, 30 }

	List.merge({ "a", "b", "c" }, { "x" }, { nil, "y", Freeze.None })
	-- { "x", "y" }
	```

	@within List
	@function merge
	@param lists ...{ any }
	@return { any }
]=]

return function(...: { any }): { any }
	return table.freeze(merge(...))
end
