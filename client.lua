local carryingBackInProgress = false

\-- UI jelzés
local function showCarryNotification(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end

\-- Ox\_target interakció minden játékoshoz
exports.ox\_target\:addGlobalPlayer({
options = {
{
name = 'humorous\_carry',
icon = 'fa-solid fa-hand-holding',
label = 'Humoros Carry',
onSelect = function(targetPed)
if carryingBackInProgress then
StopCarry()
return
end

```
            carryingBackInProgress = true
            showCarryNotification("Humoros carry folyamatban...")

            local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(targetPed))

            -- Humor animáció (vicces és stabil)
            local lib = "missfinale_c2mcs_1"
            local anim1 = "fin_c2_mcs_1_camman"   -- te (vicces pózban)
            local lib2 = "nm"
            local anim2 = "firemans_carry"        -- target (viccesen hordozva)

            local distans = 0.18
            local distans2 = 0.28
            local height = 0.65
            local spin = 0.0
            local length = 100000
            local controlFlagMe = 50
            local controlFlagTarget = 33

            TriggerServerEvent('cmg2_animations:sync', targetPed, lib, lib2, anim1, anim2, distans, distans2, height, targetServerId, length, spin, controlFlagMe, controlFlagTarget, 1)
        end
    }
},
distance = 2.5
```

})

\-- Stop carry funkció
function StopCarry()
if carryingBackInProgress then
carryingBackInProgress = false
local playerPed = PlayerPedId()
ClearPedSecondaryTask(playerPed)
DetachEntity(playerPed, true, false)
showCarryNotification("Carry leállítva.")

```
    local targetPed = exports.ox_target:getTarget()
    if targetPed then
        local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(targetPed))
        TriggerServerEvent("cmg2_animations:stop", targetServerId)
    end
end
```

end

\-- Event a cél játékoshoz
RegisterNetEvent('cmg2\_animations\:syncTarget')
AddEventHandler('cmg2\_animations\:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length, spin, controlFlag)
local playerPed = PlayerPedId()
local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
carryingBackInProgress = true

```
RequestAnimDict(animationLib)
while not HasAnimDictLoaded(animationLib) do
    Citizen.Wait(10)
end

if spin == nil then spin = 180.0 end
if controlFlag == nil then controlFlag = 0 end

AttachEntityToEntity(playerPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
```

end)

\-- Event a saját animációhoz
RegisterNetEvent('cmg2\_animations\:syncMe')
AddEventHandler('cmg2\_animations\:syncMe', function(animationLib, animation, length, controlFlag)
local playerPed = PlayerPedId()
RequestAnimDict(animationLib)
while not HasAnimDictLoaded(animationLib) do
Citizen.Wait(10)
end

```
if controlFlag == nil then controlFlag = 0 end
TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
```

end)

\-- Stop event
RegisterNetEvent('cmg2\_animations\:cl\_stop')
AddEventHandler('cmg2\_animations\:cl\_stop', function()
StopCarry()
end)

\-- Parancs stop-hoz
RegisterCommand("carry\_stop", function()
StopCarry()
end, false)
