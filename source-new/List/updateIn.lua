--!strict
local utils = script.Parent.Parent.utils
local updateIn = require(utils.updateIn)

--[=[
	Returns a new list with the entry at `keyPath` updated to the result of `updater`.

	If any entry does not exist along `keyPath`, an empty map will be created in its place.
	If the final entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	List.updateIn({ "a", "b", { "c", "d" } }, { 4, 1 }, function(value)
		return string.rep(value, 5)
	end)
	-- { "a", "b", { "ccccc", "e" } }

    List.updateIn({ "a", "b", { "c", "d" } }, { 4, 3, 1 }, function(value)
		return string.rep(value, 5)
	end, "e")
    -- { "a", "b", { "c", "d", { "eeeee" } } }
	```

	@within List
    @param list { Value }
	@param keyPath { number }
	@param updater (Value?, number?) -> (Value)
	@param notSetValue Value?
	@return { Value }
	@ignore
]=]

return function<Value>(
	list: { Value },
	keyPath: { number },
	updater: (Value?, number?) -> Value,
	notSetValue: Value?
): { Value }
	return table.freeze(updateIn(list, keyPath, updater, notSetValue))
end
