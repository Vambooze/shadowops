Fishing = {}

Fishing.AddItem = function(Item)
  if Item then 
    local _source = source 
    FW.addInventoryItem(_source,Item, 1)
  end
end

Fishing.RemoveItem = function(Item)
  if Item then 
    local _source = source
    FW.removeInventoryItem(_source,Item, 1)
  end
end

Fishing.GetFishPriceHere = function(ShopName, FishType)
  return math.random(Config.SellingLocations[ShopName].FishTypes[FishType].MinPrice,Config.SellingLocations[ShopName].FishTypes[FishType].MaxPrice)
end

if Config.UsingESX then
  if type(ESX) == "table" and ESX.RegisterServerCallback then
    ESX.RegisterServerCallback("Fishing:GetFishingItems",function(source,callback)
      local xPlayer = ESX.GetPlayerFromId(source)
      local allFishingItems = {
        line = {},
        hook = {},
        reel = {},
        bait = {},
        rod  = false,
      }

      for EquipmentType,v in pairs(Config.FishingEquipment) do
        if EquipmentType ~= 'rodtype' then
          for i,j in pairs(v) do
            local item = xPlayer.getInventoryItem(j.Name)
            if item and item.count and item.count > 0 then
              table.insert(allFishingItems[EquipmentType],{name = item.name})
            end
          end
        end
      end
      callback(allFishingItems)
    end)
  else
    print("ESX did not load correctly.")
  end
else
  if QBCore and type(QBCore) == "table" then 
    QBCore.Functions.CreateCallback("Fishing:GetFishingItems",function(source,callback)
      local qPlayer = QBCore.Functions.GetPlayer(source)
      local allFishingItems = {
        line = {},
        hook = {},
        reel = {},
        bait = {},
        rod  = false,   
      }
      
      for EquipmentType,v in pairs(Config.FishingEquipment) do
        if EquipmentType ~= 'rodtype' then
          for i,j in pairs(v) do
            local item = qPlayer.Functions.GetItemByName(j.Name)

            if item and item.amount and item.amount > 0 then
              table.insert(allFishingItems[EquipmentType],{name = item.name})
            end
          end
        end
      end
      callback(allFishingItems)    
    end)
  else
    print("qb-core object has not loaded correctly.")
  end
end

RegisterNetEvent("Fishing:AddItem")
AddEventHandler("Fishing:AddItem", Fishing.AddItem)

RegisterNetEvent("Fishing:RemoveItem")
AddEventHandler("Fishing:RemoveItem", Fishing.RemoveItem)

RegisterNetEvent("Fishing:SellToShop")
AddEventHandler("Fishing:SellToShop", function(s,i,a)
  local src = source
  local sD = Config.Stores[s]
  if sD.Type ~= 'Sell' then return false; end
  local iD = sD.Items[i]
  if iD and sD then
    if FW.getItemCount(src,i) >= a then 
      FW.removeInventoryItem(src,i,a)
      FW.AddMoney(src,sD.Account, (a * iD.Cost))
      FW.showNotification(src, string.format("You have just sold %s x %s for a total of %s", iD.Label, a, (a * iD.Cost)))
    end
  end 
end)

RegisterNetEvent("Fishing:BuyFromShop")
AddEventHandler("Fishing:BuyFromShop", function(s,i,a)
  local src = source
  local sD = Config.Stores[s]
  if sD.Type ~= 'Buy' then return false; end
  local iD = sD.Items[i]
  local total = iD.Cost * a
  if iD and sD then
    if FW.hasGotMoney(src, sD.Account, total) then 
      FW.RemoveMoney(src, sD.Account, total)
      FW.addInventoryItem(src,i,a)
      FW.showNotification(src, string.format("You have just bought %s x %s for a total of %s", iD.Label, a, (a * iD.Cost)))
    else
      FW.showNotification(src,"You do not have enough money for this")
    end
  end 
end)

Citizen.CreateThread(function()
  print('^2STARTED ^7DIRK-FISHING\n^5Visit dirkscripts.com for more scripts^7')
end)
