local mouseCheck = {}

--0 is nothing
--1 is on flower
--2 is in gui
local state = 0
local mousePos
local stored = 0
local stored_id

function mouseCheck.changePos(pos)
	mousePos = pos
end

function mouseCheck.getPos()
	return mousePos
end

function mouseCheck.changeState(s)
	if (state ~= 2) and s > state then
		state = s
	end
end

function mouseCheck.reset()
	if (state <= 1) then
		state = 0
	end
end

function mouseCheck.escapeGui()
	state = 0
end

function mouseCheck.getState()
	return state
end

function mouseCheck.store(id, url)
	stored = id
	stored_id = url
end

function mouseCheck.getStored()
	return {stored, stored_id}
end

local miscState = 0

function mouseCheck.changeMisc(s)
	miscState = s
end

function mouseCheck.getMisc()
	return miscState
end

return mouseCheck