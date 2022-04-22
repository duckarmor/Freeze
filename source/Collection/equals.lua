local equalsDeep = require(script.Parent.Parent.functional.equalsDeep)

return function(_Collection, isCollection)
	return function(self, other)
		return equalsDeep(
			if isCollection(self) then self.collection else self,
			if isCollection(other) then other.collection else other
		)
	end
end
