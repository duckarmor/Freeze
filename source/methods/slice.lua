local slice = require(script.Parent.Parent.functional.slice)

return function(self, from: number, to: number)
	return slice(self, from, to)
end
