--[=[
	A combination of `updateIn` and `merge`, returning a new List,
	but performing a merge at the point arrived by following the key path.

	```lua
	List.new({
		{ a = { b = "c" } },
		{ a = { b = "c" } },
	}).mergeIn({ 1, "a" }, { b = "z" })
	-- List( { a = { b = "z" } }, { a = { b = "c" } } )
	```

	@within List
	@function mergeIn
	@param keyPath { any }
	@param lists ...List
	@return List
]=]

local mergeIn = require(script.Parent.Parent.functional.mergeIn)

return function(List, isCollection)
	return function(self, keyPath, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = mergeIn(self, keyPath, ...)

		return if wasCollection then List(new) else new
	end
end
