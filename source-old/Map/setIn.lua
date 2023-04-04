--[=[
	Returns a new map having set `value` at this `keyPath`.
	If any keys in `keyPath` do not exist, a new map will be created at that key.

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
	}).setIn({ "persons", "alice", "age" }, 11)
	-- Dictionary( persons = { alice = { age = 11 }, bertram = { age = 16 }, } )
	```

	@within Dictionary
	@function setIn
	@param keyPath { any }
	@param value Value
	@return Dictionary
]=]

return require(script.Parent.Parent.Collection.setIn)
