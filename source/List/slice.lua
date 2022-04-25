--[=[
	Returns a new list that includes the range `[from, to)`.

	If `from` is negative, it is offset from the end of the list.
	`slice(-2)` returns a list of the last two entries.
	If it is not provided, the new list will begin at the first entry.

	If `to` is negative, it is offset from the end of the list.
	`slice(0, -1)` returns a list of everything but the last entry.
	If it is not provided, the new list will continue through the end of the list.

	```lua
	List.new({ "a", "b", "c", "d", "e", "f", "g" }).slice()
	-- List( "d", "e", "f", "g" )

	List.new({ "a", "b", "c", "d", "e", "f", "g" }).slice(-2)
	-- List( "f", "g" )

	List.new({ "a", "b", "c", "d", "e", "f", "g" }).slice(0, -1)
	-- List( "a", "b", "c", "d", "e", "f" )
	```

	@within List
	@function slice
	@param from number?
	@param to number?
	@return List
]=]

return function(List, isCollection)
	return function(self, from: number?, to: number?)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self
		from = if from and from < 0 then len + (from + 1) else from or 1
		to = if to and to < 0 then len + to else to or len

		local new = {}
		local index = 1
		for i = from, to do
			new[index] = self[i]
			index = index + 1
		end

		return if wasCollection then List(new) else new
	end
end
