--[=[
	A combination of `updateIn` and `merge`, returning a new Dictionary,
	but performing a merge at the point arrived by following the key path.

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
	}).mergeIn({ "persons", "alice" }, { age = 11 })
	-- Dictionary( persons = { alice = { age = 11 }, bertram = { age = 16 }, } )
	```

	@within Dictionary
	@function mergeIn
	@param keyPath { any }
	@param maps ...Dictionary
	@return Dictionary
]=]

local mergeIn = require(script.Parent.Parent.functional.mergeIn)

return function(Dictionary, isCollection)
	return function(self, keyPath, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = mergeIn(self, keyPath, ...)

		return if wasCollection then Dictionary(new) else new
	end
end
