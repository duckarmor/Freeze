export type type = {}

--[=[
	@prop None None
	@within Freeze

	Since lua tables cannot distinguish between values not being present and a value of nil,
	`Freeze.None` exists to represent values that should be interpreted as `nil`.

	This is useful when removing values with functions such as [`Freeze.Map.merge`](../api/Map#merge).
]=]

local None: type = newproxy(true)

getmetatable(None).__tostring = function()
	return "Freeze.None"
end

return None
