<div align="center">
An immutable data structure library for Roblox Luau.

[**View docs &rarr;**](https://benbrimeyer.github.io/Freeze/)

⚠️ Pre-release. Feel free to install, however expect things to shift around before v1.0.0 ⚠️
</div>

## Demo
```lua
local map1 = Dictionary({ a = 1, b = 2, c = 3 })
local map2 = map1.set("b", 50)
print(map1.get("b"), "vs", map2.get("b")) -- 2 vs 50
```

See more [demonstrations](https://benbrimeyer.github.io/Freeze/docs/Demonstration) within our docs!

## Installation

### With Wally

```toml
[dependencies]
Freeze = "duckarmor/freeze@0.0.2"
```
