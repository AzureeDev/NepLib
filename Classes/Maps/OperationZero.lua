OperationZero = OperationZero or class(ZMGlobalFramework)

function OperationZero:init()
    self:InitSpecificMapGlobals({
        name = "Operation Zero",
        id = "operation_zero",
        
        global_key = OPERATION_ZERO,
        start_money = 500,
        max_perks = 4,
        zombie_start_spawn = 6,
        allow_max_ammo = true,
        allow_double_points = true,
        allow_insta_kill = true,
        allow_kaboom = true,
        allow_firesale = true,
        allow_infinite_ammo = false,
        allow_zombie_blood = true,
        allow_perk_power_up = false,
        allow_death_machine = true
    })

    self:InitEconomy()
end