FW = {
  GetPlayerObject = function(p)
    if Config.UsingESX then 
      return ESX.GetPlayerFromId(p)
    elseif Config.UsingQBCore then 
      return QBCore.Functions.GetPlayer(p)
    end
  end,

  addInventoryItem = function(p,item,count)
    local player = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      player.addInventoryItem(item,count)
    elseif Config.UsingQBCore then
      player.Functions.AddItem(item,count)
      TriggerClientEvent('inventory:client:ItemBox', p, QBCore.Shared.Items[item], "add")
    end
  end,

  removeInventoryItem = function(p,item,amount)
    local player = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      player.removeInventoryItem(item,amount)
    elseif Config.UsingQBCore then
      player.Functions.RemoveItem(item,amount)
      TriggerClientEvent('inventory:client:ItemBox', p, QBCore.Shared.Items[item], "remove")
    end
  end,

  getInventoryItem = function(p,item) 
    local player = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      return player.getInventoryItem(item)
    elseif Config.UsingQBCore then  
      return player.Functions.GetItemByName(item)
    end
  end,


  getItemCount = function(p,item)
    local ply = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      local item = ply.getInventoryItem(item)
      if item and item.count then 
        return item.count
      end
    elseif Config.UsingQBCore then 
      local item = ply.Functions.GetItemByName(item)
      if item and item.amount then 
        return item.amount
      end
    end
    return 0
  end,

  hasGotMoney = function(p,acc,amount)
    local player = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      if player.getAccount(acc).money >= amount then 
        return true
      end
    elseif Config.UsingQBCore then
      if player.PlayerData.money[acc] >= amount then 
        return true
      end
    end
    return false
  end,

  showNotification = function(p,msg, type, length)
    if Config.UsingESX then
      TriggerClientEvent("esx:showNotification", p, msg)
    elseif Config.UsingQBCore then
      TriggerClientEvent("QBCore:Notify", p, msg, type or "inform", length or 1500)
    end
  end,

  AddMoney = function(p,acc,a)
    local ply = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      ply.addAccountMoney(acc,a)
    elseif Config.UsingQBCore then 
      ply.Functions.AddMoney(acc,a)
    end
  end,

  RemoveMoney = function(p,acc,a)
    local ply = FW.GetPlayerObject(p)
    if Config.UsingESX then 
      ply.removeAccountMoney(acc,a)
    elseif Config.UsingQBCore then 
      ply.Functions.RemoveMoney(acc,a)
    end
  end,
}

if Config.UsingQBCore and Config.QBAutoAddItems then 
  while not QBCore do Wait(500); end
  print('^3ATTEMPTING AUTO ADD QBCORE ITEMS^7')
  for k,v in pairs(QBItems) do 
    local suc, msg = exports['qb-core']:AddItem(k,v)
    if suc then 
      print(string.format('^2%s has been added to your QBCore.Shared.Items^7', k))
    else
        print(msg)
        print(string.format('^8%s has not been added to your QBCore.Shared.Items because it already exists^7', k))
    end
  end
end

