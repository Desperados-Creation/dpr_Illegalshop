ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dpr_Illegalshop:AchatItem')
AddEventHandler('dpr_Illegalshop:AchatItem', function(Nom, Item, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        xPlayer.addInventoryItem(Item, 1)
        Citizen.Wait(500)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', "Vous venez d\'acheter ~b~1x "..Nom.." ~s~pour ~r~"..Price.."$ ~s~!", 'CHAR_ACTING_UP', 1)
    end
end)
