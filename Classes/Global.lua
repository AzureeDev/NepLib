NepLib:RequireGlobalScript("Utils")

NepLib:RequireMapScript("ZMBank")
NepLib:RequireMapScript("OperationZero")

ZMGlobalFramework = ZMGlobalFramework or class()

function ZMGlobalFramework:init()
    if not NepLib.Utils:IsZombieMap() then
        return
    end

    self:InitGlobalVariables()
    self:CreateMapData()
end

function ZMGlobalFramework:InitGlobalVariables()
    self.PlayerData = {
        [1] = {
            name = "NoName",
            money = 0,
            score = 0,
            max_waves_survived = 0
        },
        [2] = {
            name = "NoName",
            money = 0,
            score = 0,
            max_waves_survived = 0
        },
        [3] = {
            name = "NoName",
            money = 0,
            score = 0,
            max_waves_survived = 0
        },
        [4] = {
            name = "NoName",
            money = 0,
            score = 0,
            max_waves_survived = 0
        }
    }

    self.MapData = {
        Name = "map_name_placeholder",
        ID = "map_id_placeholder",
        Global_Key = nil,
        MusicIntro = nil,
        MusicGameover = nil,
        MusicGameoverEasterEgg = nil,
        MusicWaveStart = nil,
        MusicWaveEnded = nil,
        Gameplay = {
            StartMoney = 500,
            MaxPerks = 4,
            ZombieStartSpawns = 6,
            PowerUps = {
                AllowMaxAmmo = true,
                AllowDoublePoints = true,
                AllowInstaKill = true,
                AllowKaboom = true,
                AllowFiresale = true,
                AllowInfiniteAmmo = true,
                AllowZombieBlood = true,
                AllowPerkPowerUp = false,
                AllowDeathMachine = true
            }
        }
    }

    self.EconomyData = {
        ZombieHit = 10,
        ZombieKill = 50,
        ZombieHeadshot = 100,
        ZombieMelee = 130,
        AllowSpecifics = false,
        Specifics = {
            CopKill = 50,
            CopHeadshot = 100,
            CopMelee = 130,
            MedicKill = 80,
            MedicHeadshot = 120,
            MedicMelee = 160,
            TaserKill = 90,
            TaserHeadshot = 140,
            TaserMelee = 180,
            CloakerKill = 80,
            CloakerHeadshot = 140,
            CloakerMelee = 200,
            ShieldKill = 60,
            ShieldHeadshot = 110,
            ShieldMelee = 140,
            TankKill = 150,
            TankHeadshot = 175,
            TankMelee = 250
        },
        FiresalePrice = 10
    }

    self.SupportedMaps = {
        "zm_bank" = BrokenArrow,
        "operation_zero" = OperationZero
    }
end

function ZMGlobalFramework:CreateMapData()
    if NepLib.Utils:IsZombieMap() then
        self:AddSpecificMapData(NepLib.Utils:CurrentMap())
    end
end

function ZMGlobalFramework:AddSpecificMapData(level_id)
    if not self.SupportedMaps[level_id] then
        NepLib:Error("Trying to load specific data of a non supported map. Map ID: ", level_id)
    end

    for map_id, map_class in pairs(self.SupportedMaps) do
        if map_id == NepLib.Utils:CurrentMap() then
            map_class:new()
        end
    end
end

function ZMGlobalFramework:InitSpecificMapGlobals(data)
    self.MapData = {
        Name = data.name,
        ID = data.id,
        Global_Key = data.global_key,
        MusicIntro = data.music_intro,
        MusicGameover = data.music_gameover,
        MusicGameoverEasterEgg = data.music_gameover_easter_egg,
        MusicWaveStart = data.music_wave_start,
        MusicWaveEnded = data.music_wave_ended,
        Gameplay = {
            StartMoney = data.start_money,
            MaxPerks = data.max_perks,
            ZombieStartSpawns = data.zombie_start_spawn,
            PowerUps = {
                AllowMaxAmmo = data.allow_max_ammo,
                AllowDoublePoints = data.allow_double_points,
                AllowInstaKill = data.allow_insta_kill,
                AllowKaboom = data.allow_kaboom,
                AllowFiresale = data.allow_firesale,
                AllowInfiniteAmmo = data.allow_infinite_ammo,
                AllowZombieBlood = data.allow_zombie_blood,
                AllowPerkPowerUp = data.allow_perk_power_up,
                AllowDeathMachine = data.allow_death_machine
            },
            PowerUpsDuration = 30
        }
    }
end

function ZMGlobalFramework:InitSpecificMapEconomy(data)
    self.EconomyData = {
        ZombieHit = data.zombie_hit,
        ZombieKill = data.zombie_kill,
        ZombieHeadshot = data.zombie_headshot,
        ZombieMelee = data.zombie_melee,
        AllowSpecifics = data.allow_specifics,
        Specifics = {
            CopKill = data.cop_kill,
            CopHeadshot = data.cop_headshot,
            CopMelee = data.cop_melee,
            MedicKill = data.medic_kill,
            MedicHeadshot = data.medic_headshot,
            MedicMelee = data.medic_melee,
            TaserKill = data.taser_kill,
            TaserHeadshot = data.taser_headshot,
            TaserMelee = data.taser_melee,
            CloakerKill = data.cloaker_kill,
            CloakerHeadshot = data.cloaker_headshot,
            CloakerMelee = data.cloaker_melee,
            ShieldKill = data.shield_kill,
            ShieldHeadshot = data.shield_headshot,
            ShieldMelee = data.shield_melee,
            TankKill = data.tank_kill,
            TankHeadshot = data.tank_headshot,
            TankMelee = data.tank_melee
        },
        FiresalePrice = data.firesale_price
    }
end