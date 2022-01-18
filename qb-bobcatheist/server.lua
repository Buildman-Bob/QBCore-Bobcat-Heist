QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('qb-bobcat:server:getCops', function(source, cb)
	local cops = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                cops = cops + 1
            end
        end
	end
	cb(cops)
end)

RegisterServerEvent("qb-particleserver")
AddEventHandler("qb-particleserver", function(method)
    TriggerClientEvent("qb-ptfxparticle", -1, method)
end)

RegisterServerEvent("qb-particleserversec")
AddEventHandler("qb-particleserversec", function(method)
    TriggerClientEvent("qb-ptfxparticlesec", -1, method)
end)


QBCore.Functions.CreateUseableItem("security_card_01", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent("qb-bobcatthirddoor", source)
		TriggerClientEvent('QBCore:Notify', source, "Door Unlocked.", "success")
end)

QBCore.Functions.CreateUseableItem("thermitec", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("qb-seconddoor", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You are missing something to light the thermite..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("thermite", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("qb-firstdoor", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You are missing something to light the thermite..", "error")
    end
end)


local ItemTable = {
    "weapon_combatpistol",
    "weapon_assaultrifle",
    "weapon_smg",
    "weapon_heavypistol",
    "weapon_carbinerifle",
    "weapon_machinepistol",
    "weapon_pistol",
    "trojan_usb",
    "electronickit",
    "decrypter-fv2",
    "gatecrack",
}

RegisterServerEvent("qb-bobcat:server:loot")
AddEventHandler("qb-bobcat:server:loot", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i = 1, math.random(1, 8), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        Player.Functions.AddItem(randItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[trojan_usb], 'add')
        Citizen.Wait(500)
    end
end)	

