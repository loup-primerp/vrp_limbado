-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMBADO ### DISCORD Lobinho#1315 
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        local coords = GetEntityCoords(ped)
        local _,xCoords = GetNthClosestVehicleNode(coords["x"],coords["y"],coords["z"],1,0,0,0)
		_coords = GetEntityCoords(ped)
		_, z = GetGroundZFor_3dCoord(_coords.x, _coords.y, 150.0, 0) 
		if _coords.z < config.z_check then
            if IsPedInAnyVehicle(ped) then
                ped = veh
               SetEntityCoordsNoOffset(ped,xCoords["x"],xCoords["y"],xCoords["z"],0,0,0)
            end
			local flag_swimming, flag_falling, flag_inside = true, true, true
			if config.check_swimming and (IsPedSwimming(ped) or IsPedSwimmingUnderWater(ped)) then
				flag_swimming = false
			end
			if config.check_falling and not IsPedFalling(ped) then
				flag_falling = false
			end
			if config.check_inside and not IsPedFalling(ped) and z > _coords.z then 
				flag_inside = false
			end
			
			if (flag_falling and flag_swimming and flag_inside) then
				ClearPedTasksImmediately(ped)
				
					SetEntityCoordsNoOffset(ped,xCoords["x"],xCoords["y"],xCoords["z"]+1.5,0,0,0)
				
			
			
				
				
			end
		end
		Citizen.Wait(500)
	end
end)
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

