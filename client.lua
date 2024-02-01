local currentHelmet = {}


Citizen.CreateThread(function()
    for k,v in pairs(Config.Vests) do 
        local export = v.vest 
        exports(export, function(data)
            useVest(data, v)
        end)
    end 

    for k,v in pairs(Config.Helmets) do 
        local export = v.helmet 
        exports(export, function(data)
            useHelmet(data, v)
        end)
    end 
end)

function useVest(data, vest)
    if lib.progressCircle({
        duration = 1500,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        anim = {
            dict = 'clothingtie',
            clip = 'try_tie_negative_a'
        },
    }) then 
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadClothes', skin, vest.outfit.male)
            else
                TriggerEvent('skinchanger:loadClothes', skin, vest.outfit.female)
            end
        end)
    
        local newArmour = GetPedArmour(PlayerPedId()) + vest.addArmour
        if newArmour > 100 then 
            newArmour = 100
        end 
        SetPedArmour(PlayerPedId(), newArmour)
        Config.Notifcation(Config.NotifyVest)
        TriggerServerEvent('farmour:removeItem', data.name , 1, nil, data.slot)
    end 
end 

function useHelmet(data, helmet)

    if json.encode(currentHelmet) == '[]' then 

        if lib.progressCircle({
            duration = 1000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            anim = {
                dict = 'mp_masks@standard_car@ds@',
                clip = 'put_on_mask'
            },
        }) then 
            TriggerEvent('skinchanger:getSkin', function(skin)
                if skin.sex == 0 then
                    TriggerEvent('skinchanger:loadClothes', skin, helmet.outfit.male)
                else
                    TriggerEvent('skinchanger:loadClothes', skin, helmet.outfit.female)
                end
            end)
        
            currentHelmet = helmet.outfit
            Config.Notifcation(Config.NotifyHelmet)
        end 

    else 
        if currentHelmet == helmet.outfit then 

            lib.progressCircle({
                duration = 750,
                position = 'bottom',
                anim = {
                    dict = 'mp_masks@standard_car@ds@',
                    clip = 'put_on_mask'
                },
            })
            TriggerEvent('skinchanger:getSkin', function(skin)
                if skin.sex == 0 then
                    TriggerEvent('skinchanger:loadClothes', skin, Config.NoHelmet.male)
                else
                    TriggerEvent('skinchanger:loadClothes', skin, Config.NoHelmet.female)
                end
            end)
            Config.Notifcation(Config.PutOffHelmet)
            currentHelmet = {}
        else 
            Config.Notifcation(Config.HelmetOn)
        end 
    end 
end 