--[=[
	Returns a new map with the entry at `keyPath` updated to the result of `updater`.

	If any entry does not exist along `keyPath`, an empty map will be created in its place.
	If the final entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	Dictionary.new({
		persons = {
			alice = {
				age = 10,
			},
			bertram = {
				age = 16,
			},
		},
	}).updateIn({ "persons", "alice", "age" }, function(value)
		return value + 1
	end)
	-- Dictionary( persons = { alice = { age = 11 }, bertram = { age = 16 }, } )
	```

	@within Dictionary
	@function updateIn
	@param keyPath { any }
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return Dictionary
]=]

return require(script.Parent.Parent.Collection.updateIn)
