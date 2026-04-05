local Config = {
    allowedJob = 'police',
    allowedVehicles = {
        [`nkstanier`] = true,
        [`nkscout`] = true,
        [`nktraining`] = true,
        [`nkvstr`] = true,
        [`nkvstrum`] = true,
        [`nkaleutian`] = true,
        [`nkbuffalo2`] = true,
        [`nkbuffalo4`] = true,
        [`nkdorado`] = true,
        [`nkfugitive`] = true,
        [`nkguantlet4`] = true,
        [`nkgauntlet2`] = true,
        [`nkgranger2`] = true,
        [`nkgtx`] = true,
        [`nksadler`] = true,
        [`nkvigero2`] = true,
        [`nkcaracara2`] = true,
        [`nkdrafter`] = true,
        [`nkhellion`] = true,
        [`nkjester4`] = true,
        [`nkminimus`] = true,
        [`nkomnisegt`] = true,
        [`nkrhinehart`] = true,
        [`nksadlersuper`] = true,
        [`nksentinel`] = true,
        [`nkyose1`] = true,


    },
    stash = {
        slots = 5,
        weight = 50000 -- in grams
    }
}

RegisterCommand('rack', function()
    local playerPed = PlayerPedId()

    -- Must be in vehicle AND in driver/passenger seat
    if not IsPedInAnyVehicle(playerPed, false) then
        lib.notify({ type = 'error', description = 'You must be inside a vehicle to use /rack.' })
        return
    end

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle == 0 then return end

    local seat = GetPedInVehicleSeat(vehicle, -1) == playerPed or GetPedInVehicleSeat(vehicle, 0) == playerPed
    if not seat then
        lib.notify({ type = 'error', description = 'You must be in the front seats to use the rack.' })
        return
    end

    local model = GetEntityModel(vehicle)
    if not Config.allowedVehicles[model] then
        lib.notify({ type = 'error', description = 'This vehicle does not have a weapon rack.' })
        return
    end

    -- Call server to verify job & open stash
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    TriggerServerEvent('police_rack:attemptOpen', netId)
end)
