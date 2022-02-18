local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

local PlayerData = {}
local clientHostiles = {}


local function removeDefaultNPCs()
	-- disable all NPCs by default
	DisableVehicleDistantlights(true)
	SetPedPopulationBudget(0)
	SetVehiclePopulationBudget(0)
	SetRandomEventFlag(false)
	
	for _, scenario in pairs(NPCScenarios) do
		SetScenarioTypeEnabled(scenario, false)
	end

	-- set default NPC relationship to aggresive so everyone attacks players
	local relationshipHate = NPCRelationships.Hate.value
	local relationshipDisplike = NPCRelationships.Dislike.value

	for _, group in ipairs(NPCGroups) do
		SetRelationshipBetweenGroups(relationshipHate, GetHashKey('PLAYER'), GetHashKey(group)) -- could be removed
		SetRelationshipBetweenGroups(relationshipHate, GetHashKey(group), GetHashKey('PLAYER'))
	end

	for _, group in ipairs(NPCPeds) do
		SetRelationshipBetweenGroups(relationshipDisplike, GetHashKey('PLAYER'), GetHashKey(group)) -- could be removed
		SetRelationshipBetweenGroups(relationshipDisplike, GetHashKey(group), GetHashKey('PLAYER'))
	end
end


-- events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
	removeDefaultNPCs()

	if not HasModelLoaded(HostilesModel) then
		RequestModel(HostilesModel)
		repeat Wait(0) until HasModelLoaded(HostilesModel)
	end

	-- TODO: Remove this from here and spawn the npcs on the server side
	TriggerServerEvent("dz-survival-npc:server:ReloadHostileNPCs")
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    clientHostiles = {}
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)
