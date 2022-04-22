local function slice(self, from: number, to: number)
	local len = #self
	from = if from and from < 0 then len + (from + 1) else from or 1
	to = if to and to < 0 then len + to else to or len

	local new = {}
	local index = 1
	for i = from, to do
		new[index] = self[i]
		index = index + 1
	end

	return new
end

return slice
