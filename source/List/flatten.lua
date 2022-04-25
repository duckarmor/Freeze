--[=[
	Returns a flattened list in the same index-order as each Value would appear.

	```lua
	List.new({
		"foo",
		{
			"bar",
			"baz",
		},
		{
			"bar",
			"baz",
		},
		"quz",
	}).flatten()
	-- List( "foo", "bar", "baz", "bar", "baz", "quz" )
	```

	@within List
	@function flatten
	@param depth number?
	@return List
]=]

return function(List, isCollection)
	local function flatten(self, depth: number?)
		local new = {}
		local index = 1

		for _, v in ipairs(self) do
			if type(v) == "table" and (not depth or depth > 0) then
				local subList = flatten(v, depth and depth - 1)
				subList = if isCollection(subList) then subList.collection else subList

				for j = 1, #subList do
					new[index] = subList[j]
					index = index + 1
				end
			else
				new[index] = v
				index = index + 1
			end
		end

		return new
	end

	return function(self, depth)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = flatten(self, depth)

		return if wasCollection then List(new) else new
	end
end
