-- Wandelt Zahl von command line uin String um
local number_ = arg[1]
local number = tostring(number_)
--print(type(number))

-- Zähler und zu sortierender table
local count = 1
local sort_table = {}

-- Fügt den char an Indexposition als eigenes Element dem table hinzu
for i = 1, #number do
	table.insert(sort_table, string.sub(number, i, i))
	--print(string.sub(number, i, i))
	count = count + 1
end


--#region quicksort
--local function confirm_sort(tbl)
--	local sorted = true
--	local i = 1
--	local cap = #tbl - 1
--
--	while not sorted and (i <= cap) do
--		sorted = (tbl[i] <= tbl[i + 1])
--		i = i + 1
--	end
--
--	return sorted
--end

local function table_concat(t1, t2)
	local res = {}

	for i = 1, #t1 do
		res[#res + 1] = t1[i]
	end

	for i = 1, #t2 do
		res[#res + 1] = t2[i]
	end

	return res
end

local function sort(tbl)
	if #tbl <= 1 then
		return tbl
	end

	local i = 0
	local pivot = tbl[#tbl] -- letzter char als pivot-Element

	for j = 1, (#tbl - 1) do
		if tbl[j] < pivot then
			i = i + 1
			local temp = tbl[i]
			tbl[i] = tbl[j]
			tbl[j] = temp
		end
	end

	local temp = tbl[i + 1]
	tbl[i + 1] = pivot
	tbl[#tbl] = temp

	local left_part = {}
	local right_aprt = {}

	for k = 1, i do
		left_part[k] = tbl[k]
	end

	for k = i + 2, #tbl do
		right_aprt[#right_aprt + 1] = tbl[k]
	end

	local sorted_left = sort(left_part)
	local sorted_right = sort(right_aprt)

	local res = table_concat(sorted_left, {tbl[i + 1]})
	res = table_concat(res, sorted_right)

	return res
end


print("Unsorted:\t" .. table.concat(sort_table, ", "))
local sorted_list = sort(sort_table)
print("Sorted:\t\t" .. table.concat(sorted_list, ", "))
--#endregion quicksort
