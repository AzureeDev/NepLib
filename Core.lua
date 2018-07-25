if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

NepLib = NepLib or class(ModCore)

function NepLib:init()
	NepLib.super.init(self, ModPath .. "config.xml", true, true)
end

function NepLib:Error(txt, ...)
	return log("[NepLib] ERROR - " .. tostring(txt), tostring(...))
end

function NepLib:RequireMapScript(map_name)
	if not SystemFS:exists(NepLib.ModPath .. "Classes/Maps/" .. map_name .. ".lua") then
		self:Error("This map specific script does not exist.", map_name)
		return
	end

	dofile(NepLib.ModPath .. "Classes/Maps/" .. map_name .. ".lua")
end

function NepLib:RequireGlobalScript(script_name)
	if not SystemFS:exists(NepLib.ModPath .. "Classes/" .. script_name .. ".lua") then
		self:Error("This specific script does not exist.", script_name)
		return
	end

	dofile(NepLib.ModPath .. "Classes/" .. map_name .. ".lua")
end

if not _G.NepLib then
	local success, err = pcall(function() NepLib:new() end)
	if not success then
		log("[ERROR] An error occured on the initialization of NepLib. " .. tostring(err))
	end
end
