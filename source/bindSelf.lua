local function bindSelf(self, method)
	return function(firstArg, ...)
		if firstArg == self then
			return method(self, ...)
		else
			return method(self, firstArg, ...)
		end
	end
end

return bindSelf
