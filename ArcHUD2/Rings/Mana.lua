local module = ArcHUD:NewModule("Mana")
local _, _, rev = string.find("$Rev: 111 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "player"
module.defaults = {
	Enabled = true,
	Outline = true,
	ShowText = true,
	ShowPerc = true,
	ColorMode = "default",
	ColorMana = PowerBarColor[0],
	ColorRage = PowerBarColor[1],
	ColorFocus = PowerBarColor[2],
	ColorEnergy = PowerBarColor[3],
	Side = 2,
	Level = 0,
}
module.options = {
	{name = "ShowText", text = "SHOWTEXT", tooltip = "SHOWTEXT"},
	{name = "ShowPerc", text = "SHOWPERC", tooltip = "SHOWPERC"},
	hasmanabar = true,
	attach = true,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, ArcHUDFrame)
	self.f:SetAlpha(0)

	self.MPText = self:CreateFontString(self.f, "BACKGROUND", {150, 15}, 14, "LEFT", {1.0, 1.0, 0.0}, {"TOPLEFT", ArcHUDFrameCombo, "TOPRIGHT", 0, 0})
	self.MPPerc = self:CreateFontString(self.f, "BACKGROUND", {40, 14}, 12, "LEFT", {1.0, 1.0, 1.0}, {"TOPLEFT", self.MPText, "BOTTOMLEFT", 0, 0})
	self:RegisterMetro(self.name .. "UpdateManaBar", self.UpdateMana, 0.1, self, self.unit)
end

function module:Update()
	if(self.db.profile.ShowText) then
		self.MPText:Show()
	else
		self.MPText:Hide()
	end

	if(self.db.profile.ShowPerc) then
		self.MPPerc:Show()
	else
		self.MPPerc:Hide()
	end

	self.f:SetValue(UnitMana(self.unit))
	self:UpdateColor(PowerBarColor[UnitPowerType(self.unit)])
end

function module:Enable()
	self.f.pulse = false

	if(UnitIsGhost(self.unit)) then
		self.f:GhostMode(true, self.unit)
	else
		self.f:GhostMode(false, self.unit)

		if(UnitPowerType(self.unit) == 0) then
			info = { r = 0.00, g = 1.00, b = 1.00 }
		else
			info = PowerBarColor[UnitPowerType(self.unit)]
		end
		self.MPText:SetVertexColor(info.r, info.g, info.b)

		self.f:SetMax(UnitManaMax(self.unit))
		self.f:SetValue(UnitMana(self.unit))
		self.MPText:SetText(UnitMana(self.unit).."/"..UnitManaMax(self.unit))
		self.MPPerc:SetText(floor((UnitMana(self.unit)/UnitManaMax(self.unit))*100).."%")
	end

	-- Register the events we will use
	self:RegisterEvent("UNIT_RUNIC_POWER",	"UpdateMana")
	self:RegisterEvent("UNIT_MANA", 		"UpdateMana")
	self:RegisterEvent("UNIT_MAXMANA", 		"UpdateMana")
	self:RegisterEvent("UNIT_ENERGY", 		"UpdateMana")
	self:RegisterEvent("UNIT_MAXENERGY", 	"UpdateMana")
	self:RegisterEvent("UNIT_RAGE", 		"UpdateMana")
	self:RegisterEvent("UNIT_MAXRAGE", 		"UpdateMana")
	self:RegisterEvent("UNIT_DISPLAYPOWER", "UpdateType")
	self:RegisterEvent("PLAYER_ALIVE", 		"UpdateMana")
	self:RegisterEvent("PLAYER_LEVEL_UP")

	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")

	self.f:Show()
end

function module:PLAYER_LEVEL_UP()
	self.f:SetMax(UnitManaMax(self.unit))
end

function module:UpdateMana(arg1)
	if (arg1 == self.unit) then
		if(UnitIsGhost(self.unit) or (UnitIsDead(self.unit) and event == "PLAYER_ALIVE")) then
			self.f:GhostMode(true, self.unit)
		else
			self.f:GhostMode(false, self.unit)

			self.MPText:SetText(UnitMana(self.unit).."/"..UnitManaMax(self.unit))
			self.MPPerc:SetText(floor((UnitMana(self.unit)/UnitManaMax(self.unit))*100).."%")

			self.f:SetMax(UnitManaMax(self.unit))
			self.f:SetValue(UnitMana(self.unit))
		end
		if (UnitMana(self.unit) == UnitManaMax(self.unit) or UnitMana(self.unit) == 0) then
			self:StopMetro(self.name .. "UpdateManaBar")
		else
			self:StartMetro(self.name .. "UpdateManaBar")
		end
	end
end
function module:UpdateType(arg1)
	if (arg1 == self.unit) then
			if(event == "UNIT_DISPLAYPOWER") then
				if(UnitPowerType(self.unit) == 0) then
					info = { r = 0.00, g = 1.00, b = 1.00 }
				else
					info = PowerBarColor[UnitPowerType(self.unit)]
				end
				self:UpdateColor(info)
				self.MPText:SetVertexColor(info.r, info.g, info.b)
			end
			self:UpdateMana(self.unit)
	end
end

