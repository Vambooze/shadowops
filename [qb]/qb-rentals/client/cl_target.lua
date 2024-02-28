CreateThread(function(data)
    exports['qb-target']:AddCircleZone("VehiclePed", vector3(109.9739, -1088.61, 28.302), 0.4, { 
        name = "vehicleped", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Vehicle",
                LicenseType = "driver",
                MenuType = "vehicle",
            },
        },
        distance = 3.0
      })
    
    exports['qb-target']:AddCircleZone("AircraftPed", vector3(-1686.57, -3149.22, 12.99), 0.4, { 
        name = "aircraftped", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Aircraft",
                LicenseType = "pilot",
                MenuType = "aircraft",
            },
        },
        distance = 3.0
        })

    exports['qb-target']:AddCircleZone("BoatPed", vector3(1224.591797, 2727.90, 38.00), 0.4, { 
        name = "boatped", 
        debugPoly = false,
        }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
                MenuType = "boat"
            },
        },
        distance = 3.0
        })
end)