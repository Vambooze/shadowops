Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1760.93300000, 4646.03500000, 38.90049000, true ) < 150 then
      ClearAreaOfPeds(1760.93300000, 4646.03500000, 38.90049000, 80.0, 0)
    end
  end
end)