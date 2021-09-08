ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Menu --
local open = false
local MenuIllegalshop = RageUI.CreateMenu("Illegal Shop", "INTERACTION")
MenuIllegalshop.Display.Header = true
MenuIllegalshop.Closed = function() 
    open = false
end

function OpenMenuIllegalshop() 
    if open then 
        open = false
        RageUI.Visible(MenuIllegalshop, false)
        return
    else
        open = true
        RenderScriptCams(1, true, 2000)
        FreezeEntityPosition(PlayerPedId(), true)
        RageUI.Visible(MenuIllegalshop, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(MenuIllegalshop, function()
                    RageUI.Separator("↓     ~r~Shop     ~s~↓")
                    for k,v in pairs(Config.Item) do 
                        RageUI.Button(v.Nom, nil, {RightLabel = "~r~"..v.Price.."$"}, true, {
                            onActive = function() 
                                Visual.Subtitle(v.Message, 1)
                            end,
                            onSelected = function() 
                                TriggerServerEvent('dpr_Illegalshop:AchatItem', v.Nom, v.Item, v.Price)
                            end
                        })
                    end
                    RageUI.Separator("↓     ~r~Fermeture     ~s~↓")
                    RageUI.Button("~r~Fermer", nil, {RightLabel = "~y~→→"}, true, {
                        onActive = function() 
                            Visual.Subtitle("", 1)
                        end,
                        onSelected = function()
                            FreezeEntityPosition(PlayerPedId(), false)
                            RenderScriptCams(0, true, 2000)
                            RageUI.CloseAll()
                        end
                    })
                end) 
            Wait(0)
            end
        end)
    end
end

local camCoords = vector3(2173.76, 3497.53, 45.29)

Citizen.CreateThread(function()
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    SetCamCoord(cam, camCoords)
    PointCamAtCoord(cam, 2180.7, 3501.4, 45.3)
    SetCamActive(cam, true)
end)

Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(Config.Illegalshop.position) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.Illegalshop.position
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= Config.MarkerDistance then
                wait = 0
                DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
            end

			if dist <= 2.0 then
                wait = 0
                Visual.Subtitle(Config.Text, 1)
                if IsControlJustPressed(1,51) then
                    OpenMenuIllegalshop()
                end
		    end
            if IsControlJustPressed(1, 177) then
                FreezeEntityPosition(PlayerPedId(), false)
                RenderScriptCams(0, true, 2000)
            end
		end
    Wait(wait)
    end
end)


-- Ped --
Citizen.CreateThread(function()
	if Config.Ped then
		function LoadModel(model)
			while not HasModelLoaded(model) do
				RequestModel(model)
				Wait(1)
			end
		end
		LoadModel(Config.PedType)
		Ped = CreatePed(2, GetHashKey(Config.PedType), Config.PedPosition, Config.PedRotation, 0, 0)
		DecorSetInt(Ped, "Desperados", 5431)
		FreezeEntityPosition(Ped, 1)
		SetEntityInvincible(Ped, true)
		SetBlockingOfNonTemporaryEvents(Ped, 1)
	end
end)