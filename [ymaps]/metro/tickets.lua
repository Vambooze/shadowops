
local QBCore = exports['qb-core']:GetCoreObject()


local IsPlayerNearMetro = false
local IsPlayerInMetro = false
local PlayerHasMetroTicket = false
local IsPlayerUsingTicketMachine = false

-- if you can find the model name for the other ticket machines to make them all work, let me know
--local TicketMachines = {'prop_train_ticket_02', 'prop_train_ticket_02_tu', 'v_serv_tu_statio3_'}
local TicketMachines = {'prop_train_ticket_02', 'prop_train_ticket_02_tu', 'v_serv_tu_statio3_'}
local anim = "mini@atmenter"

local MetroStopBlips = {
	-- Example {title="", colour=, id=, x=, y=, z=},
	{title="METRO: LSIA Terminal 4", colour=1, id=78, x=-1088.627, y=-2709.362, z=-7.137033},
	{title="METRO: LSIA Parking", colour=1, id=78, x=-889.2755, y=-2311.825, z=-11.45941},
	{title="METRO: Little Seoul", colour=1, id=78, x=-545.3138, y=-1280.548, z=27.09238},
	{title="METRO: Strawberry", colour=1, id=78, x=270.2029, y=-1210.818, z=39.25398},
	{title="METRO: Burton", colour=1, id=78, x=-286.3837, y=-318.877, z=10.33625},
	{title="METRO: Portola Drive", colour=1, id=78, x=-826.3845, y=-134.7151, z=20.22362},
	{title="METRO: Del Perro", colour=1, id=78, x=-1351.282, y=-481.2916, z=15.318},
	{title="METRO: Little Seoul", colour=1, id=78, x=-496.0209, y=-681.0325, z=12.08264},
	{title="METRO: Pillbox South", colour=1, id=78, x=-218.2868, y=-1031.54, z=30.51112},
	{title="METRO: Davis", colour=1, id=78, x=112.3714, y=-1729.233, z=30.24097},
}

Citizen.CreateThread(function()
	
	for _, info in pairs(MetroStopBlips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.4)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end

	ShowedBuyTicketHelper = false
	ShowedLeaveMetroHelper = false
	TicketInvalidated = false
	while true do
		Wait(10)

		if IsPlayerNearTicketMachine then
			if (not IsPlayerUsingTicketMachine and not PlayerHasMetroTicket) then
				if not ShowedBuyTicketHelper then
					exports['okokTextUI']:Open('[E] To purchase metro ticket', 'darkblue', 'left')
					ShowedBuyTicketHelper = true
				end
			else
				if not ShowedBuyTicketHelper then
					exports['ps-ui']:Notify("You already have a ticket.", 'success', 4000)
					ShowedBuyTicketHelper = true
				end
				exports['okokTextUI']:Close()
				DisableControlAction(0, 201, true)
				DisableControlAction(1, 201, true)
			end

			if IsControlJustPressed(0, 51) and PlayerHasMetroTicket then
				-- SMS_Message("CHAR_LS_TOURIST_BOARD", "Los Santos Transit", "Information", "You already have a valid Metro Ticket, please go to one of the stations and board the Metro", true)
				exports['ps-ui']:Notify("You already have a ticket.", 'success', 4000)
				Wait(3500) -- To avoid people 'spamming themselves' with the message popup (3500ms is 'just enough' to take the fun out of it :P)
			end

			if IsControlJustPressed(0, 51) and not PlayerHasMetroTicket then
				IsPlayerUsingTicketMachine = true
				RequestAnimDict("mini@atmbase")
				RequestAnimDict(anim)
				while not HasAnimDictLoaded(anim) do
					Wait(1)
				end

				SetCurrentPedWeapon(playerPed, GetHashKey("weapon_unarmed"), true)
				TaskLookAtEntity(playerPed, currentTicketMachine, 2000, 2048, 2)
				Wait(500)
				TaskGoStraightToCoord(playerPed, TicketMX, TicketMY, TicketMZ, 0.1, 4000, GetEntityHeading(currentTicketMachine), 0.5)
				Wait(2000)
				TaskPlayAnim(playerPed, anim, "enter", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict(animDict)
				Wait(4000)
				TaskPlayAnim(playerPed, "mini@atmbase", "base", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict("mini@atmbase")
				Wait(500)
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				RequestAnimDict("mini@atmexit")
				while not HasAnimDictLoaded("mini@atmexit") do
					Wait(1)
				end
				TaskPlayAnim(playerPed, "mini@atmexit", "exit", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
				RemoveAnimDict("mini@atmexit")
				Wait(500)

				--=====================================================================================
				-- Put here the actual 'reader'/function that your server uses
				-- to calculate/get the players bank account saldo and cash money!
				-- Now they are just set 'hardcoded' to an high amount to make the
				-- script work for people whom don't read a single line of code
				-- and then instantly post "Hey, i can't even buy a ticket, the script is broken" :P
				--
				-- Nope it's NOT broken, it just needs a BIT of adapting to your server and it's
				-- money handling. Since we use a custom banking system we have much different calls
				-- than others might have so i've decided to put it in here like this so that it
				-- functions for everyone when they want to test/try the script :)
				--=====================================================================================
				QBCore.Functions.TriggerCallback('okokBanking:server:metroPay', function(isPay)
					--===================================================================
					-- Please note, that despite if you make your players pay with
					-- cash or by bank, it will always show the selected bank popup
					-- if the player doesn't have enough cash (this is NOT a bug!)
					-- if you want/need it differently you can adapt the code bellow ;)
					--==================================================================
					if isPay == false then
						TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Metro', 'Transaction Failed. Insufficient Funds', 'fas fa-train', '#FF0000', 10000)
					else
						TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Metro', 'Thank you for your purchase.', 'fas fa-train', '#FF0000', 10000)
						ShowedLeaveMetroHelper = false
						TicketInvalidated = false
						PlayerHasMetroTicket = true
					end
				end)
				IsPlayerUsingTicketMachine = false
			end
		else
			ShowedBuyTicketHelper = false
		end
	end
end)



Citizen.CreateThread(function()
	--=======================================================================================
	-- Note only do this 'check' every 550ms to prevent
	-- to much load in the game (taking in account many other scripts also running of course)
	--=======================================================================================
	while true do
		Wait(550)
		playerPed = PlayerPedId()
		IsPlayerInMetro = IsPedInAnyTrain( playerPed )
		-- We only have to check this part if the player is NOT on the metro.
		if not IsPlayerInMetro then
			TicketInvalidated = false
			ShowedLeaveMetroHelper = false
			IsPlayerInVehicle = IsPedInAnyVehicle(playerPed, true)

			-- And then ONLY check it if the player isn't in a vehicle either
			-- Note: The way i'm using the metro, the game doesn't recognize it as being
			-- on/in a vehicle.
			if not IsPlayerInVehicle then

				if PlayerHasMetroTicket then
					if not ShowedEToEnterMetro then
						exports['ps-ui']:Notify("You have recieved your ticket. Go get on the subway before it leaves!", 'success', 7000)
						ShowedEToEnterMetro = true
					end
				end

				-- Only show the "Press [E] to buy...." message near the ticket machine if the player does NOT own a ticket already
				-- Do note that it IS possible to 'activate' the ticket machine again though (but will give a different message ;) )
				x,y,z = table.unpack(GetEntityCoords(playerPed, true))
				-- And then only need to keep checking (scanning cords) if the player is not near the Ticket Machine (anymore)
				if not IsPlayerNearTicketMachine then
					for k,v in pairs(TicketMachines) do
						TicketMachine = GetClosestObjectOfType(x, y, z, 0.75, GetHashKey(v), false)
						if DoesEntityExist(TicketMachine) then
							currentTicketMachine = TicketMachine
							TicketMX, TicketMY, TicketMZ = table.unpack(GetOffsetFromEntityInWorldCoords(TicketMachine, 0.0, -.85, 0.0))
							IsPlayerNearTicketMachine = true
						end
					end
				else
					if not DoesEntityExist(currentTicketMachine) then
						IsPlayerNearTicketMachine = false -- If for some (weird) reasons the ticked machine (suddenly)
					else								  --doesn't exist anymore, tell the script that the player isn't near one anymore
						if GetDistanceBetweenCoords(x,y,z, TicketMX, TicketMY, TicketMZ, true) > 2.0 then
							IsPlayerNearTicketMachine = false -- And do the same if the player is more than a radius of 2.0 away from the ticket machine
						end
					end
				end
			end
		else
			if PlayerHasMetroTicket then
				--good to ride
				if ShowedLeaveMetroHelper == false then
					exports['ps-ui']:Notify("Thank you for using the Los Santos Metro.", 'success', 7000)
					Wait(500)
					exports['ps-ui']:Notify("Your metro ticket wil be void once you leave the train.", 'success', 7000)
					ShowedLeaveMetroHelper = true
					TicketInvalidated = true
					PlayerHasMetroTicket = false
					-- ShowedBuyTicketHelper = false
				end
			else
				if TicketInvalidated == false then
					--no ticket but on train anyway
					--only show this every 3.5 seconds to make it annoying but not horrible
					local PlayerData = QBCore.Functions.GetPlayerData()
					local lastname = PlayerData.charinfo.lastname
					exports['ps-ui']:Notify("You do not have a subway ticket.", 'success', 7000)
					Wait(Config.timer)
					if Config.isCallPolice == true and IsPedInAnyTrain( playerPed ) then
						local text  = 'Get on the subway without a ticket. The camera identified a citizen: ' .. lastname
						TriggerServerEvent('police:server:policeAlert', text )
					end
					Wait(3500) 
				end
			end
		end
	end
	
end)

-- This is the function which is used to display 'SMS Style messages'
-- If you need more/other icons to display, then make sure to check out:
-- https://wiki.gtanet.work/index.php?title=Notification_Pictures
function SMS_Message(NotiPic, SenderName, Subject, MessageText, PlaySound)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(MessageText)
    SetNotificationBackgroundColor(140)
    SetNotificationMessage(NotiPic, NotiPic, true, 4, SenderName, Subject, MessageText)
    DrawNotification(false, true)
	if PlaySound then
		PlaySoundFrontend(GetSoundId(), "Text_Arrive_Tone", "Phone_SoundSet_Default", true)
	end
end

-- This is the text 'helper' which is used at the top left for messages like 'Press [E] to buy ticket ($25)'
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	EndTextCommandDisplayHelp(0, 0, true, 2000)
end


