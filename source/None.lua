local None = newproxy(true)

getmetatable(None).__tostring = function()
	return "Freeze.None"
end

return None
