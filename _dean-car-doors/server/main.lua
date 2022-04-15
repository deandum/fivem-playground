-- Events

RegisterNetEvent('_dean-car-doors:server:handleVehicleDoor', function(source, vehicleID, doorIndex)
    TriggerClientEvent('_dean-car-doors:client:handleVehicleDoor', -1, vehicleID, doorIndex) -- -1 to trigger the event for all clients
end)