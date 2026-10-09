local scene = {}

local scenething = 1
-- 1 = garden; 2 = greenhouse

function scene.get()
    return scenething
end

function scene.set(newScene)
    scenething = newScene
end

return scene