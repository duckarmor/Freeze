--[=[
	A combination of `updateIn` and `merge`, returning a new Map,
	but performing a merge at the point arrived by following the key path.

	```lua
	Map.new({
		persons = {
			alice = {
				age = 10,
			},
			bertram = {
				age = 16,
			},
		},
	}).mergeIn({ "persons", "alice" }, { age = 11 })
	-- Map( persons = { alice = { age = 11 }, bertram = { age = 16 }, } )
	```

	@within Map
	@function mergeIn
	@param keyPath { any }
	@param maps ...Map
	@return Map
]=]

local mergeIn = require(script.Parent.Parent.functional.mergeIn)

return function(Map, isCollection)
	return function(self, keyPath, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = mergeIn(self, keyPath, ...)

		return if wasCollection then Map(new) else new
	end
end
