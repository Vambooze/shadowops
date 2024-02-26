# exports server size 
 ## check one item
 - boolean = exports['origen_inventory']:HasItem(source,itemName, amount)
 ## check if you have all the items in a list
 - boolean = exports['origen_inventory']:HasItem(source,{'itemName', 'itemName'}, amount)
## check total weight items
```lua
    items = {
        { name = 'tosti', amount = 5 },
        { name = 'kurkakola', amount = 2 },

    }
   weight = exports['origen_inventory']:GetTotalWeight(items)

```

## check Usable item
exports['origen_inventory']:GetUsableItem(itemName) == QBCore.Functions.CanUseItem(itemName)
## Use Item
exports['origen_inventory']:UseItem(itemName, source, itemData)
## Get Item By Slot
itemData = exports['origen_inventory']:GetItemBySlot(source, slot)
## Get Item By Name
itemData =  exports['origen_inventory']:GetItemByName(source, itemName)

## GetItems by name

ArrayItems = exports['origen_inventory]:GetItemsByName(source, itemName)

## Get Item Total Amount

totalamount , arrayTotalItemDataSlots = exports['origen_inventory']:GetItemTotalAmount(source, itemName)

## Add Item

bool = exports['origen_inventory']:AddItem(source, itemName, amount, slot, info)

## remove Item
bool = exports['origen_inventory']:RemoveItem(source, item, amount, slot)

## Give Weapon To Player

exports['origen_inventory']:GiveWeaponToPlayer(souce,weapon_item, ammo)




