ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dpr_Illegalshop:AchatItem')
AddEventHandler('dpr_Illegalshop:AchatItem', function(Nom, Item, Price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        xPlayer.addInventoryItem(Item, 1)
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayer, 1 do 
            local xPlayer = ESX.GetPlayerFromId(xPlayer[i])
            Citizen.Wait(500)
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Supérette', '~o~2~r~4~g~7', "Vous venez d\'acheter ~b~1x "..Nom.." ~s~pour ~r~"..Price.."$ ~s~!", 'CHAR_ACTING_UP', 1)
        end
    end
end)