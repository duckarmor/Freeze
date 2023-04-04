--!strict
local mergeIn = require(script.Parent.Parent.utils.mergeIn)

--[=[
	A combination of `updateIn` and `merge`, returning a new dictionary,
	but performing a merge at the point arrived by following the key path.

	```lua
    local dictionary = {
		persons = {
			alice = {
				age = 10,
			},
		},
	}

	Dictionary.mergeIn(dictionary, { "persons", "alice" }, { age = 11 })
	-- { persons = { alice = { age = 11 } } }
	```

	@within Dictionary
	@function mergeIn
	@param keyPath { any }
	@param dictionaries ...{ [any]: any }
	@return { [any]: any }
]=]

return function(dictionary, keyPath, ...)
	return mergeIn(dictionary, keyPath, ...)
end
