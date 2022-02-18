local QBCore = exports['qb-core']:GetCoreObject()
local inHideout = false

local function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function OpenHideoutAnim()
    LoadAnimDict("anim@heists@keycard@")
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(400)
    ClearPedTasks(PlayerPedId())
end

local function EnterHideout()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    OpenHideoutAnim()
    Wait(250)

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end

    local insideLoc = Hideouts.Locations["default"].coords.inside
    SetEntityCoords(PlayerPedId(), insideLoc.x, insideLoc.y, insideLoc.z, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), insideLoc.w)
    inHideout = true

    Wait(100)
    DoScreenFadeIn(1000)
end

local function ExitHideout()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    OpenHideoutAnim()
    Wait(250)

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end

    local outsideLoc = Hideouts.Locations["default"].coords.outside
    SetEntityCoords(PlayerPedId(), outsideLoc.x, outsideLoc.y, outsideLoc.z, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), outsideLoc.w)
    inHideout = false

    Wait(100)
    DoScreenFadeIn(1000)
end

local function ChangeOutfit()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Clothes1", 0.4)
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('dz-survival-hideout:client:EnterHideout', function()
   EnterHideout()
end)

RegisterNetEvent('dz-survival-hideout:client:ExitHideout', function()
    ExitHideout()
 end)

 RegisterNetEvent('hideouts:client:ChangeOutfit', function()
    ChangeOutfit()
end)

CreateThread(function ()
    local shownHeader = false

    while true do
        local sleep = 1000

        if LocalPlayer.state.isLoggedIn then
            sleep = 5

            if inHideout then
                local headerMenu = {}
                local inRange = false
                local pos = GetEntityCoords(PlayerPedId())
                local exitLoc = Hideouts.Locations["default"].coords.exit
                local exit = #(pos - exitLoc)
                if exit <= 1 then
                    inRange = true
                    headerMenu[#headerMenu+1] = {
                        header = "Exit Hideout",
                        params = {
                            event = 'dz-survival-hideout:client:ExitHideout',
                            args = {}
                        }
                    }
                end
                

                local stashLoc = Hideouts.Locations["default"].coords.stash
                local stash = #(pos - stashLoc)
                if stash <= 1.2 then
                    inRange = true
                    headerMenu[#headerMenu+1] = {
                        header = "Open Stash",
                        params = {
                            event = '',
                            args = {}
                        }
                    }
                elseif stash <= 3 then
                    local x = stashLoc.x
                    local y = stashLoc.y
                    local z = stashLoc.z - 0.5
                    DrawMarker(2, x, y, z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                end

                local outfitsLoc = Hideouts.Locations["default"].coords.outfits
                local outfits = #(pos - outfitsLoc)
                if outfits <= 1.2 then
                    inRange = true
                    headerMenu[#headerMenu+1] = {
                        header = "Change Outfits",
                        params = {
                            event = 'hideouts:client:ChangeOutfit',
                            args = {}
                        }
                    }
                elseif outfits <= 3 then
                    local x = outfitsLoc.x
                    local y = outfitsLoc.y
                    local z = outfitsLoc.z - 0.5
                    DrawMarker(2, x, y, z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                end

                if inRange and not shownHeader then
                    shownHeader = true
                    exports['qb-menu']:showHeader(headerMenu)
                end
                if not inRange and shownHeader then
                    shownHeader = false
                    exports['qb-menu']:closeMenu()
                end
            else
                local headerMenu = {}
                local inRange = false
                local pos = GetEntityCoords(PlayerPedId())
                local entranceLoc = Hideouts.Locations["default"].coords.entrance
                local entrance = #(pos - entranceLoc)
                
                if entrance <= 1 then
                    inRange = true
                    headerMenu[#headerMenu+1] = {
                        header = "Enter Hideout (Safezone)",
                        params = {
                            event = 'dz-survival-hideout:client:EnterHideout',
                            args = {}
                        }
                    }
                end

                if inRange and not shownHeader then
                    shownHeader = true
                    exports['qb-menu']:showHeader(headerMenu)
                end

                if not inRange and shownHeader then
                    shownHeader = false
                    exports['qb-menu']:closeMenu()
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function ()
    for _, dealer in pairs(Hideouts.Dealers) do
        local coords = dealer.coords
        local model = dealer.model

        if not HasModelLoaded(model) then
            RequestModel(model)
            repeat Wait(0) until HasModelLoaded(model)
        end

        if not dealer.isSpawned then
            local dealerPed = CreatePed(4, model, coords.x, coords.y, coords.z, coords.w, false, true)
            PlaceObjectOnGroundProperly(dealerPed)
            SetEntityCanBeDamaged(dealerPed, false)
            SetEntityInvincible(dealerPed, true)
            SetBlockingOfNonTemporaryEvents(dealerPed, true)
            SetPedCanRagdollFromPlayerImpact(dealerPed, false)
            TaskStartScenarioInPlace(dealerPed, dealer.animation, 0, true)
            dealer.isSpawned = true
        end
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 2000
        if LocalPlayer.state.isLoggedIn then
            local pos = GetEntityCoords(PlayerPedId())
            for _, dealer in pairs(Hideouts.Dealers) do
                if dealer.isSpawned then
                    local dealerPos = vector3(dealer.coords.x, dealer.coords.y, dealer.coords.z)
                    if #(pos - dealerPos) < 4.5 then
                        sleep = 5
                        if #(pos - dealerPos) < 1.5 then
                            sleep = 0
                            DrawText3D(dealerPos.x, dealerPos.y, dealerPos.z, "[~g~E~s~] See Inventory")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", dealer.shop)
                            end
                        elseif #(pos - dealerPos) < 15 then
                            DrawText3D(dealerPos.x, dealerPos.y, dealerPos.z, dealer.label)
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

