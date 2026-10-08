local seasons = {}

--1 - 4 in top-bottom order

local weatherTable = {
	{
		{{.1, 1}, {.15, 2}, {.15, 3}, {.15, 4}, {.15, 5}, {.1, 6}, {.15, 7}, {.05, 10}}, 
		{{.15, 1}, {.15, 2}, {.15, 3}, {.15, 4}, {.2, 5}, {.1, 6}, {.1, 10}},
		{{.2, 1}, {.15, 2}, {.15, 3}, {.15, 4}, {.2, 5}, {.1, 6}, {.05, 10}}
	},
	{
		{{.3, 1}, {.1, 2}, {.1, 3}, {.05, 4}, {.15, 5}, {.15, 6}, {.05, 10}}, 
		{{.4, 1}, {.1, 2}, {.1, 3}, {.2, 5}, {.2, 6}},
		{{.4, 1}, {.1, 2}, {.1, 3}, {.2, 5}, {.2, 6}}
	},
	{
		{{.2, 1}, {.3, 2}, {.3, 3}, {.1, 4}, {.1, 5}},
		{{.2, 1}, {.3, 2}, {.3, 3}, {.1, 4}, {.1, 5}},
		{{.2, 1}, {.3, 2}, {.3, 3}, {.05, 4}, {.05, 5}, {.1, 7}}
	},
	{
		{{.4, 7}, {.4, 8}, {.2, 9}},
		{{.6, 8}, {.4, 9}},
		{{.4, 7}, {.4, 8}, {.2, 9}}
	}
}

local season = 1
local seasonCycle = 1
local weather = 1
local time = 0

local changeTime = 3600

function seasons.getWeather()
	return weather
end

function seasons.getSeason()
	return season
end

function seasons.weatherChange()
	local x = math.random()
	for i, v in ipairs(weatherTable[season][seasonCycle]) do
		x = x - v[1]
		if x <= 0 then
			weather = v[2]
			break
		end	
	end
end

function seasons.seasonChange()
	season = season + 1
	if season == 5 then
		season = 1
	end
end

function seasons.cycle()
	seasonCycle = seasonCycle + 1
	if seasonCycle == 4 then
		seasons.seasonChange()
		seasonCycle = 1
	end
	seasons.weatherChange()
end

function seasons.preset(t)
	season = t[1]
	seasonCycle = t[2]
	weather = t[3]
	time = t[4]
end

function seasons.getPreset()
	return {season, seasonCycle, weather, time}
end

function seasons.getTime()
	return time, seasonCycle
end

function seasons.updateTime(t)
	time = t
end

function seasons.addTime(dt)
	time = time + dt
	if time >= changeTime then
		local temp = math.floor(time / changeTime)
		time = time % changeTime
		for i = 1, temp do
			seasons.cycle()
		end
	end
end

return seasons