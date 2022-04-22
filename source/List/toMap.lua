return function(_List, isCollection)
	return function(self)
		local Map = require(script.Parent.Parent.Map)
		self = if isCollection(self) then self.collection else self

		return Map.new(self)
	end
end
