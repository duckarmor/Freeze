--!strict
local removeInImpl = require(script.Parent.Parent.utils.removeIn)
--[=[
	Returns a new map having removed the value at this `keyPath`.
	Will create a new path if it does not exist.

	```lua
	Dictionary.removeIn({ a = { b = { "c" } } }, { "a", "b" })
	-- { a = {} }
	```

	@within Dictionary
]=]

local function removeIn(dictionary: { [any]: any }, keyPath: { any }): { [any]: any }
	return table.freeze(removeInImpl(dictionary, keyPath))
end

return removeIn
