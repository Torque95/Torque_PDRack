==============================
  Police Rack Stash Script
==============================

This script adds a /rack command for police officers to access a secret weapon rack inside police vehicles. It is designed for use with:

- ox_inventory ✅
- tk_policejob ✅
- Any standalone or player state-based framework ✅

It allows players with the `police` or `sheriff` job to open a vehicle-based stash when seated in the driver or front passenger seat of an approved police vehicle.

--------------------------
INSTALLATION INSTRUCTIONS
--------------------------

1. Place the script folder in your `resources` directory:
   Example: resources/[local]/Torque_PDRack

2. Ensure `ox_inventory` and `ox_lib` are properly installed and working.

3. Add this to your server.cfg or resource start order:
ensure ox_lib
ensure ox_inventory
ensure Torque_PDRack



4. Update your `fxmanifest.lua` to include `@ox_lib/init.lua`:
shared_script '@ox_lib/init.lua'



5. Make sure your `tk_policejob` sets the player's job in `Player(source).state.job`.
(This is true by default if you're using that script.)

--------------------------
CONFIGURATION
--------------------------

To customize the script, open `client.lua` and `server.lua` and review the following settings:

 INVENTORY SETTINGS:
- Located in `server.lua`
Config.stash = {
slots = 20, -- Number of inventory slots
weight = 10000 -- Max weight in grams (10kg = 10000g)
}


 POLICE VEHICLES:
- Located in `client.lua`
- Add all vehicles that should have a weapon rack.
- Use the **model hash** like this:

Config.allowedVehicles = {
[police] = true,
[police2] = true,
[police3] = true,
[police4] = true,
[sheriff] = true,
[sheriff2] = true,
[fbi] = true,
[fbi2] = true,
-- Add more as needed
}


 JOB CHECK:
- Located in `server.lua`

By default, the script allows:
police
sheriff

You can add more jobs by editing this table:
Config.allowedJobs = {
police = true,
sheriff = true
}


--------------------------
HOW TO USE
--------------------------

1. Enter a police vehicle as **driver or front passenger**.
2. Type `/rack` in chat.
3. If your job is allowed and vehicle is supported, a stash will open.
4. The stash is tied to the vehicle's license plate.

--------------------------
NOTES
--------------------------

- The stash is **unique per vehicle plate**, meaning each vehicle has its own rack inventory.
- Only players with the correct job can open the stash.
- You must be sitting in the vehicle to access the stash.


--------------------------
SUPPORT
--------------------------

This script was built for use with:
- ox_inventory
- ox_lib
- tk_policejob (or any job stored in `Player(source).state.job`)

If you're using QBCore, ESX, or a custom framework, the script can be modified to work with it — just change the job check in `server.lua`.

Enjoy!
https://discord.gg/rRyhg5mErJ