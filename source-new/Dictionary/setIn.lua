--!strict
local setIn = require(script.Parent.Parent.utils.setIn)
--[=[
	Returns a dictionary having set `value` at this `keyPath`.
	If any keys in `keyPath` do not exist, a new dictionary will be created at that key.

	```lua
	local dictionary = {
		persons = {
			alice = {
				age = 10,
			}
		},
	}

	Dictionary.setIn(dictionary, { "persons", "alice", "age" }, 11)
	-- { persons = { alice = { age = 11 } } }
	```

	@within Dictionary
	@function setIn
	@param keyPath { any }
	@param value any
	@return { [any]: any }
]=]

return function(dictionary, keyPath, value)
	return table.freeze(setIn(dictionary, keyPath, value))
end
