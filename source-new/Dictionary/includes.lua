--!strict
local includes = require(script.Parent.Parent.utils.includes)
--[=[
	Returns true if the value is found within the Dictionary.

	```lua
	Dictionary.includes({ a = 1, b = 2, c = 3 }, 2)
	-- true
	```

	@within Dictionary
	@function includes
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, value: Value): boolean
	return includes(dictionary, value)
end
