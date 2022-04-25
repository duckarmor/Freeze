---
sidebar_position: 2
---

# Migrating From Llama

Freeze is, unfortunately, not a true drag-and-drop replacement for projects that currently use [Llama](https://github.com/freddylist/llama).
You'll need to be aware of the following breaking changes.

Feel free to file an issue if you'd like to start a discussion on any items from this list.

# Deviations

The following is a list of breaking deviations between Freeze and Llama:

## Llama

### .equalObjects
- Not implemented. See Freeze's `equals` instead.

### .isEmpty
- Not implemented.
- Use `Freeze.Dictionary.isEmpty` or `Freeze.List.isEmpty` instead.

## .Dictionary

### .copy
- Not implemented. Use `table.clone` instead.

### .copyDeep
- Not implemented. Reconsider if you really need this.

### .equals
- `Freeze.Dictionary.equals` will perform value-equality instead of reference-equality
- `Freeze.Dictionary.equals` only accepts two objects to compare between instead of varags arguments
- `Freeze.Dictionary.equals` will treat nil and void as values, where `Freeze.Dictionary.equals` would ignore these arguments

### .equalsDeep
- Not implemented.

### .fromLists
- Not implemented.

### .mergeDeep
- Not implemented.

### .removeKeys
- Not implemented.

### .removeValues
- Not implemented.

### .update
- `Freeze.Dictionary.update` requires an updater function while Llama's was optional.
- `Freeze.Dictionary.update`'s updater signature is `(Value) -> (Value)` instead of Llama's `(Value, Key) -> (Value)`.
- `Freeze.Dictionary.update` final argument is `notSetValue` instead of a `callback` function.

```lua
-- Freeze
Freeze.Dictionary.update(dictionary, key, function(value)
	return string.upper(value)
end, "default value")

-- Llama
Llama.Dictionary.update(dictionary, key, function(value, key)
	return string.upper(value)
end, function(key)
	return "default value"
end)
```

## List

### .concatDeep
- Not implemented.

### .copy
- Not implemented. Consider `table.clone` instead.

### .copyDeep
- Not implemented. Reconsider if you really need this.

### .create
- Not implemented. Consider `table.create` instead.

### .equals
- `Freeze.List.equals` will perform value-equality instead of reference-equality
- `Freeze.List.equals` only accepts two objects to compare between instead of varags arguments
- `Freeze.List.equals` will treat nil and void as values, where `Freeze.List.equals` would ignore these arguments

### .equalsDeep
- Not implemented.

### .find
- `Freeze.List.find` accepts a predicate instead of a value.
- Consider `table.find` if you want to use a static value.

```lua
-- Freeze
Freeze.List.find(list, function(value)
	return value == "foo"
end)

-- Llama
Llama.List.find(list, "foo")
```

### .findLast
- `Freeze.List.findLast` accepts a predicate instead of a value.

```lua
-- Freeze
Freeze.List.findLast(list, function(value)
	return value == "foo"
end)

-- Llama
Llama.List.findLast(list, "foo")
```

### .findWhere
- Not implemented.
- Equivalent to `Freeze.List.find`.


### .findWhereLast
- Not implemented.
- Equivalent to `Freeze.List.findLast`.

### .insert
- Allows index to be out of bounds. Will not throw.

### .removeIndices
- Not implemented.

### .removeValues
- Not implemented.

### .set
- Allows index to be out of bounds. Will not throw.

### .slice
- Allows index to be out of bounds. Will not throw.
- Using a negative number will slice from the end of the list.

### .splice
- Not implemented.

### .toSet
- Not implemented.

### .update
- `Freeze.List.update` requires an updater function while Llama's was optional.
- `Freeze.List.update`'s updater signature is `(Value) -> (Value)` instead of Llama's `(Value, Key) -> (Value)`.
- `Freeze.List.update` final argument is `notSetValue` instead of a `callback` function.

```lua
-- Freeze
Freeze.List.update(list, key, function(value)
	return string.upper(value)
end, "default value")

-- Llama
Llama.List.update(list, key, function(value, key)
	return string.upper(value)
end, function(key)
	return "default value"
end)
```

### .zipAll
- Not implemented.