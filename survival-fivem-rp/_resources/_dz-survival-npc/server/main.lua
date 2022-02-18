local QBCore = exports['qb-core']:GetCoreObject()

local hostiles = {}


-- util functions

local function setHostileNPCAttributes(pedEntityID)
    ClearPedTasks(pedEntityID)
    ClearPedSecondaryTask(pedEntityID)
	ClearPedTasksImmediately(pedEntityID)
    TaskReactAndFleePed(pedEntityID, 0)
    SetPedCanRagdoll(pedEntityID, false)
    RemoveAllPedWeapons(pedEntityID)
    GiveWeaponToPed(pedEntityID, GetHashKey(HostilesWeapon), 250, false, true)
    SetCurrentPedWeapon(pedEntityID,  GetHashKey(HostilesWeapon), true)
    SetPedConfigFlag(pedEntityID, 13, false)
    SetPedConfigFlag(pedEntityID, 33, false)
    SetPedConfigFlag(pedEntityID, 44, true)
    SetPedConfigFlag(pedEntityID, 140, false)
    SetPedConfigFlag(pedEntityID, 238, false)
end


-- commands

QBCore.Commands.Add("debugHostileNPCs", "Debug hostile NPCs table", {}, true, function(source, args)
	local src = source

    QBCore.Debug(hostiles, 0)
end)

QBCore.Commands.Add("respawnHostileNPCs", "Respawn hostile NPCs", {}, true, function(source, args)
	local src = source
    TriggerEvent("dz-survival-npc:server:SpawnNewHostileNPCs", src)
end)


-- events

RegisterNetEvent('dz-survival-npc:server:SpawnNewHostileNPCs', function(src)
    if Hostiles and next(Hostiles) then
        for k, v in pairs(Hostiles) do
            if Hostiles[k] then
                local coords = v.spawnCoords
                local pedEntityID = CreatePed(4, HostilesModel, coords.x, coords.y, coords.z, coords.w, true, false)

                hostiles[k] = {
                    pedEntityID = pedEntityID,
                    isInCombat = false,
                    isDead = false,
                    dropCreated = false
                }
                setHostileNPCAttributes(pedEntityID)
            end
        end
    end
end)

RegisterNetEvent('dz-survival-npc:server:ReloadHostileNPCs', function()
    local src = source
    local hasNPCs = false
     
    if hostiles and next(hostiles) then
        for k, v in pairs(hostiles) do
            if hostiles[k] and v.pedEntityID then
                hasNPCs = true
                break
            end
        end
    end

    if not hasNPCs then
        TriggerEvent("dz-survival-npc:server:SpawnNewHostileNPCs", src)
    end
end)

RegisterNetEvent('dz-survival-npc:server:DebugPlayerData', function(playerData)
    local src = source
    QBCore.Debug(playerData, 0)
end)

RegisterNetEvent('dz-survival-npc:server:DeleteDeadHostile', function(pedEntityID)
    SetTimeout(300000, function()
        print('Deleting dead hostile NPC: ' .. pedEntityID)
        DeleteEntity(pedEntityID)
    end)
end)

RegisterNetEvent('dz-survival-npc:server:CreateDeadHostileDrop', function(pedEntityID)
    local dropCoords = GetEntityCoords(pedEntityID)
    if dropCoords then
        TriggerEvent("inventory:server:SetInventoryData", "hostilePED", nil, nil, nil, nil, nil, dropCoords)
    end
end)


-- threads

CreateThread(function ()
    while true do
        if hostiles and next(Hostiles) then
            for k, v in pairs(hostiles) do
                if hostiles[k] and v then
                    local hostileHealth = GetEntityHealth(v.pedEntityID)
                    if hostileHealth == 0 and not v.isDead then
                        v.isDead = true
                    else
                        if v.isDead then
                            if not v.dropCreated then
                                TriggerEvent('dz-survival-npc:server:CreateDeadHostileDrop', v.pedEntityID)
                                v.dropCreated = true
                            end
                            hostiles[k] = nil
                            TriggerEvent('dz-survival-npc:server:DeleteDeadHostile', v.pedEntityID)
                        end
                    end
                end
            end
        end
        Wait(500)
    end
end)
