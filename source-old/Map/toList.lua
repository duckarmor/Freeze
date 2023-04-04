--[=[
	Converts this map to a List.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).toList()
	-- List( 1, 2, 3 )
	```

	@within Map
	@function toList
	@return List
]=]

local List = require(script.Parent.Parent.List)

return function(_Map, isCollection)
	return function(self)
		self = if isCollection(self) then self.collection else self

		local new = {}

		for _, value in pairs(self) do
			table.insert(new, value)
		end

		return List.new(new)
	end
end
