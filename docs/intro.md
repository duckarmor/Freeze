---
sidebar_position: 1
---

# Freeze

Freeze is an immutable data structure library for Roblox Luau.

Use it to create immutable data structures like so:

```lua
local Map = Freeze.Map

local map1 = Map({ a = 1, b = 2, c = 3 })
local map2 = map1.set("b", 50)
print(map1.get("b"), "vs", map2.get("b")) -- 2 vs 50
```

You may also use it functionally:

```lua
local map1 = { a = 1, b = 2, c = 3 }
local map2 = Freeze.Map.set(map1, "b", 50)

print(map1.b, "vs", map2.b) -- 2 vs 50
```

## Prior art

Freeze is takes inspiration from:
- [Llama by freddylist](https://github.com/freddylist/llama)
- [Immutable.js](https://immutable-js.com/)