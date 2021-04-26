local characterLoaded, plyped, entity, playerData = false, nil, nil, nil

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(unload, ready, data)
    if not unload then
        if ready then
            local plyped = PlayerPedId()
            entity = GetEntityCoords(plyped)
            characterLoaded = true
        else
            playerData = data
        end
    else
        playerData = nil
        characterLoaded = false
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(500)
        if characterLoaded then
            local playerPed = PlayerPedId()
            if playerPed ~= plyped then
                plyped = playerPed
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        if characterLoaded then
            entity = GetEntityCoords(plyped)
        end
    end
end)

RegisterCommand("test", function()
    if PlayerData.job.name == "unemployed" then
    TriggerEvent("mbl_dispatch:client:processNotification", "3152", "Yardım!", "Mesaj kontrol ya ananı avradını asdksaskdaajajahahhahaha", "fas fa-heartbeat")
    else
        print("bu komut yarark")
    end
end)

RegisterNetEvent('mbl_dispatch:client:processNotification')
AddEventHandler('mbl_dispatch:client:processNotification', function(code, codeText, message, icon)
    print(code)
    SendNUIMessage({
        action = 'showNotification',
        content = { ['code'] = code, ['codeText'] = codeText, ['message'] = message, ["icon"] = icon}
    })
end)