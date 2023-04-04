--!strict
local removeIn = require(script.Parent.Parent.utils.removeIn)
--[=[
	Returns a new map having removed the value at this `keyPath`.
    Will create a new path if it does not exist.

	```lua
	Dictionary.removeIn({ a = { b = { "c" } } }, { "a", "b" })
	-- Dictionary( a = {} )
	```

	@within Dictionary
	@function removeIn
	@param keyPath { any }
	@return Map
]=]

return function(dictionary, keyPath)
	return table.freeze(removeIn(dictionary, keyPath))
end
