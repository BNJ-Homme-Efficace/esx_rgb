ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('swiatelka:getItemAmount', function(source, cb, item)

    local xPlayer = ESX.GetPlayerFromId(source)

    local qtty = xPlayer.getInventoryItem(item).count

    cb(qtty)

end)

