return function(List, isCollection)
	return function(...)
		local firstList = select(1, ...)
		local wasCollection = isCollection(firstList)
		firstList = if wasCollection then firstList.collection else firstList

		local new = {}
		local argCount = select("#", ...)

		if argCount <= 0 then
			return new
		end

		local minLen = #firstList

		for i = 2, argCount do
			local list = select(i, ...)
			list = if isCollection(list) then list.collection else list

			local len = #list

			if len < minLen then
				minLen = len
			end
		end

		for i = 1, minLen do
			new[i] = {}

			for j = 1, argCount do
				local list = select(j, ...)
				list = if isCollection(list) then list.collection else list

				new[i][j] = list[i]
			end
		end

		return if wasCollection then List(new) else new
	end
end
