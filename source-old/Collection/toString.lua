return function(self, head: string, tail: string): string
	return head .. " " .. self.map(tostring).joinAsString(", ") .. " " .. tail
end
