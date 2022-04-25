--!nocheck
local Freeze = require(script.Parent.Parent)
local Map = Freeze.Map
local None = Freeze.None

return function()
	describe("should work with functional and chained styles", function()
		it("set", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "A", b = "test", c = "C" }

			local map = Map.new(dictionary)
			expect(map.set("b", "test").toLuau()).toEqual(expected)

			expect(Map.set(dictionary, "b", "test")).toEqual(expected)
		end)

		it("remove", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "A", c = "C" }

			local map = Map.new(dictionary)
			expect(map.remove("b").toLuau()).toEqual(expected)

			expect(Map.remove(dictionary, "b")).toEqual(expected)
		end)

		it("merge", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "A", b = "B", d = "D" }

			local map = Map.new(dictionary)
			expect(map.merge({ c = None, d = "D" }).toLuau()).toEqual(expected)

			expect(Map.merge(dictionary, { c = None, d = "D" })).toEqual(expected)

			expect(Map.join(dictionary, { c = None, d = "D" })).toEqual(expected)
		end)

		it("map", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "a", b = "b", c = "c" }

			local map = Map.new(dictionary)
			expect(map.map(string.lower).toLuau()).toEqual(expected)

			expect(Map.map(dictionary, string.lower)).toEqual(expected)
		end)

		it("mapKeys", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { A = "A", B = "B", C = "C" }

			local map = Map.new(dictionary)
			expect(map.mapKeys(string.upper).toLuau()).toEqual(expected)

			expect(Map.mapKeys(dictionary, string.upper)).toEqual(expected)
		end)

		it("mapEntries", function()
			local dictionary = { a = 1, b = 2 }
			local expected = { A = 2, B = 4 }

			local function mapper(entry)
				return { string.upper(entry[1]), entry[2] * 2 }
			end

			local map = Map.new(dictionary)
			expect(map.mapEntries(mapper).toLuau()).toEqual(expected)

			expect(Map.mapEntries(dictionary, mapper)).toEqual(expected)
		end)

		it("get", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			local map = Map.new(dictionary)
			expect(map.get("d", "etc")).toEqual("etc")

			expect(Map.get(dictionary, "d", "etc")).toEqual("etc")
		end)

		it("count", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			local map = Map.new(dictionary)
			expect(map.count()).toEqual(3)

			expect(Map.count(dictionary)).toEqual(3)
		end)

		it("has", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			local map = Map.new(dictionary)
			expect(map.has("b")).toEqual(true)

			expect(Map.has(dictionary, "b")).toEqual(true)
		end)

		it("filter", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			local map = Map.new(dictionary)
			expect(map.filter(function(value)
				return value == "B"
			end).toLuau()).toEqual({ b = "B" })

			expect(Map.filter(dictionary, function(value)
				return value == "B"
			end)).toEqual({ b = "B" })
		end)

		it("filterNot", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			local map = Map.new(dictionary)
			expect(map.filterNot(function(value)
				return value == "B"
			end).toLuau()).toEqual({ a = "A", c = "C" })

			expect(Map.filterNot(dictionary, function(value)
				return value == "B"
			end)).toEqual({ a = "A", c = "C" })
		end)

		it("flip", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { A = "a", B = "b", C = "c" }

			local map = Map.new(dictionary)
			expect(map.flip().toLuau()).toEqual(expected)

			expect(Map.flip(dictionary)).toEqual(expected)
		end)

		it("keys", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { "a", "c", "b" } -- brittle

			local map = Map.new(dictionary)
			expect(map.keys().toLuau()).toEqual(expected)

			expect(Map.keys(dictionary)).toEqual(expected)
		end)

		it("values", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { "A", "C", "B" } -- brittle

			local map = Map.new(dictionary)
			expect(map.values().toLuau()).toEqual(expected)

			expect(Map.values(dictionary)).toEqual(expected)
		end)

		it("entries", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { { "a", "A" }, { "c", "C" }, { "b", "B" } } -- brittle

			local map = Map.new(dictionary)
			expect(map.entries().toLuau()).toEqual(expected)

			expect(Map.entries(dictionary)).toEqual(expected)
		end)

		it("toList", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { "A", "C", "B" } -- brittle

			local map = Map.new(dictionary)
			expect(map.toList().toLuau()).toEqual(expected)

			expect(Map.toList(dictionary).toLuau()).toEqual(expected)
		end)

		it("mergeIn", function()
			local avengers = {
				heroes = {
					ironMan = {
						name = "Tony Stark",
					},
					captainAmerica = {
						name = "Steve Rogers",
					},
				},
			}

			local mergingAvengers = {
				partner = {
					realName = "Pepper Potts",
					heroName = "hera",
				},
			}

			local expected = {
				heroes = {
					ironMan = {
						name = "Tony Stark",
						partner = {
							heroName = "hera",
							realName = "Pepper Potts",
						},
					},
					captainAmerica = {
						name = "Steve Rogers",
					},
				},
			}
			expect(Map.mergeIn(avengers, { "heroes", "ironMan" }, mergingAvengers)).toEqual(expected)

			local map = Map.new(avengers)
			expect(map.mergeIn({ "heroes", "ironMan" }, mergingAvengers).toLuau()).toEqual(expected)
		end)

		it("equals", function()
			local dictionary = { a = { "A" }, b = { "B" }, c = { "C" } }
			local other = { a = { "A" }, b = { "B" }, c = { "C" } }
			local other2 = { a = {}, b = {}, c = {} }

			expect(Map.equals(dictionary, other)).toBe(true)
			expect(Map.equals(dictionary, other2)).toBe(false)

			local map = Map.new(dictionary)
			expect(map.equals(other)).toBe(true)
			expect(map.equals(other2)).toBe(false)
		end)

		it("joinAsString", function()
			local dictionary = { a = 10, b = 100 }

			expect(Map.joinAsString(dictionary, "|")).toEqual("a=10|b=100")

			local map = Map(dictionary)
			expect(map.joinAsString("|")).toEqual("a=10|b=100")
		end)

		it("includes", function()
			local dictionary = { a = "A", b = "B", c = "C" }

			expect(Map.includes(dictionary, "A")).toEqual(true)

			local map = Map.new(dictionary)
			expect(map.includes("A")).toEqual(true)
		end)

		it("isEmpty", function()
			local dictionary = {}

			expect(Map.isEmpty(dictionary)).toEqual(true)

			local map = Map.new(dictionary)
			expect(map.isEmpty()).toEqual(true)
		end)

		it("every", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local isString = function(v)
				return type(v) == "string"
			end

			expect(Map.every(dictionary, isString)).toEqual(true)

			local map = Map.new(dictionary)
			expect(map.every(isString)).toEqual(true)
		end)

		it("some", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local isB = function(v)
				return v == "B"
			end

			expect(Map.some(dictionary, isB)).toEqual(true)

			local map = Map.new(dictionary)
			expect(map.some(isB)).toEqual(true)
		end)

		it("find", function()
			local dictionary = { a = "A", b = "b", c = "C" }
			local findKeyValueMatch = function(v, k)
				return v == k
			end

			expect(Map.find(dictionary, findKeyValueMatch)).toEqual("b")

			local map = Map.new(dictionary)
			expect(map.find(findKeyValueMatch)).toEqual("b")
		end)

		it("findKey", function()
			local dictionary = { a = "A", b = 100, c = "C" }
			local findNumber = function(v)
				return type(v) == "number"
			end

			expect(Map.findKey(dictionary, findNumber)).toEqual("b")

			local map = Map.new(dictionary)
			expect(map.findKey(findNumber)).toEqual("b")
		end)

		it("findEntry", function()
			local dictionary = { a = "A", b = "b", c = "C" }
			local findKeyValueMatch = function(v, k)
				return v == k
			end

			expect(Map.findEntry(dictionary, findKeyValueMatch)).toEqual({ "b", "b" })

			local map = Map.new(dictionary)
			expect(map.findEntry(findKeyValueMatch)).toEqual({ "b", "b" })
		end)

		it("max", function()
			local dictionary = { a = 10, b = -100, c = 100, d = -50 }

			expect(Map.max(dictionary)).toEqual(100)

			local map = Map.new(dictionary)
			expect(map.max()).toEqual(100)
		end)

		it("min", function()
			local dictionary = { a = 10, b = -100, c = 100, d = -50 }

			expect(Map.min(dictionary)).toEqual(-100)

			local map = Map.new(dictionary)
			expect(map.min()).toEqual(-100)
		end)

		it("update", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "A", b = "b", c = "C" }

			expect(Map.update(dictionary, "b", string.lower)).toEqual(expected)

			local map = Map.new(dictionary)
			expect(map.update("b", string.lower).toLuau()).toEqual(expected)
		end)

		it("setIn", function()
			local dictionary = { a = { b = { c = "d" } } }
			local expected = { a = { b = { c = "etc" } } }

			expect(Map.setIn(dictionary, { "a", "b", "c" }, "etc")).toEqual(expected)

			local map = Map.new(dictionary)
			expect(map.setIn({ "a", "b", "c" }, "etc").toLuau()).toEqual(expected)
		end)

		it("updateIn", function()
			local dictionary = { a = { b = { c = "d" } } }
			local expected = { a = { b = { c = "D" } } }

			expect(Map.updateIn(dictionary, { "a", "b", "c" }, string.upper)).toEqual(expected)

			local map = Map.new(dictionary)
			expect(map.updateIn({ "a", "b", "c" }, string.upper).toLuau()).toEqual(expected)
		end)

		it("removeIn", function()
			local dictionary = { a = { b = { c = "d" } } }
			local expected = { a = {} }

			expect(Map.removeIn(dictionary, { "a", "b" })).toEqual(expected)

			local map = Map(dictionary)
			expect(map.removeIn({ "a", "b" }).toLuau()).toEqual(expected)
		end)

		it("getIn", function()
			local dictionary = { a = { b = { c = "d" } } }
			local expected = "d"

			expect(Map.getIn(dictionary, { "a", "b", "c" })).toEqual(expected)

			local map = Map(dictionary)
			expect(map.getIn({ "a", "b", "c" })).toEqual(expected)
		end)

		it("hasIn", function()
			local dictionary = { a = { b = { c = "d" } } }
			local expected = true

			expect(Map.hasIn(dictionary, { "a", "b", "c" })).toEqual(expected)

			local map = Map(dictionary)
			expect(map.hasIn({ "a", "b", "c" })).toEqual(expected)
		end)

		it("flatten", function()
			local dictionary = {
				foo = 1,
				foobar = {
					bar = 2,
					baz = {
						etc = 3,
					},
				},
			}
			local expected = {
				foo = 1,
				bar = 2,
				etc = 3,
			}

			expect(Map.flatten(dictionary)).toEqual(expected)

			local map = Map(dictionary)
			expect(map.flatten().toLuau()).toEqual(expected)
		end)

		it("removeKey", function()
			local dictionary = { a = "A", b = "B", c = "C" }
			local expected = { a = "A", c = "C" }

			expect(Map.removeKey(dictionary, "b")).toEqual(expected)

			local map = Map(dictionary)
			expect(map.removeKey("b").toLuau()).toEqual(expected)
		end)

		it("removeValue", function()
			local dictionary = { a = "A", b = "B", c = "C", otherB = "B" }
			local expected = { a = "A", c = "C" }

			expect(Map.removeValue(dictionary, "B")).toEqual(expected)

			local map = Map(dictionary)
			expect(map.removeValue("B").toLuau()).toEqual(expected)
		end)
	end)
end
