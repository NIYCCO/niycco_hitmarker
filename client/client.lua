local toggleHitmarker = false

RegisterNetEvent('niycco_hitmarker:getroffen')
AddEventHandler('niycco_hitmarker:getroffen', function(opferServerID, opferCoords, schaden, letzerHit, waffe)
    local waffenGruppe = GetWeapontypeGroup(waffe)
    if toggleHitmarker or Config.HitmarkerNeedToggle == false then
        if Config.HitmarkerOnMelee == false and (waffenGruppe == -728555052 or waffenGruppe == -1609580060) then
            return
        else 
            DrawHitmarker(opferServerID, opferCoords, schaden, letzerHit) 
        end
    end
end)

function DrawHitmarker(opferServerID, coords, damage, letzerHit)
    local drawHitmarkerState = true
    local aplha = Config.TextColor.a
    Citizen.CreateThread(function()
        if letzerHit then
            Wait(Config.HitmarkerShowTime + Config.HitmarkerAddShowTimeLastHit)
        else 
            Wait(Config.HitmarkerShowTime)
        end
        drawHitmarkerState = false
    end)

    Citizen.CreateThread(function()
        while drawHitmarkerState do
            aplha = aplha - 3
            coords = coords + vector3(0, 0, 0.0075)
            local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.4)
            if onScreen then
                SetTextScale(Config.TextScale, Config.TextScale)
                SetTextFont(Config.TextFont)
                SetTextProportional(true)
                local FoundLastDamagedBone, LastDamagedBone = GetPedLastDamageBone(GetPlayerPed(GetPlayerFromServerId(opferServerID)))
                if FoundLastDamagedBone then
                    if Config.TextSeparateHeadshotColor and tonumber(LastDamagedBone) == 31086 then
                        SetTextColour(Config.TextHeadshotColor.r, Config.TextHeadshotColor.g, Config.TextHeadshotColor.b, aplha)
                    end
                else 
                    SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, aplha)
                end
                SetTextOutline()
                SetTextEntry("STRING")
                SetTextCentre(Config.TextCenter)
                if Config.TextShowDead and letzerHit then
                    AddTextComponentString('Dead')
                else 
                    AddTextComponentString(damage)
                end
                DrawText(_x, _y)
            end
            Citizen.Wait(0)
        end
    end)
    if Config.HitmarkerSound then
        SendNUIMessage({
            type = 'play',
            audio = Config.HitmarkerSoundfile,
            volume = Config.HitmarkerSoundVolume
        }) 
    end
end

RegisterCommand(Config.HitmarkerToggleCommand, function ()
    toggleHitmarker = not toggleHitmarker
end, false)

function toogleHitmarkerExport()
    toggleHitmarker = not toggleHitmarker
end

-- So nutzt man die function in anderen Client Scrpits: exports.ds_hitmarker:toogleHitmarkerExport()