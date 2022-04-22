return function(_Collection, isCollection)
	local function join(self, separator)
		self = if isCollection(self) then self.collection else self

		if #self > 0 then
			return table.concat(self, separator or ",")
		else
			local fields = {}
			for k, v in pairs(self) do
				table.insert(fields, string.format("%s=%s", tostring(k), tostring(v)))
			end
			return table.concat(fields, separator or ",")
		end
	end

	return join
end
