Fishing = {}

Fishing.IsFishing = false
Fishing.FishesAvailableAtHookDepth = {}
Fishing.FishesAvailable = false

Fishing.CurrentRodSetup = {
  rodobj   = false,
  rodtype  = false,
  bait     = false,
  line     = false,
  reel     = false,
  hook     = false  
}

Fishing.MiniGameSettings = {
  OverallEquipmentStrength = false,
  FishStrength             = false,
  FishFightChance          = false,
  ReelSpeed                = false,
  FishSpeed                = false, 
  MiniGameDifficulty       = false,
  HookDepth                = false,
  WaterDepth               = false,
  RewardFish               = false,
}

-- Open the rod loadout UI --
Fishing.OpenLoadout = function()
  Fishing.Callback("Fishing:GetFishingItems", function(allFishingItems)
    allFishingItems['rod'] = Fishing.CurrentRodSetup.rodtype
    SendNUIMessage({
      message  = "Open",
      items    = allFishingItems,
      rod      = Fishing.CurrentRodSetup,
      ui       = "loadout",
    })
    SetNuiFocus(true,true)
  end)
end 


RegisterNUICallback('setitem',function(data) 
  TriggerServerEvent("Fishing:RemoveItem", data.item)
  Fishing.CurrentRodSetup[data.type] = data.item
end)

RegisterNUICallback('unsetitem',function(data)
  Fishing.CurrentRodSetup[data.type] = false
  TriggerServerEvent("Fishing:AddItem", data.item)
end)


-- Close UI from Loadout ---- Also used if someone pulls rod out water throughout minigame. 
RegisterNUICallback('closed',function(data)
  Fishing.SettingDepth = false
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  if data then 
    if data.notif == true then 
      Fishing.ShowNotification(data.text)
    end
  end
  Fishing.RodInHand()
end)
--- MINIGAME CALLBACKS

Fishing.OpenUI = function(depth)
  SendNUIMessage({
    message   = "depth",
    ui        = "minigame",
    maxDepth  = depth,
    reelDepth = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].DepthLimit,
    HookDepth  = Fishing.MiniGameSettings.HookDepth, 
    reelSpeed = Fishing.MiniGameSettings.ReelSpeed,
  })
  SetNuiFocus(true,true)

  Fishing.SettingDepth = true
  while Fishing.SettingDepth do
    Fishing.ShowHelpNotification(Labels.FishingControls)
    Wait(0)
  end
end

--- when a fish is biting
RegisterNUICallback('biting',function(data)
  Fishing.SettingDepth = false
  SetNuiFocus(false,false)
  Fishing.MiniGameSettings.HookDepth = data.depth 
  Fishing.GetFishies()
  if #Fishing.FishesAvailableAtCurrentHookDepth >= 1 then 
    Fishing.MiniGameSettings.RewardFish = Fishing.FishesAvailableAtCurrentHookDepth[math.random(#Fishing.FishesAvailableAtCurrentHookDepth)]
    Fishing.CalculateMiniGameSettings() 
    if Fishing.MiniGameSettings.RewardFish == "whale" then 
      if Config.ChanceWhalePullsYouIn >= math.random(100) then 
        Fishing.BeJonah()
      else
        Fishing.StartMinigame()
      end
    else
      Fishing.StartMinigame()
    end
  else 
    local FacingWater,depth = Fishing.CheckNearWater()
    Fishing.ShowNotification(Labels.NoFishBiting)
    Fishing.OpenUI(depth)
  end
end)

Fishing.StartMinigame = function()
  SetNuiFocus(true,true)
  SendNUIMessage({
    message   = "minigame",
    ui        = "minigame",
    fishSpeed = Fishing.MiniGameSettings.FishSpeed,
    fishStrength = Fishing.MiniGameSettings.FishStrength,
    equipStrength = Fishing.MiniGameSettings.OverallEquipmentStrength,
    fightChance = Fishing.MiniGameSettings.FishFightChance,
  })
end

-- Event on Successful Catch

RegisterNUICallback('success',function()
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  Fishing.ShowNotification(string.format(Labels.FishCaught, Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Name))
  Fishing.ThrowFishAtPlayer()
  TriggerServerEvent("Fishing:AddItem",Fishing.MiniGameSettings.RewardFish)
  Fishing.RemoveBait()
  Fishing.ShowNotification(Labels.BaitLost)
  Fishing.RodInHand()
end)

RegisterNUICallback('failed',function()
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  if Config.ChanceOfEquipmentBreakOnFail >= math.random(100) then 
    Fishing.ShowNotification(Labels.LineBroke)
    Fishing.CurrentRodSetup.hook = false
    Fishing.CurrentRodSetup.line = false
    Fishing.RemoveBait()
  end
  Fishing.RodInHand()
end)



Fishing.CalculateMiniGameSettings = function()
  
  Fishing.MiniGameSettings.RewardFish = Fishing.FishesAvailableAtCurrentHookDepth[math.random(#Fishing.FishesAvailableAtCurrentHookDepth)]
  Fishing.MiniGameSettings.FishStrength = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Strength
  Fishing.MiniGameSettings.FishSpeed = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Speed
  Fishing.MiniGameSettings.FishFightChance = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].ChanceOfFight
  Fishing.OverallEquipmentStrength()
  Fishing.GetDifficultyDifference()  
end

Fishing.GetDifficultyDifference = function()
  -- Gets the difficulty by comparing the difference between fish strength and OverallEquipmentStrength
  local Decrease = Fishing.MiniGameSettings.OverallEquipmentStrength - Fishing.MiniGameSettings.FishStrength
  local Difficulty = Decrease/Fishing.MiniGameSettings.OverallEquipmentStrength * 100
  Fishing.MiniGameSettings.MiniGameDifficulty = Difficulty/100
end

Fishing.OverallEquipmentStrength = function()
  local RodStrength  = Config.FishingEquipment['rodtype'][Fishing.CurrentRodSetup.rodtype].Strength
  local HookStrength = Config.FishingEquipment['hook'][Fishing.CurrentRodSetup.hook].Strength
  local ReelStrength = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].Strength
  local LineStrength = Config.FishingEquipment['line'][Fishing.CurrentRodSetup.line].Strength
  Fishing.MiniGameSettings.OverallEquipmentStrength = RodStrength + HookStrength + ReelStrength + LineStrength  
end


Fishing.AbandonRod = function()
  DeleteEntity(Fishing.CurrentRodSetup.rodobj)
  Fishing.CurrentRodSetup.rodobj  = false
  Fishing.CurrentRodSetup.rodtype = false
  for k,v in pairs(Fishing.CurrentRodSetup) do 
    if v ~= false and k ~= 'rodobj' and k ~= 'rodtype' then 
      TriggerServerEvent("Fishing:AddItem", v)
        SendNUIMessage({
          message  = "Clear",
          name    = v,
          type      = k,
          ui       = "loadout",
        })
      v = false
    end
  end
end

Fishing.RemoveBait = function()
  SendNUIMessage({
    message  = "ClearBait",
    name    = Fishing.CurrentRodSetup.bait,
    type      = "bait",
    ui       = "loadout",

  })
  Fishing.CurrentRodSetup.bait = false
end

Fishing.TakeOutRod = function(rodtype, rodname)
  Config.CloseInventory()

  if Fishing.CurrentRodSetup.rodobj == false then 
    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
      local ped = GetPlayerPed(-1)
      local pedPos = GetEntityCoords(ped)
      local fishingRodHash = `prop_fishing_rod_01`

      Fishing.WaitForModel(fishingRodHash)
     
      local rodHandle = CreateObject(fishingRodHash, pedPos, true)
      Fishing.CurrentRodSetup.rodobj = rodHandle

      AttachEntityToEntity(rodHandle, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)

      SetModelAsNoLongerNeeded(fishingRodHash)
      Fishing.CurrentRodSetup.rodtype = rodtype
      Fishing.ShowNotification(Labels.TakenRodOut..rodname..'.')
      SetCurrentPedWeapon(ped, "WEAPON_UNARMED")
      Fishing.RodInHand()
    else
      Fishing.ShowNotification(Labels.NoRodInVehicle)
    end
  else
    Fishing.ShowNotification(Labels.AlreadyHoldingRod..rodname..'.')
  end
end

RegisterNetEvent("FishingSim:TakeOutRod")
AddEventHandler("FishingSim:TakeOutRod", Fishing.TakeOutRod)

RegisterNetEvent("Fishing:AbandonRod")
AddEventHandler("Fishing:AbandonRod", Fishing.AbandonRod)



Fishing.RodInHand = function()
  while true do 
    Wait(1)
    Fishing.ShowHelpNotification(Labels.MainControls)
    if IsControlJustPressed(0,58) then 
      if Fishing.CanFish() then 
        local ped = GetPlayerPed(-1)
        if Fishing.IsFishing then return end
        Fishing.IsFishing = true

        Fishing.PlayAnimation(ped, "mini@tennis", "forehand_ts_md_far", {
            ["flag"] = 48
        })

        while IsEntityPlayingAnim(ped, "mini@tennis", "forehand_ts_md_far", 3) do
            Wait(0)
        end

        Fishing.PlayAnimation(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", {
            ["flag"] = 11
        })

        local startedBaiting = GetGameTimer()
        local TimeToHook = math.random(Config.MinTimeToCatch * 1000, Config.MaxTimeToCatch * 1000)
        local FacingWater,depth = Fishing.CheckNearWater()
        Fishing.MiniGameSettings.ReelSpeed = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].Speed
        --Fishing.CalculateMiniGameSettings()
        Fishing.OpenUI(depth)
        Fishing.IsFishing = false
        break
      end
    end

    if IsControlJustPressed(0,256) then
      Fishing.CancelFishing()
      Fishing.IsFishing = false
      break
    end 

    if IsControlJustPressed(0,29) then 
      Fishing.OpenLoadout()
      Fishing.IsFishing = false
      break
    end
  end
end 

Fishing.CancelFishing = function()
  Fishing.AbandonRod()
  ClearPedTasks(GetPlayerPed(-1))
end

Fishing.RodReady = function()
  local Ready = true
  for k,v in pairs(Fishing.CurrentRodSetup) do 
    if v == false then 
      Ready = false
    end
  end
  return Ready
end


RegisterNetEvent("Fishing:FishFinder", function()
  if IsPedSwimming(GetPlayerPed(-1)) then Fishing.ShowNotification(Labels.NotHere) return false; end
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then Fishing.ShowNotification(Labels.NotHere) return false; end 
  local FacingWater,depth = Fishing.CheckNearWater()
  if not FacingWater then Fishing.ShowNotification(Labels.NotHere) return false; end
  TaskStartScenarioInPlace(GetPlayerPed(-1), 'PROP_HUMAN_BUM_BIN', -1,true)
  Wait(Config.FishFinder.TimeToFind * 1000)
  ClearPedTasks(GetPlayerPed(-1))
  ClearPedTasksImmediately(GetPlayerPed(-1))
  local res = {}
  for fish,ft in pairs(Config.FishTypes) do
    if ft.Depth <= depth then 
      table.insert(res, string.format(Labels.DepthInfo, ft.Name, ft.Depth, ft.DepthLimit))
      Fishing.ShowNotification(string.format(Labels.DepthInfo, ft.Name, ft.Depth, ft.DepthLimit), 7500)
    end
  end
end)

Fishing.CanFish = function()
  if not IsPedSwimming(GetPlayerPed(-1)) then 
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then    
      local FacingWater,depth = Fishing.CheckNearWater()
      if FacingWater ~= false then 
        if Fishing.RodReady() then 
          MaxDepth = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].DepthLimit
          randomDepth = math.random(MaxDepth)
          hookDepth   = math.min(depth,randomDepth)  
          Fishing.MiniGameSettings.HookDepth = math.floor(hookDepth + 0.5)
          return true
        else
          Fishing.ShowNotification(Labels.SetRodProperly)
          return false
        end
      else
        Fishing.ShowNotification(Labels.FaceWater)
        return false
      end
    else
      Fishing.ShowNotification(Labels.FishFromVehicle)
      return false
    end
  else
    Fishing.ShowNotification(Labels.FishAndSwim)
    return false
  end
end

Fishing.GetFishies = function()
  local res = {}
  for fish,fishType in pairs(Config.FishTypes) do
    for _,baitType in ipairs(fishType.BaitTypes) do
      if baitType == Fishing.CurrentRodSetup.bait then 
        if Fishing.MiniGameSettings.HookDepth >= fishType.Depth then 
          if Fishing.MiniGameSettings.HookDepth <= fishType.DepthLimit then
            for k,v in ipairs(fishType.HookTypes) do
              if v == Fishing.CurrentRodSetup.hook then 
                Fishing.FishesAvailable = true 
                table.insert(res, fish)
              end
            end
          end
        end
      end
    end
  end
  Fishing.FishesAvailableAtCurrentHookDepth = res
end


Enums = {}
Enums.Materials = {
    ["WoodSolidSmall"] = 3895095068,
    ["VfxMetalElectrified"] = 3985833031,
    ["PHYSPOOLTABLEBALL"] = 3546625734,
    ["VFXMETALSTEAM"] = 3603690002,
    ["temp02"] = 2316997185,
    ["GRAVELTRAINTRACK"] = 1925605558,
    ["Temp11"] = 47470226,
    ["mudsoft"] = 1635937914,
    ["sandcompact"] = 510490462,
    ["RUMBLESTRIP"] = 4044799021,
    ["ClayHard"] = 1144315879,
    ["LowerArmLeft"] = 1045062756,
    ["HandRight"] = 2000961972,
    ["METALHOLLOWLARGE"] = 3711753465,
    ["carglassmedium"] = 602884284,
    ["HandLeft"] = 113101985,
    [3848931141] = "ShinRight",
    ["Oil"] = 3660485991,
    ["CARMETAL"] = 4201905313,
    ["Temp21"] = 3257211236,
    [2253637325] = "Leaves",
    [3528912198] = "FibreglassHollow",
    ["TEMP18"] = 1354993138,
    ["metalsolidsmall"] = 2847687191,
    ["temp14"] = 3649011722,
    ["GRAVELSMALL"] = 951832588,
    ["TARMAC"] = 282940568,
    ["LEATHER"] = 3724496396,
    ["PHYSCASTER"] = 4059664613,
    [2221655295] = "Plastic",
    [746881105] = "Temp01",
    ["SPINE0"] = 2372680412,
    [1761524221] = "MetalDuct",
    [3895095068] = "WoodSolidSmall",
    ["MetalSolidMedium"] = 3929336056,
    ["temp18"] = 1354993138,
    ["oil"] = 3660485991,
    ["TEMP28"] = 3115293198,
    ["temp10"] = 63305994,
    [1926285543] = "FootLeft",
    ["dirttrack"] = 2409420175,
    ["ConcretePavement"] = 2015599386,
    ["Temp14"] = 3649011722,
    [673696729] = "SlattedBlinds",
    ["Temp05"] = 2901304848,
    ["PAPER"] = 474149820,
    [2898482353] = "CarpetFloorboard",
    ["Rubber"] = 4149231379,
    ["MetalHollowMedium"] = 1849540536,
    [808719444] = "Foam",
    ["Temp28"] = 3115293198,
    ["carglassbulletproof"] = 2573051366,
    ["OIL"] = 3660485991,
    ["muddeep"] = 1109728704,
    ["Bushes"] = 581794674,
    ["mudhard"] = 2352068586,
    ["FOOTLEFT"] = 1926285543,
    ["Temp10"] = 63305994,
    ["TarmacPainted"] = 2993614768,
    ["TEMP10"] = 63305994,
    ["ConcreteDusty"] = 3210327185,
    ["LOWERARMRIGHT"] = 1777921590,
    ["concretedusty"] = 3210327185,
    ["sandloose"] = 2699818980,
    ["GlassOpaque"] = 1500272081,
    ["temp05"] = 2901304848,
    ["SandstoneBrittle"] = 1913209870,
    ["lowerarmright"] = 1777921590,
    ["THIGHLEFT"] = 3834431425,
    ["MARSHDEEP"] = 1584636462,
    ["WOODHOLLOWMEDIUM"] = 3929491133,
    [2901304848] = "Temp05",
    ["LAMINATE"] = 1845676458,
    [2130571536] = "CarSofttopClear",
    ["metalrailing"] = 2100727187,
    [113101985] = "HandLeft",
    ["METALSOLIDROADSURFACE"] = 3565854962,
    [1923995104] = "Temp04",
    ["TEMP06"] = 1061250033,
    [1755188853] = "RoofTile",
    ["gravelsmall"] = 951832588,
    ["SandTrack"] = 2387446527,
    ["WoodOldCreaky"] = 722686013,
    ["Polystyrene"] = 2538039965,
    ["PUDDLE"] = 999829011,
    ["PHYSCARVOID"] = 1345867677,
    [1078418101] = "Temp29",
    ["SANDWET"] = 909950165,
    ["MudUnderwater"] = 4021477129,
    ["Temp25"] = 1952288305,
    ["SnowLoose"] = 2357397706,
    ["Temp18"] = 1354993138,
    ["physgolfball"] = 2601153738,
    ["metalchainlinklarge"] = 125958708,
    ["temp15"] = 2710969365,
    ["CLOTH"] = 122789469,
    ["sandstonebrittle"] = 1913209870,
    ["CARSOFTTOP"] = 3315319434,
    ["polystyrene"] = 2538039965,
    [3154854427] = "Spine1",
    ["CarMetal"] = 4201905313,
    [2247498441] = "PhysDynamicCoverBound",
    ["Tarpaulin"] = 3652308448,
    [3158909604] = "SandUnderwater",
    ["PHYSCASTERRUSTY"] = 2016463089,
    ["TEMP20"] = 2242086891,
    ["SANDSTONESOLID"] = 592446772,
    [2885912856] = "CardboardBox",
    ["Woodchips"] = 3985845843,
    ["PhysCasterRusty"] = 2016463089,
    ["temp08"] = 1343679702,
    [868733839] = "FreshMeat",
    ["TEMP24"] = 1963820161,
    ["Temp15"] = 2710969365,
    ["Marsh"] = 223086562,
    ["VFXMETALFLAME"] = 332778253,
    ["BrickPavement"] = 3147605720,
    ["metalhollowlarge"] = 3711753465,
    ["carglassweak"] = 1247281098,
    ["Laminate"] = 1845676458,
    [3108646581] = "Ceramic",
    [3929336056] = "MetalSolidMedium",
    ["GLASSBULLETPROOF"] = 244521486,
    ["plastichighdensity"] = 2668971817,
    ["MetalGrille"] = 3868849285,
    ["woodchips"] = 3985845843,
    ["Temp08"] = 1343679702,
    [2206792300] = "StuntRampSurface",
    [3565854962] = "MetalSolidRoadSurface",
    ["physpooltablesurface"] = 605776921,
    ["marsh"] = 223086562,
    ["woodsolidpolished"] = 126470059,
    ["temp11"] = 47470226,
    ["CARDBOARDSHEET"] = 236511221,
    ["SandLoose"] = 2699818980,
    [4044799021] = "RumbleStrip",
    [2877802565] = "RoofFelt",
    [2699818980] = "SandLoose",
    ["CarGlassMedium"] = 602884284,
    [3124923563] = "PhysElectricFence",
    [1187676648] = "Concrete",
    ["Temp24"] = 1963820161,
    ["METALCORRUGATEDIRON"] = 834144982,
    ["PlasticClear"] = 2435246283,
    [282940568] = "Tarmac",
    [581794674] = "Bushes",
    ["rubberhollow"] = 3511032624,
    [1584636462] = "MarshDeep",
    [1026054937] = "Temp09",
    ["Temp13"] = 2657481383,
    ["CarEngine"] = 2378027672,
    ["phystennisball"] = 4038262533,
    ["RoofFelt"] = 2877802565,
    [1501153539] = "UpperArmRight",
    [1341866303] = "FeatherPillow",
    ["PLASTIC"] = 2221655295,
    [702596674] = "Temp12",
    ["Plastic"] = 2221655295,
    [32752644] = "Spine3",
    ["TEMP21"] = 3257211236,
    ["Water"] = 435688960,
    ["CarSofttop"] = 3315319434,
    [2601153738] = "PhysGolfBall",
    ["Perspex"] = 2675173228,
    [2352068586] = "MudHard",
    ["featherpillow"] = 1341866303,
    ["TEMP03"] = 1911121241,
    ["MudPothole"] = 312396330,
    ["STUNTRAMPSURFACE"] = 2206792300,
    ["ICETARMAC"] = 2363942873,
    ["plasticclear"] = 2435246283,
    ["WOODFLOORDUSTY"] = 3545514974,
    ["FIBREGLASSHOLLOW"] = 3528912198,
    [762193613] = "MetalChainlinkSmall",
    [1635937914] = "MudSoft",
    ["tvscreen"] = 1429989756,
    ["plastic"] = 2221655295,
    ["temp07"] = 2529443614,
    ["water"] = 435688960,
    [1619704960] = "SnowDeep",
    ["UPPERARMRIGHT"] = 1501153539,
    ["Hay"] = 2461440131,
    [1845676458] = "Laminate",
    ["FOAM"] = 808719444,
    ["WOODCHIPBOARD"] = 1176309403,
    ["PHYSELECTRICFENCE"] = 3124923563,
    [3938260814] = "GravelDeep",
    ["carpetsoliddusty"] = 158576196,
    ["snowtarmac"] = 1550304810,
    [5236042] = "Blood",
    ["Brick"] = 1639053622,
    [1011960114] = "Temp17",
    [4201905313] = "CarMetal",
    [3546625734] = "PhysPooltableBall",
    ["PhysPooltableSurface"] = 605776921,
    ["tarpaulin"] = 3652308448,
    ["TARMACPAINTED"] = 2993614768,
    ["WOODOLDCREAKY"] = 722686013,
    ["Ceramic"] = 3108646581,
    [998201806] = "VfxWoodBeerBarrel",
    ["PLASTICCLEAR"] = 2435246283,
    ["Concrete"] = 1187676648,
    [1144315879] = "ClayHard",
    ["vfxmetalflame"] = 332778253,
    ["VfxMetalFlame"] = 332778253,
    ["SandCompact"] = 510490462,
    ["WoodSolidPolished"] = 126470059,
    ["Temp03"] = 1911121241,
    ["COBBLESTONE"] = 576169331,
    ["MetalHollowLarge"] = 3711753465,
    ["metalsolidlarge"] = 752131025,
    ["VfxWoodBeerBarrel"] = 998201806,
    [3868849285] = "MetalGrille",
    ["RubberHollow"] = 3511032624,
    ["CLAVICLELEFT"] = 2825350831,
    ["PLASTICHOLLOW"] = 627123000,
    [2737678298] = "ClavicleRight",
    ["ceramic"] = 3108646581,
    ["perspex"] = 2675173228,
    ["ShinLeft"] = 652772852,
    [1925605558] = "GravelTrainTrack",
    [1913209870] = "SandstoneBrittle",
    [576169331] = "Cobblestone",
    [3649011722] = "Temp14",
    ["woodlattice"] = 2011204130,
    ["glassbulletproof"] = 244521486,
    ["carsofttopclear"] = 2130571536,
    ["CERAMIC"] = 3108646581,
    ["ConcretePothole"] = 359120722,
    ["head"] = 3559574543,
    ["SnowDeep"] = 1619704960,
    [3115293198] = "Temp28",
    ["ClavicleRight"] = 2737678298,
    ["BreezeBlock"] = 3340854742,
    [2782232023] = "Temp16",
    [937503243] = "GlassShootThrough",
    ["StuntRampSurface"] = 2206792300,
    ["grasslong"] = 3833216577,
    ["pavingslab"] = 1907048430,
    [3603690002] = "VfxMetalSteam",
    [2529443614] = "Temp07",
    ["EMISSIVEGLASS"] = 1501078253,
    [1333033863] = "Grass",
    ["woodfloordusty"] = 3545514974,
    ["physpooltablecushion"] = 972939963,
    ["FootLeft"] = 1926285543,
    ["TreeBark"] = 2379541433,
    ["woodsolidmedium"] = 555004797,
    ["rubber"] = 4149231379,
    [435688960] = "Water",
    ["Neck"] = 1718294164,
    ["SandWetDeep"] = 1288448767,
    ["Tvscreen"] = 1429989756,
    ["physdynamiccoverbound"] = 2247498441,
    ["SANDLOOSE"] = 2699818980,
    ["tarmacpainted"] = 2993614768,
    [834144982] = "MetalCorrugatedIron",
    ["lowerarmleft"] = 1045062756,
    ["PhysDynamicCoverBound"] = 2247498441,
    ["SandUnderwater"] = 3158909604,
    ["PhysCarVoid"] = 1345867677,
    [2519482235] = "Default",
    ["SPINE3"] = 32752644,
    ["MetalSolidRoadSurface"] = 3565854962,
    [765206029] = "Stone",
    [1945073303] = "Marble",
    ["Buttocks"] = 483400232,
    ["VFXMETALELECTRIFIED"] = 3985833031,
    ["ROCKNOINST"] = 127813971,
    ["CardboardBox"] = 2885912856,
    ["BRICK"] = 1639053622,
    ["carglassopaque"] = 513061559,
    ["Grass"] = 1333033863,
    [332778253] = "VfxMetalFlame",
    [3147605720] = "BrickPavement",
    ["laminate"] = 1845676458,
    [2409420175] = "DirtTrack",
    ["carpetsolid"] = 669292054,
    ["linoleum"] = 289630530,
    [15972667] = "MetalHollowSmall",
    [3493162850] = "Temp19",
    ["PlasticHighDensityClear"] = 2956494126,
    ["temp04"] = 1923995104,
    ["PAVINGSLAB"] = 1907048430,
    ["ice"] = 3508906581,
    ["woodhighdensity"] = 2552123904,
    [1059629996] = "EmissivePlastic",
    ["SandDryDeep"] = 509508168,
    ["WOODSOLIDSMALL"] = 3895095068,
    [513061559] = "CarGlassOpaque",
    [3511032624] = "RubberHollow",
    ["METALSOLIDLARGE"] = 752131025,
    ["Tarmac"] = 282940568,
    ["WOODCHIPS"] = 3985845843,
    ["WoodChipboard"] = 1176309403,
    [2379541433] = "TreeBark",
    [972939963] = "PhysPooltableCushion",
    ["GravelLarge"] = 2128369009,
    ["thighleft"] = 3834431425,
    [3315319434] = "CarSofttop",
    ["WoodHighDensity"] = 2552123904,
    ["metalsolidmedium"] = 3929336056,
    [1907048430] = "PavingSlab",
    ["EMISSIVEPLASTIC"] = 1059629996,
    ["plastichollowclear"] = 772722531,
    ["MetalManhole"] = 3539969597,
    ["metalcorrugatediron"] = 834144982,
    ["SANDCOMPACT"] = 510490462,
    ["WOODSOLIDLARGE"] = 815762359,
    [3416406407] = "SnowCompact",
    [2849806867] = "DriedMeat",
    [1550304810] = "SnowTarmac",
    ["TEMP01"] = 746881105,
    [2925830612] = "FootRight",
    [999829011] = "Puddle",
    ["ShinRight"] = 3848931141,
    ["CARPLASTIC"] = 2137197282,
    ["TEMP04"] = 1923995104,
    ["WOODHOLLOWSMALL"] = 1993976879,
    ["CarpetSolidDusty"] = 158576196,
    ["PHYSPOOLTABLECUSHION"] = 972939963,
    ["upperarmleft"] = 3784624938,
    [2538039965] = "Polystyrene",
    ["Petrol"] = 2660782956,
    ["CARPETSOLIDDUSTY"] = 158576196,
    [3724496396] = "Leather",
    ["plastersolid"] = 3720844863,
    ["carplastic"] = 2137197282,
    ["WOODSOLIDPOLISHED"] = 126470059,
    ["temp26"] = 3178714198,
    ["TREEBARK"] = 2379541433,
    ["GLASSOPAQUE"] = 1500272081,
    [772722531] = "PlasticHollowClear",
    ["SandWet"] = 909950165,
    ["PLASTICHIGHDENSITY"] = 2668971817,
    [3985845843] = "Woodchips",
    ["glassopaque"] = 1500272081,
    ["fibreglass"] = 1354180827,
    [592446772] = "SandstoneSolid",
    [509508168] = "SandDryDeep",
    ["snowloose"] = 2357397706,
    ["PHYSDYNAMICCOVERBOUND"] = 2247498441,
    [605776921] = "PhysPooltableSurface",
    ["sandwet"] = 909950165,
    [3720844863] = "PlasterSolid",
    [3178714198] = "Temp26",
    [752131025] = "MetalSolidLarge",
    ["UpperArmLeft"] = 3784624938,
    [2016463089] = "PhysCasterRusty",
    [1993976879] = "WoodHollowSmall",
    ["DEFAULT"] = 2519482235,
    ["Twigs"] = 3381615457,
    [2657481383] = "Temp13",
    ["SlattedBlinds"] = 673696729,
    ["woodoldcreaky"] = 722686013,
    ["RUBBER"] = 4149231379,
    ["PLASTICHOLLOWCLEAR"] = 772722531,
    ["temp23"] = 465002639,
    ["WoodFloorDusty"] = 3545514974,
    ["CARENGINE"] = 2378027672,
    ["TWIGS"] = 3381615457,
    [1457572381] = "Spine2",
    [244521486] = "GlassBulletproof",
    ["MUDSOFT"] = 1635937914,
    ["PHYSPEDCAPSULE"] = 4003336261,
    ["WOODHIGHDENSITY"] = 2552123904,
    ["SnowTarmac"] = 1550304810,
    ["CARPETFLOORBOARD"] = 2898482353,
    [3381615457] = "Twigs",
    ["gravellarge"] = 2128369009,
    ["Leaves"] = 2253637325,
    [3545514974] = "WoodFloorDusty",
    [1441114862] = "BushesNoinst",
    ["CONCRETEDUSTY"] = 3210327185,
    ["THIGHRIGHT"] = 4057986041,
    ["CARGLASSOPAQUE"] = 513061559,
    [4043078398] = "PlasterBrittle",
    ["Soil"] = 3594309083,
    ["GrassLong"] = 3833216577,
    ["Fibreglass"] = 1354180827,
    ["ThighLeft"] = 3834431425,
    ["TEMP09"] = 1026054937,
    ["METALRAILING"] = 2100727187,
    ["twigs"] = 3381615457,
    ["footleft"] = 1926285543,
    ["PlasterBrittle"] = 4043078398,
    ["METALHOLLOWMEDIUM"] = 1849540536,
    ["marble"] = 1945073303,
    ["woodsolidsmall"] = 3895095068,
    [1061250033] = "Temp06",
    [1109728704] = "MudDeep",
    ["glassshootthrough"] = 937503243,
    ["MetalChainlinkSmall"] = 762193613,
    ["slattedblinds"] = 673696729,
    ["SNOWLOOSE"] = 2357397706,
    ["RockMossy"] = 4170197704,
    ["physelectricfence"] = 3124923563,
    [2825350831] = "ClavicleLeft",
    [2000961972] = "HandRight",
    ["METALCHAINLINKSMALL"] = 762193613,
    ["WoodHollowSmall"] = 1993976879,
    ["PhysCaster"] = 4059664613,
    ["woodhollowsmall"] = 1993976879,
    ["carengine"] = 2378027672,
    ["clayhard"] = 1144315879,
    [1176309403] = "WoodChipboard",
    ["sandtrack"] = 2387446527,
    [2435246283] = "PlasticClear",
    ["WOODSOLIDMEDIUM"] = 555004797,
    ["soil"] = 3594309083,
    ["rumblestrip"] = 4044799021,
    ["FootRight"] = 2925830612,
    ["GrassShort"] = 3008270349,
    ["ROCKMOSSY"] = 4170197704,
    ["marshdeep"] = 1584636462,
    ["MudHard"] = 2352068586,
    ["thighright"] = 4057986041,
    ["Default"] = 2519482235,
    ["handleft"] = 113101985,
    [127813971] = "RockNoinst",
    ["temp24"] = 1963820161,
    [1666473731] = "PhysNoFriction",
    ["PLASTICHIGHDENSITYCLEAR"] = 2956494126,
    ["PETROL"] = 2660782956,
    [815762359] = "WoodSolidLarge",
    [2956494126] = "PlasticHighDensityClear",
    [2357397706] = "SnowLoose",
    ["upperarmright"] = 1501153539,
    ["PhysElectricFence"] = 3124923563,
    ["temp29"] = 1078418101,
    ["HAY"] = 2461440131,
    ["CardboardSheet"] = 236511221,
    ["grass"] = 1333033863,
    ["ANIMALDEFAULT"] = 286224918,
    ["Marble"] = 1945073303,
    [4170197704] = "RockMossy",
    ["METALGARAGEDOOR"] = 4063706601,
    ["CARDBOARDBOX"] = 2885912856,
    ["MetalRailing"] = 2100727187,
    [2363942873] = "IceTarmac",
    ["MUDPOTHOLE"] = 312396330,
    ["Spine3"] = 32752644,
    [2015599386] = "ConcretePavement",
    ["LOWERARMLEFT"] = 1045062756,
    ["graveldeep"] = 3938260814,
    ["SNOWDEEP"] = 1619704960,
    ["GravelSmall"] = 951832588,
    [3508906581] = "Ice",
    ["MudSoft"] = 1635937914,
    ["metalsolidroadsurface"] = 3565854962,
    [2668971817] = "PlasticHighDensity",
    ["Head"] = 3559574543,
    ["sandstonesolid"] = 592446772,
    ["TEMP15"] = 2710969365,
    ["PlasterSolid"] = 3720844863,
    ["RumbleStrip"] = 4044799021,
    [2993614768] = "TarmacPainted",
    [3594309083] = "Soil",
    ["SANDWETDEEP"] = 1288448767,
    ["PhysNoFriction"] = 1666473731,
    ["GRASSSHORT"] = 3008270349,
    [3784624938] = "UpperArmLeft",
    ["physnofriction"] = 1666473731,
    ["RoofTile"] = 1755188853,
    ["MarshDeep"] = 1584636462,
    ["rocknoinst"] = 127813971,
    ["leaves"] = 2253637325,
    ["mudpothole"] = 312396330,
    ["Foam"] = 808719444,
    ["clavicleleft"] = 2825350831,
    [13626292] = "Temp30",
    ["temp06"] = 1061250033,
    ["CONCRETEPOTHOLE"] = 359120722,
    ["woodhighfriction"] = 2154880249,
    [2378027672] = "CarEngine",
    ["VfxMetalWaterTower"] = 611561919,
    ["BLOOD"] = 5236042,
    ["MetalCorrugatedIron"] = 834144982,
    ["woodhollowmedium"] = 3929491133,
    ["DRIEDMEAT"] = 2849806867,
    [951832588] = "GravelSmall",
    [1070994698] = "CarGlassStrong",
    ["metalchainlinksmall"] = 762193613,
    ["TEMP14"] = 3649011722,
    ["LINOLEUM"] = 289630530,
    ["CARGLASSWEAK"] = 1247281098,
    ["cardboardbox"] = 2885912856,
    ["treebark"] = 2379541433,
    [3985833031] = "VfxMetalElectrified",
    [126470059] = "WoodSolidPolished",
    ["MetalSolidLarge"] = 752131025,
    ["Temp12"] = 702596674,
    [359120722] = "ConcretePothole",
    ["SHINLEFT"] = 652772852,
    [1500272081] = "GlassOpaque",
    [4149231379] = "Rubber",
    ["hay"] = 2461440131,
    [652772852] = "ShinLeft",
    ["stuntrampsurface"] = 2206792300,
    ["PLASTERBRITTLE"] = 4043078398,
    ["foam"] = 808719444,
    ["CarPlastic"] = 2137197282,
    ["metalgaragedoor"] = 4063706601,
    [3539969597] = "MetalManhole",
    [3340854742] = "BreezeBlock",
    ["sandwetdeep"] = 1288448767,
    [2675173228] = "Perspex",
    [2461440131] = "Hay",
    ["MetalSolidSmall"] = 2847687191,
    ["grassshort"] = 3008270349,
    ["METALSOLIDSMALL"] = 2847687191,
    [2847687191] = "MetalSolidSmall",
    ["BUSHES"] = 581794674,
    ["default"] = 2519482235,
    [1501078253] = "EmissiveGlass",
    ["GlassShootThrough"] = 937503243,
    ["EmissivePlastic"] = 1059629996,
    [3559574543] = "Head",
    [3660485991] = "Oil",
    ["sanddrydeep"] = 509508168,
    ["physpedcapsule"] = 4003336261,
    [1345867677] = "PhysCarVoid",
    ["ROOFFELT"] = 2877802565,
    ["TARPAULIN"] = 3652308448,
    ["fibreglasshollow"] = 3528912198,
    ["rooftile"] = 1755188853,
    ["FeatherPillow"] = 1341866303,
    [555004797] = "WoodSolidMedium",
    ["FRESHMEAT"] = 868733839,
    ["sandunderwater"] = 3158909604,
    ["GravelDeep"] = 3938260814,
    ["metalmanhole"] = 3539969597,
    [627123000] = "PlasticHollow",
    ["WoodSolidMedium"] = 555004797,
    [2387446527] = "SandTrack",
    [2372680412] = "Spine0",
    [63305994] = "Temp10",
    ["clavicleright"] = 2737678298,
    ["vfxmetalelectrified"] = 3985833031,
    ["temp12"] = 702596674,
    ["BushesNoinst"] = 1441114862,
    ["Temp16"] = 2782232023,
    ["TEMP23"] = 465002639,
    ["CLAVICLERIGHT"] = 2737678298,
    ["SLATTEDBLINDS"] = 673696729,
    [602884284] = "CarGlassMedium",
    ["snowcompact"] = 3416406407,
    [3257211236] = "Temp21",
    ["Leather"] = 3724496396,
    ["metalgrille"] = 3868849285,
    [1911121241] = "Temp03",
    [4038262533] = "PhysTennisBall",
    ["ClaySoft"] = 560985072,
    ["SOIL"] = 3594309083,
    ["TEMP27"] = 889255498,
    [1288448767] = "SandWetDeep",
    ["Rock"] = 3454750755,
    ["temp20"] = 2242086891,
    [560985072] = "ClaySoft",
    ["freshmeat"] = 868733839,
    ["CarGlassWeak"] = 1247281098,
    ["SANDSTONEBRITTLE"] = 1913209870,
    ["MUDUNDERWATER"] = 4021477129,
    [4063706601] = "MetalGarageDoor",
    ["TEMP05"] = 2901304848,
    ["PHYSTENNISBALL"] = 4038262533,
    [1045062756] = "LowerArmLeft",
    ["Temp06"] = 1061250033,
    ["FOOTRIGHT"] = 2925830612,
    ["temp13"] = 2657481383,
    [1963820161] = "Temp24",
    [2573051366] = "CarGlassBulletproof",
    [3008270349] = "GrassShort",
    ["temp16"] = 2782232023,
    ["PHYSGOLFBALL"] = 2601153738,
    ["PlasticHighDensity"] = 2668971817,
    ["FIBREGLASS"] = 1354180827,
    ["IceTarmac"] = 2363942873,
    [289630530] = "Linoleum",
    ["STONE"] = 765206029,
    ["Temp01"] = 746881105,
    ["Temp23"] = 465002639,
    ["spine0"] = 2372680412,
    ["brick"] = 1639053622,
    ["TEMP26"] = 3178714198,
    ["footright"] = 2925830612,
    ["METALMANHOLE"] = 3539969597,
    [125958708] = "MetalChainlinkLarge",
    ["rock"] = 3454750755,
    ["Temp20"] = 2242086891,
    ["carpetfloorboard"] = 2898482353,
    ["BUTTOCKS"] = 483400232,
    ["CARGLASSSTRONG"] = 1070994698,
    ["spine1"] = 3154854427,
    ["tarmac"] = 282940568,
    ["MetalHollowSmall"] = 15972667,
    ["Temp30"] = 13626292,
    ["Temp19"] = 3493162850,
    ["CARSOFTTOPCLEAR"] = 2130571536,
    [286224918] = "AnimalDefault",
    ["physbarbedwire"] = 2751643840,
    ["bushesnoinst"] = 1441114862,
    [312396330] = "MudPothole",
    ["carmetal"] = 4201905313,
    ["NECK"] = 1718294164,
    ["GRASS"] = 1333033863,
    [1777921590] = "LowerArmRight",
    [2100727187] = "MetalRailing",
    ["WATER"] = 435688960,
    ["TEMP13"] = 2657481383,
    [236511221] = "CardboardSheet",
    ["PhysBarbedWire"] = 2751643840,
    ["carglassstrong"] = 1070994698,
    ["metalhollowmedium"] = 1849540536,
    ["LowerArmRight"] = 1777921590,
    ["CarpetFloorboard"] = 2898482353,
    ["Temp17"] = 1011960114,
    ["PavingSlab"] = 1907048430,
    ["MUDDEEP"] = 1109728704,
    [4057986041] = "ThighRight",
    [2552123904] = "WoodHighDensity",
    ["CONCRETEPAVEMENT"] = 2015599386,
    [3674578943] = "Temp22",
    [3833216577] = "GrassLong",
    ["carsofttop"] = 3315319434,
    ["vfxmetalsteam"] = 3603690002,
    ["METALCHAINLINKLARGE"] = 125958708,
    ["temp19"] = 3493162850,
    ["CARGLASSBULLETPROOF"] = 2573051366,
    ["CarSofttopClear"] = 2130571536,
    [2154880249] = "WoodHighFriction",
    [1429989756] = "Tvscreen",
    ["woodchipboard"] = 1176309403,
    ["PhysPooltableBall"] = 3546625734,
    ["WoodHollowLarge"] = 3369548007,
    ["PLASTERSOLID"] = 3720844863,
    ["neck"] = 1718294164,
    ["shinleft"] = 652772852,
    ["GRASSLONG"] = 3833216577,
    ["PlasticHollowClear"] = 772722531,
    ["UPPERARMLEFT"] = 3784624938,
    ["CarGlassStrong"] = 1070994698,
    ["spine2"] = 1457572381,
    ["PhysElectricMetal"] = 2281206151,
    ["leather"] = 3724496396,
    ["EmissiveGlass"] = 1501078253,
    [3210327185] = "ConcreteDusty",
    ["Ice"] = 3508906581,
    ["TVSCREEN"] = 1429989756,
    [3929491133] = "WoodHollowMedium",
    ["TEMP22"] = 3674578943,
    ["MudDeep"] = 1109728704,
    ["TEMP30"] = 13626292,
    [122789469] = "Cloth",
    ["SNOWCOMPACT"] = 3416406407,
    ["GlassBulletproof"] = 244521486,
    ["CLAYHARD"] = 1144315879,
    ["SANDTRACK"] = 2387446527,
    ["DirtTrack"] = 2409420175,
    ["WoodHollowMedium"] = 3929491133,
    ["temp03"] = 1911121241,
    ["TEMP07"] = 2529443614,
    ["Temp04"] = 1923995104,
    ["Temp29"] = 1078418101,
    ["CarGlassBulletproof"] = 2573051366,
    [3369548007] = "WoodHollowLarge",
    [2011204130] = "WoodLattice",
    ["PhysGolfBall"] = 2601153738,
    ["RUBBERHOLLOW"] = 3511032624,
    ["puddle"] = 999829011,
    ["HANDLEFT"] = 113101985,
    ["Temp02"] = 2316997185,
    ["claysoft"] = 560985072,
    ["Temp09"] = 1026054937,
    ["SANDUNDERWATER"] = 3158909604,
    [2316997185] = "Temp02",
    ["VfxMetalSteam"] = 3603690002,
    ["CarGlassOpaque"] = 513061559,
    ["MetalChainlinkLarge"] = 125958708,
    ["TEMP08"] = 1343679702,
    ["Temp07"] = 2529443614,
    ["CLAYSOFT"] = 560985072,
    ["ROOFTILE"] = 1755188853,
    ["animaldefault"] = 286224918,
    [4021477129] = "MudUnderwater",
    ["Paper"] = 474149820,
    ["TEMP02"] = 2316997185,
    ["vfxmetalwatertower"] = 611561919,
    ["blood"] = 5236042,
    ["CARGLASSMEDIUM"] = 602884284,
    ["PhysPooltableCushion"] = 972939963,
    [611561919] = "VfxMetalWaterTower",
    [4003336261] = "PhysPedCapsule",
    ["driedmeat"] = 2849806867,
    ["concretepavement"] = 2015599386,
    ["LEAVES"] = 2253637325,
    ["DriedMeat"] = 2849806867,
    ["PlasticHollow"] = 627123000,
    ["CONCRETE"] = 1187676648,
    ["cobblestone"] = 576169331,
    [909950165] = "SandWet",
    ["Puddle"] = 999829011,
    ["FreshMeat"] = 868733839,
    ["plastichighdensityclear"] = 2956494126,
    [2660782956] = "Petrol",
    ["temp09"] = 1026054937,
    ["concrete"] = 1187676648,
    ["stone"] = 765206029,
    ["physelectricmetal"] = 2281206151,
    ["Spine2"] = 1457572381,
    ["SNOWTARMAC"] = 1550304810,
    ["WoodHighFriction"] = 2154880249,
    ["Temp27"] = 889255498,
    ["ROCK"] = 3454750755,
    [669292054] = "CarpetSolid",
    ["CARPETSOLID"] = 669292054,
    ["metalduct"] = 1761524221,
    ["paper"] = 474149820,
    ["PERSPEX"] = 2675173228,
    ["rooffelt"] = 2877802565,
    ["Blood"] = 5236042,
    ["Spine1"] = 3154854427,
    ["ClavicleLeft"] = 2825350831,
    ["PHYSELECTRICMETAL"] = 2281206151,
    [2242086891] = "Temp20",
    ["snowdeep"] = 1619704960,
    ["handright"] = 2000961972,
    ["AnimalDefault"] = 286224918,
    ["METALSOLIDMEDIUM"] = 3929336056,
    ["PHYSBARBEDWIRE"] = 2751643840,
    ["woodhollowlarge"] = 3369548007,
    ["mudunderwater"] = 4021477129,
    ["MARSH"] = 223086562,
    ["MetalGarageDoor"] = 4063706601,
    ["plasterbrittle"] = 4043078398,
    ["icetarmac"] = 2363942873,
    ["Spine0"] = 2372680412,
    ["temp27"] = 889255498,
    ["ICE"] = 3508906581,
    ["buttocks"] = 483400232,
    ["TEMP17"] = 1011960114,
    ["PHYSNOFRICTION"] = 1666473731,
    ["Linoleum"] = 289630530,
    [1343679702] = "Temp08",
    ["petrol"] = 2660782956,
    ["TEMP25"] = 1952288305,
    [2281206151] = "PhysElectricMetal",
    ["physcaster"] = 4059664613,
    ["breezeblock"] = 3340854742,
    ["WoodLattice"] = 2011204130,
    ["vfxwoodbeerbarrel"] = 998201806,
    ["Stone"] = 765206029,
    [2137197282] = "CarPlastic",
    ["POLYSTYRENE"] = 2538039965,
    ["VFXWOODBEERBARREL"] = 998201806,
    ["HEAD"] = 3559574543,
    ["RockNoinst"] = 127813971,
    ["rockmossy"] = 4170197704,
    ["PHYSPOOLTABLESURFACE"] = 605776921,
    ["SnowCompact"] = 3416406407,
    ["UpperArmRight"] = 1501153539,
    [1952288305] = "Temp25",
    ["WoodSolidLarge"] = 815762359,
    ["metalhollowsmall"] = 15972667,
    ["plastichollow"] = 627123000,
    ["SANDDRYDEEP"] = 509508168,
    [510490462] = "SandCompact",
    ["GLASSSHOOTTHROUGH"] = 937503243,
    ["TEMP19"] = 3493162850,
    [1886546517] = "TarmacPothole",
    ["graveltraintrack"] = 1925605558,
    ["MARBLE"] = 1945073303,
    ["tarmacpothole"] = 1886546517,
    [1354180827] = "Fibreglass",
    [2751643840] = "PhysBarbedWire",
    ["physcasterrusty"] = 2016463089,
    ["TEMP12"] = 702596674,
    ["WOODHOLLOWLARGE"] = 3369548007,
    ["TEMP29"] = 1078418101,
    [2710969365] = "Temp15",
    [223086562] = "Marsh",
    [3834431425] = "ThighLeft",
    ["Temp22"] = 3674578943,
    ["emissiveplastic"] = 1059629996,
    ["physcarvoid"] = 1345867677,
    ["GRAVELDEEP"] = 3938260814,
    ["temp28"] = 3115293198,
    ["METALGRILLE"] = 3868849285,
    ["BREEZEBLOCK"] = 3340854742,
    [1718294164] = "Neck",
    [722686013] = "WoodOldCreaky",
    [889255498] = "Temp27",
    ["temp01"] = 746881105,
    ["temp21"] = 3257211236,
    [158576196] = "CarpetSolidDusty",
    ["METALHOLLOWSMALL"] = 15972667,
    ["Cobblestone"] = 576169331,
    ["temp25"] = 1952288305,
    ["MetalDuct"] = 1761524221,
    ["cardboardsheet"] = 236511221,
    ["GRAVELLARGE"] = 2128369009,
    [2128369009] = "GravelLarge",
    ["Temp26"] = 3178714198,
    ["temp30"] = 13626292,
    [1639053622] = "Brick",
    ["SPINE2"] = 1457572381,
    ["HANDRIGHT"] = 2000961972,
    ["WOODLATTICE"] = 2011204130,
    [47470226] = "Temp11",
    ["PhysTennisBall"] = 4038262533,
    ["BUSHESNOINST"] = 1441114862,
    [1849540536] = "MetalHollowMedium",
    [3454750755] = "Rock",
    ["cloth"] = 122789469,
    ["temp22"] = 3674578943,
    ["BRICKPAVEMENT"] = 3147605720,
    ["physpooltableball"] = 3546625734,
    ["PhysPedCapsule"] = 4003336261,
    ["SHINRIGHT"] = 3848931141,
    ["brickpavement"] = 3147605720,
    ["TEMP11"] = 47470226,
    [465002639] = "Temp23",
    [1354993138] = "Temp18",
    ["GravelTrainTrack"] = 1925605558,
    ["TarmacPothole"] = 1886546517,
    ["TEMP16"] = 2782232023,
    ["MUDHARD"] = 2352068586,
    ["woodsolidlarge"] = 815762359,
    ["VFXMETALWATERTOWER"] = 611561919,
    ["CarpetSolid"] = 669292054,
    ["TARMACPOTHOLE"] = 1886546517,
    ["DIRTTRACK"] = 2409420175,
    ["METALDUCT"] = 1761524221,
    ["SPINE1"] = 3154854427,
    ["shinright"] = 3848931141,
    ["SandstoneSolid"] = 592446772,
    [3711753465] = "MetalHollowLarge",
    [3652308448] = "Tarpaulin",
    ["emissiveglass"] = 1501078253,
    ["bushes"] = 581794674,
    ["FibreglassHollow"] = 3528912198,
    ["ThighRight"] = 4057986041,
    [4059664613] = "PhysCaster",
    [1247281098] = "CarGlassWeak",
    ["FEATHERPILLOW"] = 1341866303,
    ["Cloth"] = 122789469,
    ["temp17"] = 1011960114,
    [483400232] = "Buttocks",
    ["WOODHIGHFRICTION"] = 2154880249,
    ["concretepothole"] = 359120722,
    ["spine3"] = 32752644,
    [474149820] = "Paper",
}


Fishing.CheckNearWater = function()
  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped) + (GetEntityForwardVector(ped) * 5.0)
  local zone = GetLabelText(GetNameOfZone(pos.x,pos.y,pos.z)):lower()

  local ray = StartShapeTestRay(pos.x,pos.y,pos.z+10.0, pos.x,pos.y,pos.z-1000.0, -1, ped, 1)
  local ret,hit,endPos,surfaceNorm,mat = GetShapeTestResultIncludingMaterial(ray)

  local material = Enums.Materials[mat%0x100000000]
  if material then
    material = material:lower()
    if material:find("wet") or material:find("water") or material:find("deep") or zone:find("river") or zone:find("sea") or zone:find("ocean") or zone:find("creek") then -- 412
      local r,d = GetWaterHeight(pos.x,pos.y,pos.z)
      local depth = #(vector3(endPos.x,endPos.y,d) - endPos)

      if depth < 0.1 and depth > -0.1 then
        depth = 0.1
      end

      if depth > 10.0 then
        if not zone:find("sea") and not zone:find("ocean") then
          depth = 5.0
        end
      end
      Fishing.MiniGameSettings.WaterDepth = math.floor(depth + 0.5)
      return true,math.floor(depth + 0.5)
    else
      Fishing.MiniGameSettings.WaterDepth = 0.0
      return false,0.0
    end
  else
    Fishing.MiniGameSettings.WaterDepth = 10000.0
    return true,10000.0
  end
end


Fishing.PlayAnimation = function(ped, dict, anim, settings)
	if dict then
    Citizen.CreateThread(function()
      RequestAnimDict(dict)

      while not HasAnimDictLoaded(dict) do
          Wait(100)
      end

      if settings == nil then
          TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
      else 
          local speed = 1.0
          local speedMultiplier = -1.0
          local duration = 1.0
          local flag = 0
          local playbackRate = 0

          if settings["speed"] then
              speed = settings["speed"]
          end

          if settings["speedMultiplier"] then
              speedMultiplier = settings["speedMultiplier"]
          end

          if settings["duration"] then
              duration = settings["duration"]
          end

          if settings["flag"] then
              flag = settings["flag"]
          end

          if settings["playbackRate"] then
              playbackRate = settings["playbackRate"]
          end

          TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
      end

      RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

Fishing.Callback = function(name,cb,...)
  if Config.UsingESX then
    ESX.TriggerServerCallback(name,cb,...)
  else
    QBCore.Functions.TriggerCallback(name,cb,...)
  end
end

Fishing.WaitForModel = function(model)
  if not IsModelValid(model) then
      return
  end

  if not HasModelLoaded(model) then
    RequestModel(model)
  end

  while not HasModelLoaded(model) do
    Wait(0)
  end
end


Fishing.PreviousSetup = {}

Fishing.BeJonah = function()
  --## Take entire set up
  SendNUIMessage({
    message = "close"
  })

  for k,v in pairs(Fishing.CurrentRodSetup) do 
    v = false
    Fishing.PreviousSetup[k] = v
  end
  Fishing.WhaleModel = 'a_c_humpback'
  Fishing.WhaleHash  = GetHashKey(Fishing.WhaleModel)

  RequestModel(Fishing.WhaleHash)
  while not HasModelLoaded(Fishing.WhaleHash) do Wait(0) end

  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped)
  local fwd = GetEntityForwardVector(ped)
  local targetPos = pos+(fwd*10.0)
  local head = GetEntityHeading(ped)

  local force = 2.0
  local dir   = vector3(0.0,0.0,10.0)*force

  SetPedToRagdoll(ped,100,0,0,false,false,false)
  Wait(0)

  ApplyForceToEntity(ped, 3, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)
  Wait(100)

  dir = (targetPos - pos)*force
  ApplyForceToEntity(ped, 3, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)

  targetPos = pos+(fwd*30.0)
  Fishing.Whale = CreatePed(28, Fishing.WhaleHash, targetPos.x,targetPos.y,-4.0, head-180.0, true,true)
  while not DoesEntityExist(Fishing.Whale) do Wait(0) end

  SetEntityAsMissionEntity(Fishing.Whale,true,true)
  TaskGoToEntity(Fishing.Whale,ped,-1,1.0,2.0,1073741824,0)  

  while not IsPedSwimming(ped) do Wait(0) end
  TriggerServerEvent("InteractSound_SV:PlayOnOne",GetPlayerServerId(PlayerId()),'whale',0.7)
  Wait(100)

  ApplyForceToEntity(ped, 3, 0.0,0.0,-100.0, 0.0,0.0,0.0, 0, false,false,true,false,true)
  Wait(500)

  DoScreenFadeOut(1000)
  Wait(1000)

  SetPlayerInvincible(PlayerId(),true)
  Wait(5000)

  targetPos = vector3(-3186.4697265625,770.73327636719,2.9782388210297)
  SetEntityCoords(ped,targetPos.x,targetPos.y,targetPos.z)

  targetPos = vector3(-3184.5104492188,765.33923339844,5.7522916793823)
  SetEntityCoords(Fishing.Whale,targetPos.x,targetPos.y,targetPos.z)
  SetEntityHeading(Fishing.Whale,0.0)
  SetEntityHealth(Fishing.Whale,0)

  SetPedToRagdoll(ped,5000,0,0,false,false,false)
  Wait(2000)

  DoScreenFadeIn(2500)
  Wait(2500) 

  SetEntityAsMissionEntity(Fishing.Whale,false,false)
  SetEntityAsNoLongerNeeded(Fishing.Whale)
  SetPlayerInvincible(PlayerId(),false)

  local infront = Fishing.GetCoordsInfront(Fishing.Whale)
  local _,z = GetGroundZFor_3dCoord(infront.x,infront.y,infront.z + 10.0,0)
  whalePos = vector3(infront.x,infront.y,z + 0.5)
end


Fishing.GetCoordsInfront = function(ent)
  local dmin,dmax = GetModelDimensions(GetEntityModel(ent))
  return GetEntityCoords(ent) + ((GetEntityForwardVector(ent) * dmax.y) * 0.5)
end

Citizen.CreateThread(function()
  while true do 
    local wait_time = 1000 
    if whalePos then 
      local c = GetEntityCoords(PlayerPedId())
      if #(c - whalePos) <= 5.0 then 
        wait_time = 0 
        Fishing.ShowHelpNotification("Press ~INPUT_PICKUP~ to hack up the whale")
        if IsControlJustPressed(0,38) then 
          Fishing.HackUpWhale(Fishing.Whale)
        end
      end
    end 
    Wait(wait_time)  
  end
end)

Fishing.HackUpWhale = function(ent)
  local ent = Fishing.Whale
  if Config.ChanceOfCopNotifyWhaleChop >= math.random(100) then 
    Fishing.NotifyCops()
  end
  local ped = PlayerPedId()
  TaskTurnPedToFaceEntity(ped,ent,-1)
  Wait(1000)

  local ad = 'amb@world_human_hammering@male@base'
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do 
    RequestAnimDict(ad) 
    Wait(0) 
  end

  local prop = CreateObject(`prop_w_me_hatchet`, 0, 0, 0, true, true, true)
  SetEntityAsMissionEntity(prop,true,true)
  AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 57005), 0.15, -0.02, -0.02, 350.0, 100.00, 280.0, true, true, false, true, 1, true)
  
  local maxChops = math.random(5,15)
  for i=1,maxChops,1 do
    TaskPlayAnim(ped, ad, 'base', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
    Wait(2500)
    ClearPedTasks(ped)
    Wait(500)
  end
  DeleteEntity(Fishing.Whale)

  DetachEntity(prop,1,true)
  DeleteEntity(prop)
  if Config.ReturnRodFromWhale then
    for k,v in pairs(Fishing.PreviousSetup) do 
      TriggerServerEvent("Fishing:AddItem", v)
    end
  end
  whalePos = false
end


Fishing.ThrowFishAtPlayer = function()
  local fishModel = 'a_c_fish'
  local fishHash  = GetHashKey(fishModel)

  RequestModel(fishHash)
  while not HasModelLoaded(fishHash) do Wait(0) end

  local ped     = PlayerPedId()
  local pedPos  = GetEntityCoords(ped)
  local pedHead = GetEntityHeading(ped)
  local fishPos = pedPos + (GetEntityForwardVector(ped) * 3) - vector3(0.0,0.0,0.5)

  local fish = CreatePed(4, fishHash, fishPos.x,fishPos.y,fishPos.z, pedHead-180.0, false,false)
  SetEntityHealth(fish,0)
  while not DoesEntityExist(fish) do Wait(100) end
  Wait(100)

  local force     = 500.0
  local dir       = ((pedPos + vector3(0.0,0.0,2.5)) - fishPos)*force--norm((pedPos + vector3(0.0,0.0,0.5)) - fishPos)*force

  ApplyForceToEntity(fish, 2, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)

  Wait(500)

  SetEntityAsMissionEntity(fish,true,true)
  DeleteEntity(fish)
end

--## Fish Finder



