local AddonName, Nukular = ...

local Sounds = {
	[1] = "Interface\\AddOns\\N.U.K.U.L.A.R\\Sounds\\Alert_ProtossCalldownLaunch.mp3",
	[2] = "Interface\\AddOns\\N.U.K.U.L.A.R\\Sounds\\Alert_TerranCalldownLaunch.mp3",
	[3] = "Interface\\AddOns\\N.U.K.U.L.A.R\\Sounds\\Alert_ZergCalldownLaunch.mp3"
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, ...)
	Nukular[event](Nukular, ...)
end)

function Nukular:ADDON_LOADED(addon)
	if addon == AddonName then
		frame:UnregisterEvent("ADDON_LOADED")
		frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	end
end

function Nukular:UNIT_SPELLCAST_SUCCEEDED(unitID, spell, rank, lineID, spellID)
	if spellID == 170526 then
		local random = math.random(3)
		PlaySoundFile(Sounds[random], "Master")
	end
end