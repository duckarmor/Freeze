--!strict
local updateIn = require(script.Parent.Parent.utils.updateIn)

--[=[
	Returns a dictionary with the entry at `keyPath` updated to the result of `updater`.

	If any entry does not exist along `keyPath`, an empty map will be created in its place.
	If the final entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	local dictionary = {
		persons = {
			alice = {
				age = 10,
			},
		},
	}

    Dictionary.updateIn({ "persons", "alice", "age" }, function(value: number)
        assert(value, "will exist")
        return value + 1
    end)
	-- { persons = { alice = { age = 11 } } }
	```

	@within Map
	@function updateIn
	@param keyPath { any }
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return { [any]: any }
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, keyPath, updater, notSetValue)
	return table.freeze(updateIn(dictionary, keyPath, updater, notSetValue))
end
