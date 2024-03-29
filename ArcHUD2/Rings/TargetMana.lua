local module = ArcHUD:NewModule("TargetMana")
local _, _, rev = string.find("$Rev: 111 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "target"
module.defaults = {
	Enabled = false,
	Outline = true,
	ShowPerc = true,
	ColorMode = "default",
	ColorMana = PowerBarColor[0],
	ColorRage = PowerBarColor[1],
	ColorFocus = PowerBarColor[2],
	ColorEnergy = PowerBarColor[3],
	Side = 2,
	Level = 2,
}
module.options = {
	{name = "ShowPerc", text = "SHOWPERC", tooltip = "SHOWPERC"},
	hasmanabar = true,
	attach = true,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, ArcHUDFrame)
	self.f:SetAlpha(0)

	self.MPPerc = self:CreateFontString(self.f, "BACKGROUND", {40, 12}, 11, "RIGHT", {1.0, 1.0, 1.0}, {"TOPLEFT", self.f, "BOTTOMLEFT", -100, -115})
	self:RegisterMetro(self.name .. "UpdateManaBar", self.UpdateMana, 0.1, self)
end

function module:Update()
	if(self.db.profile.ShowPerc) then
		self.MPPerc:Show()
	else
		self.MPPerc:Hide()
	end

	-- Clear all points for the percentage display
	self.MPPerc:ClearAllPoints()
	if(self.db.profile.Side == 1) then
		-- Attach to left side
		self.MPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", -100, -115)
	else
		-- Attach to right side
		self.MPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", 50, -115)
	end
	if(UnitExists(self.unit)) then
		self.f:SetValue(UnitMana(self.unit))
		self:UpdateColor(PowerBarColor[UnitPowerType(self.unit)])
	end
end

function module:Enable()
	if not UnitExists(self.unit) then
		self.f:SetMax(100)
		self.f:SetValue(0)
		self.MPPerc:SetText("")
	else
		self.f:SetMax(UnitManaMax(self.unit))
		self.f:SetValue(UnitMana(self.unit))
		self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
	end

	-- Register the events we will use
	self:RegisterEvent("UNIT_RUNIC_POWER",	"UpdateMana")
	self:RegisterEvent("UNIT_MANA",			"UpdateMana")
	self:RegisterEvent("UNIT_MAXMANA",		"UpdateMana")
	self:RegisterEvent("UNIT_ENERGY",		"UpdateMana")
	self:RegisterEvent("UNIT_MAXENERGY",	"UpdateMana")
	self:RegisterEvent("UNIT_RAGE",			"UpdateMana")
	self:RegisterEvent("UNIT_MAXRAGE",		"UpdateMana")
	self:RegisterEvent("UNIT_FOCUS",		"UpdateMana")
	self:RegisterEvent("UNIT_MAXFOCUS",		"UpdateMana")
	self:RegisterEvent("UNIT_DISPLAYPOWER")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")

	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")

	self.f:Show()
end

function module:PLAYER_TARGET_CHANGED()
	self.f.alphaState = -1
	if(not UnitExists(self.unit)) then
		self.f:SetMax(100)
		self.f:SetValue(0)
		self.MPPerc:SetText("")
	else
		self.f.pulse = false
		self.f:SetMax(UnitManaMax(self.unit))
		self:UpdateColor(PowerBarColor[UnitPowerType(self.unit)])
		if(UnitIsDead(self.unit) or UnitIsGhost(self.unit) or UnitManaMax(self.unit) == 0) then
			self.f:SetValue(0)
			self.MPPerc:SetText("")
		else
			self.f:SetValue(UnitMana(self.unit))
			self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
		end
	end
end

function module:UNIT_DISPLAYPOWER()
	if(arg1 ~= self.unit) then return end

	self:UpdateColor(PowerBarColor[UnitPowerType(self.unit)])
	self.f:SetValue(UnitMana(self.unit))
	self.f:SetMax(UnitManaMax(self.unit))

	if(UnitManaMax(self.unit) > 0) then
		self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
	else
		self.MPPerc:SetText("")
	end
end

function module:UpdateMana()
	if(event == "UNIT_MAXMANA" or event == "UNIT_MAXENERGY" or event == "UNIT_MAXRAGE" or event == "UNIT_MAXFOCUS") then
		self.f:SetMax(UnitManaMax(self.unit))
		if(UnitManaMax(self.unit) > 0) then
			self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
		else
			self.MPPerc:SetText("")
		end
	else
		self.f:SetValue(UnitMana(self.unit))
		if(UnitManaMax(self.unit) > 0) then
			self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
		else
			self.MPPerc:SetText("")
		end
	end
	if(UnitMana(self.unit) == UnitManaMax(self.unit) or UnitMana(self.unit) == 0) then
		self:StopMetro(self.name .. "UpdateManaBar")
	else
		self:StartMetro(self.name .. "UpdateManaBar")
	end
end
