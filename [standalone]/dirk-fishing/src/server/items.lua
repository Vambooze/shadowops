for k,v in pairs(Config.FishingEquipment['rodtype']) do 
  if Config.UsingESX then
    ESX.RegisterUsableItem(v.Name, function(source)
      TriggerClientEvent("FishingSim:TakeOutRod", source, v.Name, ESX.GetItemLabel(v.Name))
    end)
  elseif Config.UsingQBCore then
    QBCore.Functions.CreateUseableItem(v.Name, function(source, item)
      TriggerClientEvent("FishingSim:TakeOutRod", source, v.Name ,v.Label)
    end)
  end
end

local fN =  Config.FishFinder.ItemName

if Config.FishFinder.Enabled then 
  if Config.UsingESX then
    ESX.RegisterUsableItem(fN, function(source)
      TriggerClientEvent("Fishing:FishFinder", source)
    end)
  elseif Config.UsingQBCore then
    QBCore.Functions.CreateUseableItem(fN, function(source, item)
      TriggerClientEvent("Fishing:FishFinder", source)
    end)
  end
end



