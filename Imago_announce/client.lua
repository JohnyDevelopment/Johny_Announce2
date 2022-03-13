ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)
RegisterCommand('ogloszenie', function(source, args)
    local text = table.concat(args, " ")
    print("Announce "..text)
    TriggerServerEvent("Imago_announce:send", text)
end)