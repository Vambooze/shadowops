local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('okokBanking:server:metroPay', function(source, cb)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveMoney(Config.howPay, Config.ticketPrise) then
		cb(true)
	else
		print("false")

		cb(false)
	end
end)