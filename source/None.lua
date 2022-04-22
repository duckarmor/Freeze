export type type = {}

local None: type = newproxy(true)

getmetatable(None).__tostring = function()
	return "Freeze.None"
end

return None
