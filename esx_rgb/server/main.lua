--BY BNJ-- 𝑯𝒐𝒎𝒎𝒆-𝒆𝒇𝒇𝒊𝒄𝒂𝒔𝒆
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('swiatelka:getItemAmount', function(source, cb, item)

    local xPlayer = ESX.GetPlayerFromId(source)

    local qtty = xPlayer.getInventoryItem(item).count

    cb(qtty)

end)

