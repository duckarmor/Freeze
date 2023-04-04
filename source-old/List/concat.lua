--[=[
	Returns a new List of the same type concatenated to given arguments.

	```lua
	List.new({ "a", "b", "c" }).concat({ "d", "e", "f" })
	-- List( "a", "b", "c", "d", "e", "f" )
	```

	@within List
	@function concat
	@param valuesOrIterables ...any
	@return List
]=]

local None = require(script.Parent.Parent.None)

return function(List, isCollection)
	return function(...)
		local wasCollection = isCollection(select(1, ...))
		local new = {}
		local index = 1

		for listIndex = 1, select("#", ...) do
			local list = select(listIndex, ...)

			if list ~= nil then
				if type(list) == "table" and #list > 0 or isCollection(list) then
					list = if isCollection(list) then list.collection else list
				else
					list = { list }
				end

				for _, v in ipairs(list) do
					if v ~= None then
						new[index] = v
						index += 1
					end
				end
			end
		end

		return if wasCollection then List(new) else new
	end
end
