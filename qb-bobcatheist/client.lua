QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
	while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(200)
	end
end)

RegisterNetEvent('qb-firstdoor') -- First Door unlock
AddEventHandler('qb-firstdoor', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, 882.52392, -2258.051, 32.461311, 114.55188)
    if dist < 1.5 then
        QBCore.Functions.TriggerCallback('qb-bobcat:server:getCops', function(cops)
            if cops >= Config.RequiredCops then
                TriggerEvent("qb-minigamedoor1")
            else
                QBCore.Functions.Notify("Not Enough Cops", "error")    
            end
        end)
    end            
end)  
  

RegisterNetEvent('qb-seconddoor') -- 2nd DOOR Unlock
AddEventHandler('qb-seconddoor', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, 880.67565, -2264.178, 32.441616, 172.90039)
    if dist < 1.5 then
        QBCore.Functions.TriggerCallback('qb-bobcat:server:getCops', function(cops)
            if cops >= Config.RequiredCops then
                TriggerEvent("qb-minigamedoor2")
            else
                QBCore.Functions.Notify("Not Enough Cops", "error")    
            end
        end)
    end            
end)  
  
RegisterNetEvent("qb-ptfxparticle")
AddEventHandler("qb-ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 32.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("if ur reading this, u love dick -qb")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("qb-minigamedoor1")
AddEventHandler("qb-minigamedoor1", function()
exports["np-memorygame"]:thermiteminigame(8, 9, 7, 10,
function()
    TriggerEvent("qb-bobcatdooropen")-- First Bobcat Door
    QBCore.Functions.Notify("Success.", "success")
        TriggerServerEvent('police:server:policeAlert', 'Robbery Alert in Bobcat')
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
end,
function()
    QBCore.Functions.Notify("You failed get bettter nub.", "error")
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
end)
end)

RegisterNetEvent("qb-minigamedoor2")
AddEventHandler("qb-minigamedoor2", function()
exports["np-memorygame"]:thermiteminigame(11, 10, 12, 9,
function()
    TriggerEvent("qb-bobcatseconddoor") -- Second Bobcat Door
    QBCore.Functions.Notify("Success.", "success")
    TriggerEvent("dispatch:BobCatRobbery")   
        TriggerServerEvent('police:server:policeAlert', 'Robbery Alert in Bobcat')    
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermitec", 1)
end,
function()
    QBCore.Functions.Notify("You failed get bettter nub.", "error")
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermitec", 1)
end)
end)

RegisterNetEvent("qb-ptfxparticlesec")
AddEventHandler("qb-ptfxparticlesec", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("if ur reading this, u love dick -qb")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('qb-bobcatdooropen')
AddEventHandler('qb-bobcatdooropen', function()
	thermiteanime1()
    TriggerServerEvent('qb-doorlock:server:updateState', 13, false)
end)


RegisterNetEvent('qb-bobcatseconddoor')
AddEventHandler('qb-bobcatseconddoor', function()
	thermiteanime2()
   	TriggerServerEvent('qb-doorlock:server:updateState', 14, false)
end)


RegisterNetEvent('qb-bobcatthirddoor') -- Third Doorlock 3 
AddEventHandler('qb-bobcatthirddoor', function()
    TriggerServerEvent('qb-doorlock:server:updateState', 15, false)
        TriggerServerEvent('police:server:policeAlert', 'Robbery Alert in Bobcat')
    TriggerServerEvent("QBCore:Server:RemoveItem", "security_card_01", 1)
    TriggerEvent("qb-pedcreate")
end)


RegisterNetEvent('qb-pedcreate') -- dunno whats that
AddEventHandler('qb-pedcreate', function()
    TriggerEvent("qb-createped")
end)

RegisterNetEvent('qb-propcreatle') -- Dunno what the hell this for
AddEventHandler('qb-propcreatle', function()
    TriggerEvent("qb-propcreate")
end)

RegisterNetEvent('qb-propcreate')
AddEventHandler('qb-propcreate', function()
    local weaponbox = CreateObject(GetHashKey("ex_prop_crate_ammo_sc"), 888.0774, -2287.33, 31.441, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 176.02)
    FreezeEntityPosition(weaponbox, true)

    local weaponbox2 = CreateObject(GetHashKey("ex_prop_crate_expl_sc"), 886.8, -2281.7, 31.441, true,  true, true)
    CreateObject(weaponbox2)
    SetEntityHeading(weaponbox2, 352.02)
    FreezeEntityPosition(weaponbox2, true) 

    local weaponbox3 = CreateObject(GetHashKey("ex_prop_crate_expl_bc"), 882.1840, -2286.8, 31.441, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 158.02)
    FreezeEntityPosition(weaponbox3, true) 

    local weaponbox4 = CreateObject(GetHashKey("ex_prop_crate_ammo_bc"), 881.4557, -2282.61, 31.441, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 52.02)
    FreezeEntityPosition(weaponbox4, true)
end)


RegisterNetEvent('qb-createped')
AddEventHandler('qb-createped', function()
	local bobcatped2 = GetHashKey('csb_mweather')
	AddRelationshipGroup('efe')

		RequestModel(1456041926)
		bobcatped1 = CreatePed(30, 883.4797, -2273.77, 32.441, 30.568, 88.00, true, false)
		SetPedArmour(bobcatped1, 500)
		SetPedAsEnemy(bobcatped1, true)
		SetPedRelationshipGroupHash(bobcatped1, 'efe')
		GiveWeaponToPed(bobcatped1, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped1, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped1, 100)
		SetPedDropsWeaponsWhenDead(bobcatped1, false)
		
		bobcatped2 = CreatePed(30, 1456041926, 892.4030, -2275.25, 32.441, 360.00, true, false)
		SetPedArmour(bobcatped2, 500)
		SetPedAsEnemy(bobcatped2, true)
		SetPedRelationshipGroupHash(bobcatped2, 'efe')
		GiveWeaponToPed(bobcatped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped2, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped2, 100)
		SetPedDropsWeaponsWhenDead(bobcatped2, false)

		bobcatped3 = CreatePed(30, 1456041926, 892.6776, -2281.26, 32.441, 350.00, true, false)
		SetPedArmour(bobcatped3, 500)
		SetPedAsEnemy(bobcatped3, true)
		SetPedRelationshipGroupHash(bobcatped3, 'efe')
		GiveWeaponToPed(bobcatped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped3, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped3, 100)
		SetPedDropsWeaponsWhenDead(bobcatped3, false)

		bobcatped4 = CreatePed(30, 1456041926, 889.3485, -2292.47, 32.441, 350.00, true, false)
		SetPedArmour(bobcatped4, 500)
		SetPedAsEnemy(bobcatped4, true)
		SetPedRelationshipGroupHash(bobcatped4, 'efe')
		GiveWeaponToPed(bobcatped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped4, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped4, 100)
		SetPedDropsWeaponsWhenDead(bobcatped4, false)

		bobcatped5 = CreatePed(30, 1456041926, 880.9854, -2293.40, 32.441, 300.00, true, false)
		SetPedArmour(bobcatped5, 500)
		SetPedAsEnemy(bobcatped5, true)
		SetPedRelationshipGroupHash(bobcatped5, 'efe')
		GiveWeaponToPed(bobcatped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped5, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped5, 100)
		SetPedDropsWeaponsWhenDead(bobcatped5, false)


		bobcatped6 = CreatePed(30, 1456041926, 873.4896, -2293.21, 32.441, 266.00, true, false)
		SetPedArmour(bobcatped6, 500)
		SetPedAsEnemy(bobcatped6, true)
		SetPedRelationshipGroupHash(bobcatped6, 'efe')
		GiveWeaponToPed(bobcatped6, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped6, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped6, 100)
		SetPedDropsWeaponsWhenDead(bobcatped6, false)

		bobcatped7 = CreatePed(30, 1456041926,894.1248, -2287.51, 32.446, 298.00, true, false)
		SetPedArmour(bobcatped7, 500)
		SetPedAsEnemy(bobcatped7, true)
		SetPedRelationshipGroupHash(bobcatped7, 'efe')
		GiveWeaponToPed(bobcatped7, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped7, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped7, 100)
		SetPedDropsWeaponsWhenDead(bobcatped7, false)

		bobcatped8 = CreatePed(30, 1456041926, 896.9407, -2280.87, 32.441, 266.00, true, false)
		SetPedArmour(bobcatped8, 500)
		SetPedAsEnemy(bobcatped8, true)
		SetPedRelationshipGroupHash(bobcatped8, 'efe')
		GiveWeaponToPed(bobcatped8, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped8, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped8, 100)
		SetPedDropsWeaponsWhenDead(bobcatped8, false)
end)

RegisterNetEvent('qb-updateIpls')
AddEventHandler('qb-updateIpls', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end)

	
Citizen.CreateThread(function()
    local hash = GetHashKey("cs_drfriedlander")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
end
    hostage = CreatePed("PED_TYPE_CIVFEMALE", "cs_drfriedlander", 870.1760, -2288.20, 31.441, 175.21, false, false)
    SetBlockingOfNonTemporaryEvents(hostage, true)
            SetPedDiesWhenInjured(hostage, false)
            SetPedCanPlayAmbientAnims(hostage, true)
            SetPedCanRagdollFromPlayerImpact(hostage, false)
			SetEntityInvincible(hostage, false)
            RequestAnimDict('random@arrests@busted', function()
        TaskPlayAnim(hostage, 'random@arrests@busted', 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	end)
end)

RegisterNetEvent('qb-hostagegotoexplosion') -- Ped goes to the vault
AddEventHandler('qb-hostagegotoexplosion', function()
	ClearPedTasks(hostage)
	TaskGoStraightToCoord(hostage, 869.2078, -2292.60, 32.441, 150.0, -1, 265.61, 0)
	Citizen.Wait(5000)
	TaskGoStraightToCoord(hostage, 893.3309, -2294.90, 32.441, 150.0, -1, 350.61, 0)
	Citizen.Wait(13000)
	TriggerEvent("qb-pedgoboom")
end)

local currentRegister   = 0

RegisterNetEvent('qb-collect') -- PEW PEW 
AddEventHandler('qb-collect', function()
    if not robberyBusy then
        TriggerServerEvent("qb-bobcat:server:loot")
        robberyBusy = true
    else
       QBCore.Functions.Notify("Empty.", 'error')
    end
end)

function thermiteanime1() -- FRONT DOOR ANIMATION
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 32.461, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 32.461,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("qb-particleserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
    TriggerEvent("qb-firstdoorlock")
end

function thermiteanime2() -- Inside Door 
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 32.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 32.441,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("qb-particleserversec", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end


RegisterNetEvent('qb-pedgoboom') -- PED go habibi
AddEventHandler('qb-pedgoboom', function()
	TaskGoStraightToCoord(hostage, 894.6337, -2284.97, 32.441, 150.0, -1, 82.56, 0)
	Citizen.Wait(7500)
	RequestAnimDict('weapons@projectile@grenade_str', function()
        TaskPlayAnim(hostage, 'weapons@projectile@grenade_str', 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
    end)
	Citizen.Wait(1000)
	AddExplosion(890.7849, -2284.88, 32.441, 32, 150000.0, true, false, 4.0)
	AddExplosion(894.0084, -2284.90, 32.580, 32, 150000.0, true, false, 4.0)
    TriggerEvent("qb-updateIpls")
    TriggerEvent("qb-propcreate")
end)
	
    exports["qb-target"]:AddCircleZone("capitulate", vector3(870.4505, -2288.83, 32.441), 1.0, {
        name ="capitulate",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    event = "qb-hostagegotoexplosion",
                    icon = "fas fa-bomb",
                    label = "Blast the Door!",
                },
             },
             job = {"all"},
            distance = 2.1
        })
        exports["qb-target"]:AddCircleZone("lootweapon", vector3(883.0063, -2283.38, 32.441), 1.0, {
            name ="lootweapon",
            useZ = true,
            --debugPoly=true
            }, {
                options = {
                    {
                        event = "qb-collect",
                        icon = "fas fa-box",
                        label = "Loot Weapon!",
                    },
                 },
                 job = {"all"},
                distance = 2.1
            })