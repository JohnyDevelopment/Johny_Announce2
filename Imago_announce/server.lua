ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local webhook = ""

RegisterNetEvent("Imago_announce:send")
AddEventHandler('Imago_announce:send', function(text)
    local gracz = source
    local xPlayer = ESX.GetPlayerFromId(gracz)
	if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod' or xPlayer.group == 'support' or xPlayer.group == 'trialsupport') then
        TriggerClientEvent('chatMessage', -1, "[Ogloszenie]", {255, 0, 0}, text)
        local name = GetPlayerName(source)
        local steamhex = GetPlayerIdentifier(source)
        local logpodwysylanie = {
            {
                ["color"] = "00000000",
                ["title"] = "Administrator Napisał Ogłoszenie",
                ["description"] = "Administrator: **"..name.."**\n Steam Hex: **"..steamhex.."**\n Treść: **"..text.."**",
                ["footer"] = {
                    ["text"] = "Imago Announce",
                        --["icon_url"] = ,
                },
            }
        }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Imago Announce",embeds = logpodwysylanie}), { ['Content-Type'] = 'application/json' })
    else
        xPlayer.showNotification('~r~Nie posiadasz permisji')
    end
end)
