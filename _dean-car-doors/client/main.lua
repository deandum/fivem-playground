-- Functions

-- function to check if a given entity is a valid vehicle
local function ValidateVehicleEntity(vehicle)
    -- TODO: Future QoL - Check if car is moving and/or if it is driven by someone else
    return vehicle and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle)
end

-- function to handle the doors when the player is in the car
local function HandlePlayerInCar()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if ValidateVehicleEntity(currentVehicle) then
        local vehicleNetID = NetworkGetNetworkIdFromEntity(currentVehicle)

        if GetPedInVehicleSeat(currentVehicle, Config.SEATS.DRIVER) == PlayerPedId() then
            TriggerServerEvent("_dean-car-doors:server:handleVehicleDoor", PlayerPedId(), vehicleNetID, Config.DRIVER)
        elseif GetPedInVehicleSeat(currentVehicle, Config.SEATS.PASSANGER) == PlayerPedId() then
            TriggerServerEvent("_dean-car-doors:server:handleVehicleDoor", PlayerPedId(), vehicleNetID, Config.PASSANGER)
        elseif GetPedInVehicleSeat(currentVehicle, Config.SEATS.BACK_LEFT) == PlayerPedId() then
            TriggerServerEvent("_dean-car-doors:server:handleVehicleDoor", PlayerPedId(), vehicleNetID, Config.BACK_LEFT)
        elseif GetPedInVehicleSeat(currentVehicle, Config.SEATS.BACK_RIGHT) == PlayerPedId() then
            TriggerServerEvent("_dean-car-doors:server:handleVehicleDoor", PlayerPedId(), vehicleNetID, Config.BACK_RIGHT)
        end
    end
end

-- function to handle the doros when the player is next to a random car and not inside it
local function HandlePlayerNextToCar()
    local pedCoords = GetEntityCoords(PlayerPedId())
    local closestVehicle = GetClosestVehicle(pedCoords.x, pedCoords.y, pedCoords.z, 5.0, 0, 70)
    local distanceMap = {}

    -- helper function to add an element to a table
    local addToDistanceMap = function (targetPosition, coords)
        distanceMap[#distanceMap+1] = {
            position = targetPosition,
            distance = GetDistanceBetweenCoords(coords, pedCoords, 1)
        }
    end

    -- helpeer fuction to get the closest door to the player
    local getClosestDoorTargets = function ()
        local targetDoor = nil
        local minDistance = Config.MAX_DISTANCE_FROM_POSITION

        if next(distanceMap) then
            for k, target in pairs(distanceMap) do
                if distanceMap[k] then
                    if target.distance < minDistance then
                        targetDoor = target.position
                        minDistance =  target.distance
                    end
                end
            end
        end

        return targetDoor
    end

    if ValidateVehicleEntity(closestVehicle) then
        local vehicleNetID = NetworkGetNetworkIdFromEntity(closestVehicle)

        if not next(Config.DOORS) then
            return
        end

        for key, door in pairs(Config.DOORS) do
            if DoesVehicleHaveDoor(closestVehicle, door.ID) then
                local bonePosition = GetWorldPositionOfEntityBone(closestVehicle, GetEntityBoneIndexByName(closestVehicle, door.bone))
                -- note: the closest door could also be calculated in line instead of using a map
                addToDistanceMap(key, bonePosition)
            end
        end

        local targetDoor = getClosestDoorTargets()
        if targetDoor then
            TriggerServerEvent("_dean-car-doors:server:handleVehicleDoor", PlayerPedId(), vehicleNetID, targetDoor)
        end
    end
end


-- Commands

RegisterCommand("carDoor", function(source, args, rawCommand)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) == 1 then
        HandlePlayerInCar()
    else
        HandlePlayerNextToCar()
    end
end, false) -- anyone can use this command


-- Events

RegisterNetEvent("_dean-car-doors:client:handleVehicleDoor", function(vehicleID, door)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleID)
    if not ValidateVehicleEntity(vehicle) then
        return
    end

    local doorID = Config.DOORS[door].ID
    if not DoesVehicleHaveDoor(vehicle, doorID) then
        return
    end

    local doorClosed = true
    if GetVehicleDoorAngleRatio(vehicle, doorID) > 0.0 then
        doorClosed = false
    end

    if doorClosed then
        SetVehicleDoorOpen(vehicle, doorID, false, false)
    else
        SetVehicleDoorShut(vehicle, doorID, false)
    end
end)
