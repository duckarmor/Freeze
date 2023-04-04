--!nocheck
local Freeze = require(script.Parent.Parent)
local List = Freeze.List
local None = Freeze.None

return function()
	describe("should work with functional and chained styles", function()
		it("get", function()
			local t = { "a", "b", "c" }

			local v0 = List.get(t, 2)
			expect(v0).toEqual("b")

			local v1 = List.first(t)
			expect(v1).toEqual("a")

			local v2 = List.last(t)
			expect(v2).toEqual("c")
		end)

		it("first", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.first()).toEqual("a")

			local array = { "a", "b", "c" }
			expect(List.first(array)).toEqual("a")
		end)

		it("last", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.last()).toEqual("c")

			local array = { "a", "b", "c" }
			expect(List.last(array)).toEqual("c")
		end)

		it("indexOf", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.indexOf("b")).toEqual(2)

			local array = { "a", "b", "c" }
			expect(List.indexOf(array, "b")).toEqual(2)
		end)

		it("findIndex", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.findIndex(function(value)
				return value == "b"
			end)).toEqual(2)

			local array = { "a", "b", "c" }
			expect(List.findIndex(array, function(value)
				return value == "b"
			end)).toEqual(2)
		end)

		it("set", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.set(2, "B").toLuau()).toEqual({ "a", "B", "c" })

			local array = { "a", "b", "c" }
			expect(List.set(array, 2, "B")).toEqual({ "a", "B", "c" })
		end)

		it("remove", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.remove(2).toLuau()).toEqual({ "a", "c" })

			local array = { "a", "b", "c" }
			expect(List.remove(array, 2)).toEqual({ "a", "c" })
		end)

		it("removeIndex", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.removeIndex(2).toLuau()).toEqual({ "a", "c" })

			local array = { "a", "b", "c" }
			expect(List.removeIndex(array, 2)).toEqual({ "a", "c" })
		end)

		it("removeValue", function()
			local list = List.new({ "a", "b", "c", "b" })
			expect(list.removeValue("b").toLuau()).toEqual({ "a", "c" })

			local array = { "a", "b", "c" }
			expect(List.removeValue(array, "b")).toEqual({ "a", "c" })
		end)

		it("update", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.update(2, string.upper).toLuau()).toEqual({ "a", "B", "c" })

			local array = { "a", "b", "c" }
			expect(List.update(array, 2, string.upper)).toEqual({ "a", "B", "c" })
		end)

		it("push", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.push("d", "e", "f").toLuau()).toEqual({ "a", "b", "c", "d", "e", "f" })

			local array = { "a", "b", "c" }
			expect(List.push(array, "d", "e", "f")).toEqual({ "a", "b", "c", "d", "e", "f" })
		end)

		it("pop", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.pop().toLuau()).toEqual({ "a", "b" })

			local array = { "a", "b", "c" }
			expect(List.pop(array)).toEqual({ "a", "b" })
		end)

		it("map", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.map(string.upper).toLuau()).toEqual({ "A", "B", "C" })

			local array = { "a", "b", "c" }
			expect(List.map(array, string.upper)).toEqual({ "A", "B", "C" })
		end)

		it("reverse", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.reverse().toLuau()).toEqual({ "c", "b", "a" })

			local array = { "a", "b", "c" }
			expect(List.reverse(array)).toEqual({ "c", "b", "a" })
		end)

		it("shift", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.shift().toLuau()).toEqual({ "b", "c" })

			local array = { "a", "b", "c" }
			expect(List.shift(array)).toEqual({ "b", "c" })
		end)

		it("filter", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.filter(function(_value, index)
				return index % 2 == 1
			end).toLuau()).toEqual({ "a", "c" })

			local array = { "a", "b", "c" }
			expect(List.filter(array, function(_value, index)
				return index % 2 == 1
			end)).toEqual({ "a", "c" })
		end)

		it("filterNot", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.filterNot(function(_value, index)
				return index % 2 == 0
			end).toLuau()).toEqual({ "a", "c" })

			local array = { "a", "b", "c" }
			expect(List.filterNot(array, function(_value, index)
				return index % 2 == 0
			end)).toEqual({ "a", "c" })
		end)

		it("reduce", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.reduce(function(state, value)
				return state .. value
			end)).toEqual("abc")

			local array = { "a", "b", "c" }
			expect(List.reduce(array, function(state, value)
				return state .. value
			end)).toEqual("abc")

			expect(List.new({ 10, 20, 30 }).reduce(function(reduction, value)
				return reduction + value
			end)).toEqual(60)
		end)

		it("reduceRight", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.reduceRight(function(state, value)
				return state .. value
			end)).toEqual("cba")

			local array = { "a", "b", "c" }
			expect(List.reduceRight(array, function(state, value)
				return state .. value
			end)).toEqual("cba")
		end)

		it("getIn", function()
			local array = {
				{
					aKey = { "bad", "good" },
				},
			}
			local list = List(array)
			expect(list.getIn({ 1, "aKey", 2 })).toEqual("good")

			expect(List.getIn(array, { 1, "aKey", 2 })).toEqual("good")
		end)

		it("hasIn", function()
			local array = {
				{
					aKey = { "bad", "good" },
				},
			}
			local list = List(array)
			expect(list.hasIn({ 1, "aKey", 2 })).toEqual(true)

			expect(List.hasIn(array, { 1, "aKey", 2 })).toEqual(true)
		end)

		it("setIn", function()
			local array = {
				{
					aKey = { "bad", "good" },
				},
			}

			local list = List(array)
			expect(list.setIn({ 1, "aKey", 3 }, "best").getIn({ 1, "aKey" })).toEqual({ "bad", "good", "best" })

			expect(List.getIn(List.setIn(array, { 1, "aKey", 3 }, "best"), { 1, "aKey" })).toEqual({
				"bad",
				"good",
				"best",
			})
		end)

		it("removeIn", function()
			local array = {
				{
					aKey = { "bad", "good" },
				},
			}
			local expected = { {} }

			local list = List(array)
			expect(list.removeIn({ 1, "aKey" }).toLuau()).toEqual(expected)

			expect(List.removeIn(array, { 1, "aKey" })).toEqual(expected)

			expect(List.new({ "a", "b", "c", { "d", "e" } }).removeIn({ 4, 1 }).toLuau()).toEqual({
				"a",
				"b",
				"c",
				{ nil, "e" },
			})
		end)

		it("updateIn", function()
			local array = {
				{
					aKey = { "bad", "good" },
				},
			}

			local function update()
				return "best"
			end

			local list = List(array)
			expect(list.updateIn({ 1, "aKey", 3 }, update).getIn({ 1, "aKey" })).toEqual({ "bad", "good", "best" })

			expect(List.getIn(List.updateIn(array, { 1, "aKey", 3 }, update), { 1, "aKey" })).toEqual({
				"bad",
				"good",
				"best",
			})

			expect(List.new({ "a", "b", "c", { "d", "e" } }).updateIn({ 4, 1 }, function(value)
				return string.rep(value, 5)
			end).toLuau()).toEqual({ "a", "b", "c", { "ddddd", "e" } })

			expect(List.new({ "a", "b", "c", { "d", "e" } }).updateIn({ 4, 3, 1 }, function(value)
				return string.rep(value, 5)
			end, "g").toLuau()).toEqual({ "a", "b", "c", { "d", "e", { "ggggg" } } })
		end)

		it("slice", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.slice(1, 2).toLuau()).toEqual({ "a", "b" })

			local array = { "a", "b", "c" }
			expect(List.slice(array, 1, 2)).toEqual({ "a", "b" })
		end)

		it("rest", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.rest().toLuau()).toEqual({ "b", "c" })

			local array = { "a", "b", "c" }
			expect(List.rest(array)).toEqual({ "b", "c" })
		end)

		it("butLast", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.butLast().toLuau()).toEqual({ "a", "b" })

			local array = { "a", "b", "c" }
			expect(List.butLast(array)).toEqual({ "a", "b" })
		end)

		it("take", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.take(2).toLuau()).toEqual({ "a", "b" })

			local array = { "a", "b", "c" }
			expect(List.take(array, 2)).toEqual({ "a", "b" })
		end)

		it("takeLast", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.takeLast(2).toLuau()).toEqual({ "b", "c" })

			local array = { "a", "b", "c" }
			expect(List.takeLast(array, 2)).toEqual({ "b", "c" })
		end)

		it("skip", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.skip(2).toLuau()).toEqual({ "c" })

			local array = { "a", "b", "c" }
			expect(List.skip(array, 2)).toEqual({ "c" })
		end)

		it("insert", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.insert(2, "d").toLuau()).toEqual({ "a", "d", "b", "c" })

			local array = { "a", "b", "c" }
			expect(List.insert(array, 2, "d")).toEqual({ "a", "d", "b", "c" })
		end)

		it("concat", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.concat({ "d", "e", "f" }, { "g" }, { None }).toLuau()).toEqual({
				"a",
				"b",
				"c",
				"d",
				"e",
				"f",
				"g",
			})

			local array = { "a", "b", "c" }
			expect(List.concat(array, { "d", "e", "f" }, { "g" }, { None })).toEqual({
				"a",
				"b",
				"c",
				"d",
				"e",
				"f",
				"g",
			})
		end)

		it("count", function()
			local list = List.new({ "a", "b", "c" })
			expect(list.count()).toEqual(3)

			local array = { "a", "b", "c" }
			expect(List.count(array)).toEqual(3)
		end)

		it("merge", function()
			local array = { "a", nil, "c" }
			local expected = { "a", "b", "C" }
			expect(List.merge(array, { nil, "b", "C" })).toEqual(expected)

			local list = List.new(array)
			expect(list.merge({ nil, "b", "C" }).toLuau()).toEqual(expected)

			local list2 = List.new({ "a", "b", "c" }).merge({ "x" }, { nil, "y", Freeze.None })
			expect(list2.toLuau()).toEqual({ "x", "y" })
		end)

		it("mergeIn", function()
			local array = {
				{ a = { b = "c" } },
				{ a = { b = "c" } },
			}
			local expected = {
				{ a = { b = "C" } },
				{ a = { b = "c" } },
			}
			expect(List.mergeIn(array, { 1, "a" }, { b = "C" })).toEqual(expected)

			local list = List.new(array)
			expect(list.mergeIn({ 1, "a" }, { b = "C" }).toLuau()).toEqual(expected)
		end)

		it("equals", function()
			local array = { { "a" }, { "b" }, { "c" } }
			local other = { { "a" }, { "b" }, { "c" } }
			local other2 = { {}, {}, {} }

			expect(List.equals(array, other)).toBe(true)
			expect(List.equals(array, other2)).toBe(false)

			local list = List.new(array)
			expect(list.equals(other)).toBe(true)
			expect(list.equals(other2)).toBe(false)
		end)

		it("toMap", function()
			local array = { { "a" }, { "b" }, { "c" } }

			expect(List.toMap(array).toLuau()).toEqual(array)

			local list = List.new(array)
			expect(list.toMap().toLuau()).toEqual(array)
		end)

		it("includes", function()
			local array = { "a", "b", "c" }

			expect(List.includes(array, "a")).toEqual(true)

			local list = List.new(array)
			expect(list.includes("a")).toEqual(true)
		end)

		it("sort", function()
			local array = { 100, 10, 1000, 1 }

			expect(List.sort(array)).toEqual({ 1, 10, 100, 1000 })

			local list = List.new(array)
			expect(list.sort().toLuau()).toEqual({ 1, 10, 100, 1000 })
		end)

		it("zip", function()
			local array = { 1, 2, 3 }
			local other = { 4, 5, 6 }
			local expected = { { 1, 4 }, { 2, 5 }, { 3, 6 } }

			expect(List.zip(array, other)).toEqual(expected)

			local list = List.new(array)
			expect(list.zip(other).toLuau()).toEqual(expected)
		end)

		it("isEmpty", function()
			local array = {}

			expect(List.isEmpty(array)).toEqual(true)

			local list = List.new(array)
			expect(list.isEmpty()).toEqual(true)
		end)

		it("every", function()
			local array = { "a", "b", "c" }
			local isString = function(v)
				return type(v) == "string"
			end

			expect(List.every(array, isString)).toEqual(true)

			local list = List.new(array)
			expect(list.every(isString)).toEqual(true)
		end)

		it("some", function()
			local array = { "a", "b", "c" }
			local isB = function(v)
				return v == "b"
			end

			expect(List.some(array, isB)).toEqual(true)

			local list = List.new(array)
			expect(list.some(isB)).toEqual(true)
		end)

		it("find", function()
			local array = { "a", "B", "c" }
			local findCapital = function(v)
				return v == string.upper(v)
			end

			expect(List.find(array, findCapital)).toEqual("B")

			local list = List.new(array)
			expect(list.find(findCapital)).toEqual("B")
		end)

		it("findKey", function()
			local dictionary = { "a", 100, "c" }
			local findNumber = function(v)
				return type(v) == "number"
			end

			expect(List.findKey(dictionary, findNumber)).toEqual(2)

			local list = List.new(dictionary)
			expect(list.findKey(findNumber)).toEqual(2)
		end)

		it("findEntry", function()
			local array = { "a", "B", "c" }
			local findCapital = function(v)
				return v == string.upper(v)
			end

			expect(List.findEntry(array, findCapital)).toEqual({ 2, "B" })

			local list = List.new(array)
			expect(list.findEntry(findCapital)).toEqual({ 2, "B" })
		end)

		it("max", function()
			local array = { 10, 50, -100, 100, 50 }

			expect(List.max(array)).toEqual(100)

			local list = List.new(array)
			expect(list.max()).toEqual(100)
		end)

		it("min", function()
			local array = { 10, 50, -100, 100, 50 }

			expect(List.min(array)).toEqual(-100)

			local list = List.new(array)
			expect(list.min()).toEqual(-100)
		end)

		it("flatten", function()
			local array = {
				"foo",
				{
					"bar",
					"baz",
				},
				{
					"bar",
					"baz",
				},
				"quz",
			}
			local expected = { "foo", "bar", "baz", "bar", "baz", "quz" }

			expect(List.flatten(array)).toEqual(expected)

			local list = List(array)
			expect(list.flatten().toLuau()).toEqual(expected)
		end)
	end)
end
