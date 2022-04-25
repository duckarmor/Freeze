--[=[
	Returns a new list excluding the last index of this list.


	```lua
	List.new({ 10, 20, 30 }).pop()
	-- List( 10, 20 )
	```

	@within List
	@function pop
	@param amount number?
	@return List
]=]

return function(List, isCollection)
	return function(self, amount: number?)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self
		amount = math.max(1, amount or 1)

		local list = self
		local len = #list

		local new = {}

		for i = 1, len - amount do
			new[i] = list[i]
		end

		return if wasCollection then List(new) else new
	end
end
