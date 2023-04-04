--[=[
	Returns a merged result of all given maps.

	If `Freeze.None` is a value assigned to a key, it will delete that key from the resulting map.

	##### Alias
	`join`

	```lua
	Dictionary.new({ a = 10, b = 20 }).merge({ c = 30 })
	-- Dictionary( a = 10, b = 20, c = 30 )

	Dictionary.new({ a = 10, b = 20 }).merge({ c = 30, d = 40 }, { b = Freeze.None })
	-- Dictionary( a = 10, c = 30, d = 40 )
	```

	@within Dictionary
	@function merge
	@param maps ...Dictionary
	@return Dictionary
]=]

local merge = require(script.Parent.Parent.functional.merge)

return function(Dictionary, isCollection)
	return function(...)
		local new = merge(...)

		return if isCollection(select(1, ...)) then Dictionary(new) else new
	end
end
