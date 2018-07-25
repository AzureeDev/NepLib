NepLib.Utils = NepLib.Utils or {}

function NepLib.Utils:CurrentMap()
    return Global.game_settings.level_id
end

function NepLib.Utils:IsZombieMap()
    if tweak_data.levels[Global.game_settings.level_id].ZM then
        return true
    end

    return false
end

