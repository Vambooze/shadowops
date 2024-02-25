Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1691.705, 3602.193, 34.62179, true ) < 80 then
      ClearAreaOfPeds(1691.705, 3602.193, 34.62179, 58.0, 0)
    end
  end
end)