--!strict
local merge = require(script.Parent.Parent.utils.merge)
--[=[
	Returns a merged result of all given dictionaries.

	If `Freeze.None` is a value assigned to a key, it will delete that key from the resulting dictionary.

	##### Alias
	`join`

	```lua
	Dictionary.merge({ a = 10, b = 20 }, { c = 30 })
	-- { a = 10, b = 20, c = 30 }

	Dictionary.merge({ a = 10, b = 20 }, { c = 30, d = 40 }, { b = Freeze.None })
	-- { a = 10, c = 30, d = 40 }
	```

	@within Dictionary
	@function merge
	@param dictionaries ...Dictionary
	@return Dictionary
]=]

return function<Key, Value>(...: { [Key]: Value })
	return merge(...)
end
