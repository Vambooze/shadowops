local QBCore = exports['qb-core']:GetCoreObject()

local cooldown = false
local looted = false
local looted2 = false
local looted3 = false
local looted4 = false
local looted5 = false
local looted6 = false

local pedSpawned = false

RegisterNetEvent('sd-warehouse:particles', function(method)
	TriggerClientEvent('sd-warehouse:ptfxparticle', -1, method)
end)

RegisterNetEvent('sd-warehouse:server:PoliceRaid', function(method)
	TriggerClientEvent('sd-warehouse:PoliceRaid', -1, method)
end)

RegisterNetEvent('sd-warehouse:server:targetsync', function()
	TriggerClientEvent('sd-warehouse:targetsync', -1)
end)

RegisterNetEvent('sd-warehouse:server:targetsync2', function()
	TriggerClientEvent('sd-warehouse:targetsync2', -1)
end)

RegisterNetEvent('sd-warehouse:server:lockdoors', function()
	TriggerClientEvent('sd-warehouse:enablelocks', -1)
end)

RegisterNetEvent('sd-warehouse:server:enableconfiglocks', function()
	TriggerClientEvent('sd-warehouse:enableconfiglocks', -1)
end)

-- Thermite Item Check

QBCore.Functions.CreateCallback('sd-warehouse:ItemCheck', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItem = Player.Functions.GetItemByName(item)

	if hasItem ~= nil then
		if hasItem.amount >= 1 then
		  cb(true)
		else
		  cb(false)
		end
	else
		cb(false)
	end
end)

-- Give Item events

RegisterServerEvent('sd-warehouse:giveRandomBox1', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted then
        looted = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box1[math.random(1, #Config.Box1)]
		local amount = math.random(2, 3)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

RegisterServerEvent('sd-warehouse:giveRandomBox2', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted2 then
        looted2 = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box2[math.random(1, #Config.Box2)]
		local amount = math.random(1, 1)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

RegisterServerEvent('sd-warehouse:giveRandomBox3', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted3 then
        looted3 = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box3[math.random(1, #Config.Box3)]
		local amount = math.random(2, 3)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

RegisterServerEvent('sd-warehouse:giveRandomBox4', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted4 then
        looted4 = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box4[math.random(1, #Config.Box4)]
		local amount = math.random(2, 3)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

RegisterServerEvent('sd-warehouse:giveRandomBox5', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted5 then
        looted5 = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box5[math.random(1, #Config.Box5)]
		local amount = math.random(1, 1)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

RegisterServerEvent('sd-warehouse:giveRandomBox6', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	if not looted6 then
        looted6 = true
	for i = 1, math.random(3, 4), 1 do 
		local randomitem = Config.Box6[math.random(1, #Config.Box6)]
		local amount = math.random(2, 3)
		Player.Functions.AddItem(randomitem, amount)
	end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Citizen.Wait(300)
	end 
end) 

-- Minimum Cop Amount

QBCore.Functions.CreateCallback('sd-warehouse:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Cooldown

QBCore.Functions.CreateCallback('sd-warehouse:server:cooldown', function(source, cb)
	if cooldown then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('sd-warehouse:server:startCooldown', function()
	cooldown = true 
	local timer = Config.Cooldown * 60000
	while timer > 0 do 
		Wait(1000)
		timer = timer - 1000
		if timer == 0 then 
			print('cooldown finished')
			TriggerClientEvent('sd-warehouse:client:endHeist', -1)
			looted = false
            looted2 = false
            looted3 = false
            looted4 = false
            looted5 = false
            looted6 = false
			cooldown = false 
		end 
	end
end)

