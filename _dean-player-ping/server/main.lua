-- Events

RegisterNetEvent("_dean-player-ping:server:getPlayerPing", function(playerID)
    local ping = GetPlayerPing(source)
    print("Player " .. playerID .. " has ping: " .. ping)
    TriggerClientEvent("_dean-player-ping:client:displayPlayerPing", source, ping)
end)