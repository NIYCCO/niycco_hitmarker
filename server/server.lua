AddEventHandler("weaponDamageEvent", function (sender, data)
    local taeterID = sender
    local opferPed = NetworkGetEntityFromNetworkId(data.hitGlobalId)
    local opferCoords = GetEntityCoords(opferPed)
    local opferServerID = NetworkGetEntityOwner(opferPed)
    local schaden = data.weaponDamage
    local letzerHit = data.willKill
    local waffe = data.weaponType
    if IsPedAPlayer(opferPed) then
        TriggerClientEvent('niycco_hitmarker:getroffen', taeterID, opferServerID, opferCoords, schaden, letzerHit, waffe) 
    end
end)
