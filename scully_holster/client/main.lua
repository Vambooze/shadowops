local PlayerPedId = PlayerPedId
local PlayerId = PlayerId
local GetSelectedPedWeapon = GetSelectedPedWeapon
local Wait = Wait
local SetFlashLightKeepOnWhileMoving = SetFlashLightKeepOnWhileMoving
local HasAnimDictLoaded = HasAnimDictLoaded
local RequestAnimDict = RequestAnimDict
local GetPedDrawableVariation = GetPedDrawableVariation
local GetPedTextureVariation = GetPedTextureVariation
local GetEntityCoords = GetEntityCoords
local GetGamePool = GetGamePool
local GetWorldPositionOfEntityBone = GetWorldPositionOfEntityBone
local GetEntityBoneIndexByName = GetEntityBoneIndexByName
local SetPedCanSwitchWeapon = SetPedCanSwitchWeapon
local HudWeaponWheelIgnoreControlInput = HudWeaponWheelIgnoreControlInput
local SetCurrentPedWeapon = SetCurrentPedWeapon
local SetCanPedEquipWeapon = SetCanPedEquipWeapon
local GetEntityModel = GetEntityModel
local SetPedCurrentWeaponVisible = SetPedCurrentWeaponVisible
local SetPedComponentVariation = SetPedComponentVariation
local GetPedAmmoTypeFromWeapon_2 = GetPedAmmoTypeFromWeapon_2
local TaskPlayAnim = TaskPlayAnim
local ClearPedTasks = ClearPedTasks
local RemoveAnimDict = RemoveAnimDict
local SetVehicleDoorOpen = SetVehicleDoorOpen
local SetVehicleDoorShut = SetVehicleDoorShut
local GetWeapontypeGroup = GetWeapontypeGroup
local GetWeaponCount = GetWeaponCount
local GetPedWeapon = GetPedWeapon

local ped, playerId, animation, weapon, hasPermission = PlayerPedId(), PlayerId(), GetResourceKvpInt('scully_holster_type') or 1, GetSelectedPedWeapon(PlayerPedId()), false
local ranCheck, slingStarted = false, false

AddEventHandler('playerSpawned', function()
	ped = PlayerPedId()
	weapon = GetSelectedPedWeapon(ped)
end)

RegisterNetEvent('scully_holster:sendPermission', function(hasPermission)
	if not ranCheck then
		hasPermission = hasPermission
	end
end)

CreateThread(function()
	Wait(100)
	
	TriggerServerEvent('scully_holster:getPermission')
	SetWeaponsNoAutoreload(not Config.EnableAutoReload)
	SetWeaponsNoAutoswap(true)

	local slingState = GetResourceState('scully_sling')
	slingStarted = slingState == 'starting' or slingState == 'started'

	while true do
		Wait(3000)

		ped = PlayerPedId()

		if Config.EnableBetterFlashlight then
			SetFlashLightKeepOnWhileMoving(weapon ~= `WEAPON_FLASHLIGHT`)
		end
	end
end)

function requestAnimDict(animDict)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(0)
		end
	end
end

function notify(text)
	if Config.UseCustomNotifications then
		Config.CustomNotification(text)
		return
	end

	BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(true, true)
end

function getPlayerDrawable(drawable)
    return GetPedDrawableVariation(ped, drawable) or -1, GetPedTextureVariation(ped, drawable) or -1
end

function getClosestVehicle()
	local playerCoords = GetEntityCoords(ped)
    local vehicles = GetGamePool('CVehicle')
    local closestVehicle, closestDistance = -1, -1

	for i = 1, #vehicles do
		local v = vehicles[i]
		local vehicleCoords = GetEntityCoords(v)
        local distance = #(vehicleCoords - playerCoords)
		
        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = v
            closestDistance = distance
        end
	end

    return closestVehicle, closestDistance
end

function isNearTrunk(vehicle)
	local playerCoords, trunkCoords = GetEntityCoords(ped), GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'boot'))

	return #(playerCoords - trunkCoords) < 3
end

function disableWeapon(disable)
	SetPedCanSwitchWeapon(ped, not disable)
	HudWeaponWheelIgnoreControlInput(disable)
end

function isAllowed(currentWeapon)
	if Config.EnableBlacklist then
		if Config.Blacklisted[currentWeapon] then
			weapon = `WEAPON_UNARMED`

			SetCurrentPedWeapon(ped, weapon, true)
			SetCanPedEquipWeapon(ped, currentWeapon, false)
			notify(Config.Language.Blacklisted)

			return false
		end
	end

	return true
end

function getGender()
	if GetEntityModel(ped) == `mp_m_freemode_01` then
		return 'Male'
	end

	return 'Female'
end

function getHolster()
	local playerGender = getGender()
	local holsters = Config.Holsters[playerGender]

	for drawableId, holsterData in pairs(holsters) do
		local currentHolster, currentTexture = getPlayerDrawable(drawableId)

		for i = 1, #holsterData do
			local newHolster = holsterData[i]

			if newHolster.Main == currentHolster then
				return {
					drawable = newHolster.Empty,
					texture = currentTexture,
					wasEmpty = false
				}
			elseif newHolster.Empty == currentHolster then
				return {
					drawable = newHolster.Main,
					texture = currentTexture,
					wasEmpty = true
				}
			end
		end
	end

	return nil
end

function toggleWeapon(currentWeapon, showWeapon, swapHolster)
	if showWeapon then
		SetPedCurrentWeaponVisible(ped, showWeapon, 1, 1, 1)
	end

	if Config.EnableDynamicHolsters and swapHolster then
		local playerHolster = getHolster()

		if playerHolster then
			if currentWeapon == `WEAPON_UNARMED` then
				if playerHolster.wasEmpty then
					SetPedComponentVariation(ped, 7, playerHolster.drawable, playerHolster.texture, 0)
				end
	
				return
			end
	
			local ammoType = GetPedAmmoTypeFromWeapon_2(ped, currentWeapon)
	
			if ammoType == `AMMO_PISTOL` then
				if not playerHolster.wasEmpty then
					SetPedComponentVariation(ped, 7, playerHolster.drawable, playerHolster.texture, 0)
				end
	
				return
			end
	
			if playerHolster.wasEmpty then
				SetPedComponentVariation(ped, 7, playerHolster.drawable, playerHolster.texture, 0)
			end
		end
	end
end

function requirementCheck(currentWeapon, cb)
	if Config.BypassWeapons[currentWeapon] then 
		weapon = currentWeapon

		cb(false)

		return 
	end

	if not Config.EnableRequirement then cb(true) return end

	local selectedWeapon = Config.Weapons[currentWeapon]
	local isOnSling = slingStarted and exports.scully_sling:doesSlingContainWeapon(currentWeapon)

	if selectedWeapon and not isOnSling then
		if not selectedWeapon.Trunk and not selectedWeapon.Bag then 
			cb(true) 

			return 
		end

		if selectedWeapon.Bag then
			local currentBag = GetPedDrawableVariation(ped, 5)

			if Config.Bags[currentBag] then
				disableWeapon(true)

				weapon = currentWeapon

				requestAnimDict('reaction@intimidation@1h')
				TaskPlayAnim(ped, 'reaction@intimidation@1h', 'intro', 8.0, 2.0, 1700, Config.MovementFlag, 10, 0, 0, 0)
				toggleWeapon(currentWeapon, 0, false)
				Wait(1300)
				toggleWeapon(currentWeapon, 1, false)
				Wait(700)
				ClearPedTasks(ped)

				disableWeapon(false)

				RemoveAnimDict('reaction@intimidation@1h')
				cb(false)

				return
			end

			if not selectedWeapon.Trunk and not Config.Bags[currentBag] then
				weapon = `WEAPON_UNARMED`

				SetCurrentPedWeapon(ped, weapon, true)
				notify(Config.Language.NeedBag)
				cb(false)

				return
			end
		end

		if selectedWeapon.Trunk then
			local vehicle, distance = getClosestVehicle()

			if distance < 5 then
				local isNearTrunk = isNearTrunk(vehicle)

				if isNearTrunk then
					disableWeapon(true)
					SetVehicleDoorOpen(vehicle, 5, false, true)

					weapon = currentWeapon

					requestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
					TaskPlayAnim(ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 2.0, 1200, Config.TrunkMovementFlag, 10, 0, 0, 0)
					toggleWeapon(currentWeapon, 0, false)
					Wait(900)
					toggleWeapon(currentWeapon, 1, false)
					Wait(300)
					SetVehicleDoorShut(vehicle, 5, false)
					ClearPedTasks(ped)

					disableWeapon(false)

					RemoveAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
					cb(false)

					return
				end
			end

			weapon = `WEAPON_UNARMED`

			SetCurrentPedWeapon(ped, weapon, true)

			if selectedWeapon.Bag then
				notify(Config.Language.NeedBag)
			else
				notify(Config.Language.NeedTrunk)
			end

			cb(false)
			return
		end
	end

	cb(true)
end

function isHolsterAnim()
	if Config.SwitchCommand ~= '' then
		if Config.UseAcePerm then
			if animation == 1 then
				return hasPermission
			end
		end

		return animation == 1
	end

	local selectedWeapon = Config.Weapons[weapon]

	if selectedWeapon then
		if selectedWeapon.Bag then
			local currentBag = GetPedDrawableVariation(ped, 5)

			if Config.Bags[currentBag] then
				return false
			end
		end
	end

	local hasHolster = getHolster()
	local weaponGroup = GetWeapontypeGroup(weapon)
	local weaponGroupAnimIsHolster = weaponGroup and Config.WeaponClasses[weaponGroup]
	local useHolsterAnim = weaponGroupAnimIsHolster and (hasHolster ~= nil) or not Config.EnableGangsterAnim

	if useHolsterAnim and Config.UseAcePerm then useHolsterAnim = hasPermission end

	return useHolsterAnim
end

function hasThrowableWeapon()
    local weaponCount = GetNumPlayerWeapons(playerId)

    for i = 1, weaponCount do
        local weaponHash = GetPedWeapon(ped, i - 1)
        local weaponGroup = GetWeapontypeGroup(weaponHash)

        if weaponGroup == 1548507267 then
            return true
        end
    end

    return false
end

function shouldHolster(currentWeapon)
	if IsPedInAnyVehicle(ped, true) then
		return false
	elseif LocalPlayer.state.isDead then
		return false
	elseif IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3) then
		return false
	elseif IsEntityPlayingAnim(ped, 'combat@damage@writhe', 'writhe_loop', 3) then
		return false
	elseif IsPlayerDead(playerId) then
		return false
	elseif GetPedParachuteState(ped) > 0 then
		return false
	elseif IsPedInParachuteFreeFall(ped) then
		return false
	elseif not IsHudComponentActive(19) then
		if IsControlPressed(0, 47) then
			if Config.Throwables[currentWeapon] then
				return false
			end
		end
	elseif IsPedActiveInScenario(ped) then
		return false
	end

	return true
end

exports('updateWeapon', function(newWeapon)
    weapon = newWeapon
end)

CreateThread(function()
	while true do
		Wait(10)
		local letSleep = true
		local currentWeapon = GetSelectedPedWeapon(ped)

		if currentWeapon ~= weapon then
			local canContinue = shouldHolster(currentWeapon)

			if canContinue then
				letSleep = false

				if currentWeapon == `WEAPON_UNARMED` then
					if not Config.BypassWeapons[weapon] then
						SetCurrentPedWeapon(ped, weapon, true)

						if isHolsterAnim() then			
							disableWeapon(true)						
							requestAnimDict('reaction@intimidation@cop@unarmed')						
							TaskPlayAnim(ped, 'reaction@intimidation@cop@unarmed', 'intro', 10.0, 2.3, -1, Config.MovementFlag, 1, 0, 0, 0)						
							Wait(300)						
							toggleWeapon(weapon, 0, false)						
							Wait(300)						
							toggleWeapon(currentWeapon, false, true)						
							ClearPedTasks(ped)						
							disableWeapon(false)
							Wait(1000)
							toggleWeapon(weapon, 1, false)
							RemoveAnimDict('reaction@intimidation@cop@unarmed')

							weapon = currentWeapon

							SetCurrentPedWeapon(ped, currentWeapon, true)
						else
							disableWeapon(true)
							requestAnimDict('reaction@intimidation@1h')
							TaskPlayAnim(ped, 'reaction@intimidation@1h', 'outro', 8.0, 2.0, 1700, Config.MovementFlag, 10, 0, 0, 0)
							toggleWeapon(weapon, 1, false)
							Wait(1700)
							disableWeapon(false)
							RemoveAnimDict('reaction@intimidation@1h')		

							weapon = currentWeapon		

							SetCurrentPedWeapon(ped, currentWeapon, true)
						end
					else
						weapon = currentWeapon
					end
				else
					if isAllowed(currentWeapon) then
						if weapon ~= `WEAPON_UNARMED` then
							if not Config.BypassWeapons[weapon] then
								if HasPedGotWeapon(ped, weapon, false) then
									SetCurrentPedWeapon(ped, weapon, true)

									if isHolsterAnim() then
										disableWeapon(true)
										requestAnimDict('reaction@intimidation@cop@unarmed')
										TaskPlayAnim(ped, 'reaction@intimidation@cop@unarmed', 'intro', 10.0, 2.3, -1, Config.MovementFlag, 1, 0, 0, 0)
										Wait(300)
										toggleWeapon(weapon, 0, false)
										Wait(300)
										ClearPedTasks(ped)
										disableWeapon(false)
										Wait(1000)
										toggleWeapon(weapon, 1, true)
										SetCurrentPedWeapon(ped, currentWeapon, true)
									else
										disableWeapon(true)
										requestAnimDict('reaction@intimidation@1h')
										TaskPlayAnim(ped, 'reaction@intimidation@1h', 'outro', 8.0, 2.0, 1700, Config.MovementFlag, 10, 0, 0, 0)
										toggleWeapon(weapon, 1, false)
										Wait(1700)
										disableWeapon(false)
										SetCurrentPedWeapon(ped, currentWeapon, true)
									end
								end
							end
						end
						requirementCheck(currentWeapon, function(shouldContinue)
							if shouldContinue then
								if isHolsterAnim() then
									disableWeapon(true)

									weapon = currentWeapon

									requestAnimDict('reaction@intimidation@cop@unarmed')
									TaskPlayAnim(ped, 'reaction@intimidation@cop@unarmed', 'intro', 10.0, 2.3, -1, Config.MovementFlag, 1, 0, 0, 0)
									toggleWeapon(currentWeapon, 0, false)
									Wait(600)
									ClearPedTasks(ped)
									disableWeapon(false)
									toggleWeapon(currentWeapon, 1, true)
									RemoveAnimDict('reaction@intimidation@cop@unarmed')
								else
									disableWeapon(true)

									weapon = currentWeapon

									requestAnimDict('reaction@intimidation@1h')
									TaskPlayAnim(ped, 'reaction@intimidation@1h', 'intro', 8.0, 2.0, 1700, Config.MovementFlag, 10, 0, 0, 0)
									toggleWeapon(currentWeapon, 0, false)
									Wait(1300)
									toggleWeapon(currentWeapon, 1, false)
									Wait(700)
									ClearPedTasks(ped)
									disableWeapon(false)
									RemoveAnimDict('reaction@intimidation@1h')
								end
							end
						end)
					end
				end
			end
		end
		if letSleep then
			Wait(100)
		end
	end
end)

local beltWeapons, beltTexture = Config.DynamicBelts.BeltWeapons, nil

if Config.DynamicBelts.Enable then
	local function getBeltVariant()
		local currentVariant = nil
		local currentGender = getGender()
		local currentBelt, currentTexture = nil, nil
		local variantsTable = Config.DynamicBelts.Variations[currentGender]

		for i = 1, #variantsTable do
			local variant = variantsTable[i]
			
			currentBelt, currentTexture = getPlayerDrawable(variant.DrawableID)

			if variant.Main == currentBelt then
				currentVariant = variant
				break
			end
			
			if variant.Taser == currentBelt then
				currentVariant = variant
				break
			end
			
			if variant.Baton == currentBelt then
				currentVariant = variant
				break
			end
			
			if variant.Flashlight == currentBelt then
				currentVariant = variant
				break
			end
		end

		return currentVariant, beltTexture and beltTexture or currentTexture
	end

	CreateThread(function()
		while true do
			Wait(500)

			local currentVariant, currentTexture = getBeltVariant()

			if currentVariant then
				local currentBeltTool = beltWeapons[weapon]
				local currentBelt = currentBeltTool and currentVariant[currentBeltTool] or currentVariant.Main

				if currentBeltTool == 'Taser' then beltTexture = currentTexture end
				if currentBeltTool ~= 'Taser' then beltTexture = nil end

				SetPedComponentVariation(ped, 8, currentBelt, beltTexture and 0 or currentTexture, 0)
			end
		end
	end)
end

if Config.ReachKeybind ~= '' then
	RegisterCommand('+scully_holster_reach', function()
		local currentWeapon = GetSelectedPedWeapon(ped)

		if currentWeapon ~= `WEAPON_UNARMED` then return end

		if Config.EnableReachRestriction then
			local hasHolster = getHolster()

			if not hasHolster then return end
		end

		requestAnimDict('move_m@intimidation@cop@unarmed')
		TaskPlayAnim(ped, 'move_m@intimidation@cop@unarmed', 'idle', 10.0, 2.3, -1, Config.MovementFlag, 1, 0, 0, 0)
	end)

	RegisterCommand('-scully_holster_reach', function()
		StopAnimTask(ped, 'move_m@intimidation@cop@unarmed', 'idle', 1.0)
		RemoveAnimDict('move_m@intimidation@cop@unarmed')
	end)
	
	RegisterKeyMapping('+scully_holster_reach', Config.Language.WeaponReach, 'keyboard', Config.ReachKeybind)
end

if Config.SwitchCommand ~= '' then
	RegisterCommand(Config.SwitchCommand, function(_, args)
		local newAnimation = tonumber(args[1])

		if newAnimation then
			if newAnimation > 0 and newAnimation < 3 then
				animation = newAnimation
				SetResourceKvpInt('scully_holster_type', newAnimation)
				notify(Config.Language.ChangedAnim)
			else
				notify(Config.Language.NotValid)
			end
		else
			notify(Config.Language.NotValid)
		end
	end)
end