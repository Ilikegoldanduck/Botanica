local flowerInfo = {}

local infoTable = {}
local id = 1;

function flowerInfo.create(name, species, desc, locked)
	local flower = {name, species, desc, locked, id}
	
	table.insert(infoTable, flower)
end

function flowerInfo.ID(idNum)
	return infoTable[idNum]
end

function flowerInfo.unlock(idNum)
	infoTable[idNum][4] = true
end

function flowerInfo.combine(id1, id2)
	return infoTable[id1 + id2]
end

return flowerInfo