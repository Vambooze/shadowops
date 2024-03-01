local IsPlayerReady = function()
  if Config.UsingESX then 
    while not ESX.IsPlayerLoaded() do Wait(500); end
    return true
  elseif Config.UsingQBCore then 
    while not QBCore.Functions.GetPlayerData().job do Wait(500); end
    return true
  end
end

ChooseAmount = function(s,i,t)
  if Config.UsingQBCore then 
    local dialog = exports['qb-input']:ShowInput({
        header = "Choose Amount",
        submitText = "Confirm",
        inputs = {
            {
                text = "Amount", -- text you want to be displayed as a place holder
                name = "amount", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                -- default = 1, -- Default number option, this is optional
            },

        },
    })

    if dialog ~= nil then
      if dialog.amount then 
        if t == "Buy" then 
          TriggerServerEvent("Fishing:BuyFromShop", s, i, tonumber(dialog.amount))
        elseif t == "Sell" then
          TriggerServerEvent("Fishing:SellToShop", s, i, tonumber(dialog.amount))
        end
      end
    end
  elseif Config.UsingESX then 
    local keyboard,amount = exports['nh-keyboard']:Keyboard({
      header = "Choose Amount",
      rows = {'Amount'}
    })
    if keyboard then 
      if amount and amount ~= nil then 
        if t == "Buy" then 
          TriggerServerEvent("Fishing:BuyFromShop", s, i, tonumber(amount))
        elseif t == "Sell" then
          TriggerServerEvent("Fishing:SellToShop", s, i, tonumber(amount))
        end
      end
    end
  end
end

SetUpTargets = function()
  for k,v in pairs(Config.Stores) do 
    if Config.UsingQBCore then 
      exports['qb-target']:AddCircleZone(k, vector3(v.Loc.x, v.Loc.y, v.Loc.z), 1.5, { 
        name = k, 
        debugPoly = false, 
      }, {
        options = { 
          { 
            icon = 'fas fa-fish', 
            label = k, 
            action = function(entity)
              if IsPedAPlayer(entity) then return false end 
              OpenStoreMenu(k)
            end,
          }
        },
        distance = 2.5, 
      })
    else
      exports.qtarget:AddBoxZone(k, vector3(v.Loc.x, v.Loc.y, v.Loc.z), 1.0, 1.0, {
        name=k,
        heading=v.Loc.w,
        debugPoly=false,
        minZ=v.Loc.z - 2.5,
        maxZ= v.Loc.z + 2.5,
        }, {
          options = { 
            { 
              icon = 'fas fa-fish', 
              label = k, 
              action = function(entity)
                if IsPedAPlayer(entity) then return false end 
                OpenStoreMenu(k)
              end,
            }
          },
          distance = 2.5, 
      })        
    end
  end
end


Init = function()
 
  if Config.UsingStores then 
    while not IsPlayerReady() do Wait(500); end
    for k,v in pairs(Config.Stores) do 
      if v.Blip.Enabled then 
        local blip = AddBlipForCoord(v.Loc.x,v.Loc.y,v.Loc.z)
        SetBlipSprite(blip, v.Blip.Sprite)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, v.Blip.Scale)
        SetBlipColour(blip, v.Blip.Color)
        SetBlipAsShortRange         (blip, false)
        BeginTextCommandSetBlipName ("STRING")
        AddTextComponentString      (k)
        EndTextCommandSetBlipName   (blip)
      end
    end
    if Config.StoresUseTarget then 
      SetUpTargets()
    end
    Update()
  end
end


local SpawnedStores = {}

Update = function()
  while true do 
    local wait_time = 1000 
    local ply = PlayerPedId()
    local pos = GetEntityCoords(ply)
    for k,v in pairs(Config.Stores) do 
      local sp = v.Loc.xyz
      if #(pos - sp) <= 50.0 then 
        if v.Ped then
          if not SpawnedStores[k] then 
            local hash = GetHashKey(v.Ped)
            while not HasModelLoaded(hash) do RequestModel(hash) Wait(0); end 
            SpawnedStores[k] = CreatePed(3,hash,v.Loc.x,v.Loc.y,v.Loc.z-0.9,v.Loc.w,false,false)
            SetEntityInvincible(SpawnedStores[k] , true)
            SetPedDropsWeaponsWhenDead(SpawnedStores[k] ,false)
            SetBlockingOfNonTemporaryEvents(SpawnedStores[k] , true)
            TaskSetBlockingOfNonTemporaryEvents(SpawnedStores[k] , true)
            FreezeEntityPosition(SpawnedStores[k], true)
          end
        end

        if not Config.StoresUseTarget then 
          if #(pos - sp) <= 1.5 then
            wait_time = 0 
            Fishing.ShowHelpNotification("Press ~INPUT_PICKUP~ to use this store")
            if IsControlJustPressed(0,38) then 
              OpenStoreMenu(k)
            end
          end
        end
      else
        if v.Ped then 
          if SpawnedStores[k] then 
            DeleteEntity(SpawnedStores[k])
            SpawnedStores[k] = nil
          end
        end
      end
    end
    Wait(wait_time)
  end
end


OpenStoreMenu = function(s)
  local sI = Config.Stores[s].Items
  local elements = {}

    table.insert(elements,{
      header = s,
      isMenuHeader = true, -- Set to true to make a nonclickable title
    })
    for k,v in pairs(sI) do 
      if Config.UsingQBCore then 
        table.insert(elements, {
          header = v.Label,
          txt = "["..Config.Stores[s].Type.."] $"..v.Cost.."<br>"..v.Desc,
          params = {
            isAction = true, 
              event = function()
                ChooseAmount(s,k,Config.Stores[s].Type)
              end,
              args = {
                  number = 1,
              }
          }   
        })
      elseif Config.UsingESX then 
        table.insert(elements, {
          header = v.Label, 
          context = "["..Config.Stores[s].Type.."] $"..v.Cost.."<br>"..v.Desc,
          --event = "Fishing:ChooseAmount",
          args = {k},
        })
      end
    end
    if Config.UsingESX then 
      local response = exports["nh-context"]:ContextMenu(elements)
      if response ~= nil then 
        ChooseAmount(s,response,Config.Stores[s].Type)
      end
    elseif Config.UsingQBCore then 
      exports['qb-menu']:openMenu(elements)
    end
end


Citizen.CreateThread(Init)
