HostilePeds = {}

local hideoutSafeZone = BoxZone:Create(vector3(1700.02, -1605.17, 120.86), 60, 50, {
	name = "hideoutSafeZone",
	heading = "100",
	useZ = false,
	debugPoly = true
})

local hostileArea = PolyZone:Create({
    vector2(1460.52, -1508.14),
    vector2(1461.77, -1477.52),
    vector2(1436.4, -1454.04),
    vector2(1378.32, -1470.82),
    vector2(1302.11, -1502.39),
    vector2(1288.05, -1525.35),
    vector2(1332.55, -1604.73),
}, {
    name="hostileArea",
	useZ = false,
    debugGrid=true,
    gridDivisions=30,
})




-- CreateThread(function ()

-- 	local createDrop = true

-- 	while true do
-- 		local sleep = 1000
-- 		if LocalPlayer.state.isLoggedIn then
-- 			sleep = 5

-- 			if #HostilePeds > 0 then
-- 				for i = 1, #HostilePeds do
-- 					local hostile = HostilePeds[i]

-- 					if IsPedDeadOrDying(hostile) == 1 then
-- 						if createDrop then
-- 							createDrop = false
-- 							local dropCoords = GetEntityCoords(hostile)
-- 							print("Client drop coords " .. dropCoords)
-- 							TriggerServerEvent("inventory:server:SetInventoryData", "hostilePED", nil, nil, nil, nil, nil, dropCoords)
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end

-- 		Wait(sleep)
-- 	end
-- end)