
local ox_inventory = exports.ox_inventory

RegisterServerEvent('farmour:removeItem')
AddEventHandler('farmour:removeItem', function(item, count, metadata, slot)
    exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
end)
