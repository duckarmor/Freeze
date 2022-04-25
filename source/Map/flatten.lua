--[=[
	Returns a flattened map.

	```lua
	Map.new({
		foo = 1,
		foobar = {
			bar = 2,
			baz = {
				etc = 3,
			},
		},
	}).flatten()
	-- Map( foo = 1, bar = 2, etc = 3 )
	```

	@within Map
	@function flatten
	@param depth number?
	@return Map
]=]

return function(Map, isCollection)
	local function flatten(self, depth)
		local new = {}

		for key, value in pairs(self) do
			if type(value) == "table" and (not depth or depth > 0) then
				value = if isCollection(value) then value.collection else value

				local subDictionary = flatten(value, depth and depth - 1)
				subDictionary = if isCollection(subDictionary) then subDictionary.collection else subDictionary

				for newKey, newValue in pairs(new) do
					subDictionary[newKey] = newValue
				end

				new = subDictionary
			else
				new[key] = value
			end
		end

		return new
	end

	return function(self, depth)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = flatten(self, depth)

		return if wasCollection then Map(new) else new
	end
end
