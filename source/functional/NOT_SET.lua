local None = newproxy(true)

getmetatable(None).__tostring = function()
	return "Freeze.NOT_SET"
end

return None
