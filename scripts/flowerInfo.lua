local flowerInfo = {}
local conversionTable = {}
local unlockedTable = {}
local infoTable = {}
local id = 1;

local seasons = require("scripts.seasons")

local gardenTable = {}

local savefile = sys.get_save_file("Botanica", "savefile1")

function flowerInfo.save()
	local temp = {}
	for i, t in ipairs(gardenTable) do
		table.insert(temp, {t[1], t[2], t[3]})
	end
	sys.save(savefile, {unlocked = unlockedTable, garden = temp, season = seasons.getPreset(), time = os.time()})
end

local function convert()
	for i, v in pairs(infoTable) do
		conversionTable[v[4]] = i
	end
	pprint(conversionTable)
end

function flowerInfo.sort()
	table.sort(infoTable, function(a, b)
		return a[1] < b[1]
	end)
	convert()
end

function flowerInfo.start()
	local temp = sys.load(savefile)

	unlockedTable = temp.unlocked or {}
	gardenTable = temp.garden or {}
	greenhouseTable = temp.greenhouse or {}
	seasons.preset(temp.season or {1, 1, 1, 0})
	local doubletemp = temp.time or os.time()
	seasons.updateTime(os.time() - doubletemp)
	unlockedTable[1] = 2
	unlockedTable[2] = 2
	unlockedTable[8] = 2
	for i, v in ipairs(unlockedTable) do
		unlockedTable[i] = 2
	end
end

function flowerInfo.create(name, species, desc, conditionals)
	local flower = {name, species, desc, id, conditionals}
	if name ~= nil then
		table.insert(infoTable, flower)
		unlockedTable[id] = unlockedTable[id] or 0
		if unlockedTable[id] == true then
			unlockedTable[id] = 2
		elseif unlockedTable[id] == false then
			unlockedTable[id] = 0
		end
		id = id + 1
	end
end

function flowerInfo.getSize()
	return #infoTable
end

function flowerInfo.ID(pageNum)
	local flower = infoTable[pageNum]
	return {flower, unlockedTable[flower[4]]}
end

function flowerInfo.pageNum(id)
	return conversionTable[id]
end

function flowerInfo.inProgress(idNum)
	if unlockedTable[idNum] == 0 then
		unlockedTable[idNum] = 1
	end
end

function flowerInfo.unlock(idNum)
	unlockedTable[idNum] = 2
end

function flowerInfo.unlockTable()
	local temp = {}
	for i, p in ipairs(unlockedTable) do
		if p == 2 then
			table.insert(temp, i)
		end
	end
	return temp
end

function flowerInfo.getAllSeasonWeather(ceasr, weat)
	local temp = {}
	for b, p in ipairs(unlockedTable) do
		if p == 2 then
			local hell = infoTable[b][5]
			for i = 2, #hell, 1 do
				if tonumber(hell[i]) == ceasr or tonumber(hell[i]) == weat then
					table.insert(temp, infoTable[b])
				end
			end
		end
	end
	return temp
end

function flowerInfo.findNextUnlock(start, up)
	local i = start
	local temp = false
	if i == 0 then 
		return 1
	end
	if up == 1 then
		i = i + 1
		while not (unlockedTable[infoTable[i][4]] >= 1) do
			i = i + 1
			if i == #infoTable then
				return 0
			end
		end
		return math.abs(i - start)
	else
		i = i - 1
		if i == 0 then
			return 0
		end
		while not (unlockedTable[infoTable[i][4]] >= 1) do
			i = i - 1
			if i == 0 then
				return 0
			end
		end
		return math.abs(i - start)
	end
end

function flowerInfo.combine(id1, id2)
	if (id1 + id2) <= 8 then
		return infoTable[id1 + id2]
	else
		return infoTable[math.abs(id1 - id2)]
	end
end

function flowerInfo.insertGarden(f)
	table.insert(gardenTable, f)
end

function flowerInfo.removeGarden(i)
	table.remove(gardenTable, i)
end

function flowerInfo.sendGarden()
	return gardenTable
end

function flowerInfo.insertGreenhouse(f)
	table.insert(greenhouseTable, f)
end

function flowerInfo.removeGreenhouse(i)
	table.remove(greenhouseTable, i)
end

function flowerInfo.sendGreenhouse()
	return greenhouseTable
end


return flowerInfo