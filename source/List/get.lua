return function(_List, isCollection)
	return function(self, index: number, notSetValue: any): any?
		self = if isCollection(self) then self.collection else self

		if type(index) == "number" and index < 0 then
			index = #self + (index + 1)
		end

		local value = self[index]
		return if value then value else notSetValue
	end
end
