---
sidebar_position: 6
---

# Migrating From Llama

Freeze is close to a drag-and-drop replacement for projects that currently use [Llama](https://github.com/freddylist/llama), however
you'll need to be aware of incompatible changes.

Feel free to file an issue if you'd like to start a discussion on any items from this list.

# Deviations

The following is a list of deviations between Freeze and Llama:

## Llama

### .equalObjects
- Not implemented.

## .Dictionary

### .copy
- A temporary, deprecated compatibility layer exists. Use `table.clone` instead.

### .copyDeep
- Not implemented. Reconsider if you really need this.

### .equals
- [Freeze.Dictionary.equals] will perform **value-equality** instead of **reference-equality**.
- [Freeze.Dictionary.equals] only accepts two objects to compare between instead of varags arguments

### .equalsDeep
- Not implemented.

### .fromLists
- Not implemented.

### .mergeDeep
- Not implemented.

### .removeKeys
- A temporary, deprecated compatibility layer exists. Use [Dictionary.remove] instead.

### .removeValues
- A temporary, deprecated compatibility layer exists. Use [Dictionary.removeValue] instead.

### .update
- Freeze.[Dictionary.update] requires an updater function while Llama's was optional.
- Freeze.[Dictionary.update]'s updater signature is `(Value) -> (Value)` instead of Llama's `(Value, Key) -> (Value)`.
- [Dictionary.update] final argument is `notSetValue` instead of a `callback` function.

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
- A temporary, deprecated compatibility layer exists. Consider `table.create` instead.

### .equals
- Freeze.[List.equals] will perform **value-equality** instead of **reference-equality**.
- Freeze.[List.equals] only accepts two objects to compare between instead of varags arguments.

### .equalsDeep
- Not implemented.

### .find
- Freeze.[List.find] accepts a predicate instead of a value.
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
- Freeze.[List.findLast] accepts a predicate instead of a value.

```lua
-- Freeze
Freeze.List.findLast(list, function(value)
	return value == "foo"
end)

-- Llama
Llama.List.findLast(list, "foo")
```

### .findWhere
- A temporary, deprecated compatibility layer exists. Please use Freeze.[List.find].
- The `from` argument is not supported.

### .findWhereLast
- A temporary, deprecated compatibility layer exists. Please use Freeze.[List.findLast].
- The `from` argument is not supported.

### .insert
- Freeze.[List.insert] allows the provided `index` argument to be out of bounds. Llama would throw in this case whereas Freeze will clamp the value to either the beginning or the end of the list.

### .join
- A temporary, deprecated compatibility layer exists. Please use Freeze.[List.concat].

### .removeIndices
- A temporary, deprecated compatibility layer exists. Please use Freeze.[List.remove] instead.

### .removeValues
- A temporary, deprecated compatibility layer exists. Please use Freeze.[List.removeValue] instead.

### .set
- Freeze.[List.set] allows the `index` argument to be out of bounds whereas Llama would throw.
- If no changes are made, Freeze.[List.set] will return the original List.

### .slice
- Freeze.[List.slice] allows the `index` argument to be out of bounds. Will not throw.
- Using a negative number will slice from the end of the list.

### .splice
- Not implemented.

### .toSet
- Not exposed yet.

### .update
- Freeze.[List.update] requires an updater function while Llama's was optional.
- Freeze[List.update]'s updater signature is `(Value) -> (Value)` instead of Llama's `(Value, Key) -> (Value)`.
- Freeze.[List.update] final argument is `notSetValue` instead of a `callback` function.

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

## Set
- Not implemented yet.
