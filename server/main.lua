ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if GetCurrentResourceName() == 'fifteen_shells' then

	ESX.RegisterServerCallback('fifteen_shells:canPick', function(source, cb, item)
	    local xPlayer = ESX.GetPlayerFromId(source)
	    local xItem = xPlayer.getInventoryItem(item)

	    if xItem.count >= 1 then
	        cb(true)
	    else
	        cb(false)
	    end
	end)

	ESX.RegisterServerCallback('fifteen_shells:canPickUp', function(source, cb, item)
		local xPlayer = ESX.GetPlayerFromId(source)
		local xItem = xPlayer.getInventoryItem(item)

		if xItem.limit ~= -1 and xItem.count >= xItem.limit then
			cb(false)
		else
			cb(true)
		end
	end)

	ESX.RegisterServerCallback('fifteen_shells:checkLimit', function(source, cb, item, min)
	    local xPlayer = ESX.GetPlayerFromId(source)
	    local xItem = xPlayer.getInventoryItem(item)
	    local xMin = min

	    if xItem.count >= xMin then
	        cb(true)
	    else
	        cb(false)
	    end
	end)

	RegisterServerEvent('fifteen_shells:Washing')
	AddEventHandler('fifteen_shells:Washing', function()
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		local xMin, xMax = xPlayer.getInventoryItem('shell_1'), xPlayer.getInventoryItem('shell_2')
		if xMax.limit ~= -1 and (xMax.count + 0) >= xMax.limit then	
			--
		elseif xMin.count < 1 then
			--
		else
			xPlayer.removeInventoryItem('shell_1', 1)
			xPlayer.addInventoryItem('shell_2', 1)
		end
	end)

	RegisterServerEvent('fifteen_shells:Packing')
	AddEventHandler('fifteen_shells:Packing', function()
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		local xMin, xMax = xPlayer.getInventoryItem('shell_2'), xPlayer.getInventoryItem('shell_3')
		if xMax.limit ~= -1 and (xMax.count + 0) >= xMax.limit then
			--
		elseif xMin.count < 2 then
			--
		else
			xPlayer.removeInventoryItem('shell_2', 2)
			xPlayer.addInventoryItem('shell_3', 1)
		end
	end)

	RegisterServerEvent('fifteen_shells:pickedUpShells')
	AddEventHandler('fifteen_shells:pickedUpShells', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local xItem = xPlayer.getInventoryItem('shell_1')

		if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
			--
		else
			xPlayer.addInventoryItem(xItem.name, 2)
		end
	end)
else
	print("\n DO NOT RENAME MY SHELL FUCKERS... Change it ".. GetCurrentResourceName() .. " should be:\n".. 'fifteen_shells')
end
