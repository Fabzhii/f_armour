Config = {}

Config.Vests = {
    {
        vest = 'police_vest_1',
        addArmour = 50,
        outfit = {
            male = {
                ['bproof_1'] = 6,
                ['bproof_2'] = 0,
            },
            female = {
                ['bproof_1'] = 6,
                ['bproof_2'] = 0,
            },
        },
    },
    {
        vest = 'police_vest_2',
        addArmour = 100,
        outfit = {
            male = {
                ['bproof_1'] = 6,
                ['bproof_2'] = 0,
            },
            female = {
                ['bproof_1'] = 6,
                ['bproof_2'] = 0,
            },
        },
    },
}

Config.Helmets = {
    {
        helmet = 'police_helmet_1',
        outfit = {
            male = {
                ['helmet_1'] = 6,
                ['helmet_2'] = 0,
            },
            female = {
                ['helmet_1'] = 6,
                ['helmet_2'] = 0,
            },
        },
    },
    {
        helmet = 'police_helmet_2',
        outfit = {
            male = {
                ['helmet_1'] = 9,
                ['helmet_2'] = 0,
            },
            female = {
                ['helmet_1'] = 9,
                ['helmet_2'] = 0,
            },
        },
    },
}

Config.NoHelmet = {
    male = {
        ['helmet_1'] = -1,
        ['helmet_2'] = 0,
    },
    female = {
        ['helmet_1'] = -1,
        ['helmet_2'] = 0,
    },
}

Config.NotifyVest = {'Du hast dir eine Weste angezogen!', 'info'}
Config.NotifyHelmet = {'Du hast dir einen Helm aufgesetzt!', 'info'}
Config.PutOffHelmet = {'Du hast dir einen Helm abgesetzt!', 'info'}
Config.HelmetOn = {'Du hast bereits einem Helm auf!', 'info'}

Config.Notifcation = function(notify)
    local message = notify[1]
    local notify_type = notify[2]
    lib.notify({
        position = 'top-right',
        description = message,
        type = notify_type,
    })
end 
