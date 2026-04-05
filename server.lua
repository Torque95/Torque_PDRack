local QBCore = exports['qb-core']:GetCoreObject()

local Config = {
    allowedJob = 'police',
    stash = {
        slots = 5,
        weight = 100000
    }
}

local function isAllowedOfficer(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    local job = Player.PlayerData.job.name
    print("Checking job:", job)  -- debug
    return job == Config.allowedJob
end

RegisterNetEvent('police_rack:attemptOpen', function(vehicleNetId)
    local src = source
    if not isAllowedOfficer(src) then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'You are not authorised to use this.' })
        return
    end

    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if not vehicle or not DoesEntityExist(vehicle) then return end

    local plate = GetVehicleNumberPlateText(vehicle)
    local stashId = 'police_rack:' .. plate:gsub("%s+", ""):upper()

    exports.ox_inventory:RegisterStash(stashId, 'Weapon Rack - ' .. plate, Config.stash.slots, Config.stash.weight)
    TriggerClientEvent('ox_inventory:openInventory', src, 'stash', { id = stashId })
end)
