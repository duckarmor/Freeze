---
sidebar_position: 1
---

# Freeze

Freeze is an immutable data structure library for Roblox Luau.

Use it to create immutable data structures like so:

```lua
local map1 = { a = 1, b = 2, c = 3 }
local map2 = Freeze.Dictionary.set(map1, "b", 50)

print(map1.b, "vs", map2.b) -- 2 vs 50
```

## Prior art

Freeze is takes inspiration from:
- [Llama by freddylist](https://github.com/freddylist/llama)
- [Immutable.js](https://immutable-js.com/)
