-- Commands

RegisterCommand("getMyPing", function(source, args, rawCommand)
    TriggerServerEvent("_dean-player-ping:server:getPlayerPing", PlayerPedId())
end, false) -- anyone can use this command


-- Events

-- TODO: Future - could add a small UI Vue app to display a notifiation with the ping value instead
RegisterNetEvent("_dean-player-ping:client:displayPlayerPing", function(ping)
    print("My ping is " .. ping)
end)
