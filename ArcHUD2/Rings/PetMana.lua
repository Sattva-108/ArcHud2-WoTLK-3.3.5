local module = ArcHUD:NewModule("PetMana")
local _, _, rev = string.find("$Rev: 102 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "pet"
module.defaults = {
	Enabled = true,
	Outline = true,
	ShowPerc = true,
	ColorMode = "default",
	ColorMana = PowerBarColor[0],
	ColorRage = PowerBarColor[1],
	ColorFocus = PowerBarColor[2],
	ColorEnergy = PowerBarColor[3],
	Attach = false,
	Side = 2,
	Level = -2,
}
module.options = {
	{name = "ShowPerc", text = "SHOWPERC", tooltip = "SHOWPERC"},
	{name = "Attach", text = "ATTACHRING", tooltip = "ATTACHRING"},
	hasmanabar = true,
	attach = false,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, ArcHUDFrame)

	self.f.BG:SetReversed(true)
	self.f.BG:SetAngle(180)

	self.f:SetReversed(true)
	self.f:SetAlpha(0)

	self.MPPerc = self:CreateFontString(self.f, "BACKGROUND", {100, 17}, 16, "LEFT", {1.0, 1.0, 1.0}, {"BOTTOMLEFT", self.f, "BOTTOMLEFT", 65, -125})
end

function module:Update()
	if(self.db.profile.ShowPerc) then
		self.MPPerc:Show()
	else
		self.MPPerc:Hide()
	end

	if(self.db.profile.Attach) then
		self.f:SetScale(1)
		fontName, _, fontFlags = self.MPPerc:GetFont()
		self.MPPerc:SetFont(fontName, 11, fontFlags)

		self.MPPerc:SetWidth(40)
		self.MPPerc:SetHeight(12)

		self.MPPerc:ClearAllPoints()
		if(self.db.profile.Side == 1) then
			-- Attach to left side
			self.MPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", -100, -115)
		else
			-- Attach to right side
			self.MPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", 50, -115)
		end
	else
		self.f:SetScale(0.6)
		self.f.BG:SetReversed(true)
		self.f.BG:SetAngle(180)

		self.f:SetReversed(true)
		self.f:ClearAllPoints()
		self.f:SetPoint("TOPLEFT", self.parent:GetModule("Anchors").Right, "LEFT", 0, 90)

		self.MPPerc:SetWidth(100)
		self.MPPerc:SetHeight(17)

		self.MPPerc:ClearAllPoints()
		self.MPPerc:SetPoint("BOTTOMLEFT", self.f, "BOTTOMLEFT", 65, -125)
		fontName, _, fontFlags = self.MPPerc:GetFont()
		self.MPPerc:SetFont(fontName, 16, fontFlags)
	end

	self.f:SetValue(UnitMana(self.unit))
	self:UpdateColor(UnitPowerType(self.unit))
end

function module:Enable()
	self.f:SetMax(10)
	self.f:SetValue(10)

	if(UnitExists(self.unit)) then
		self.MPPerc:SetText(floor((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100).."%")
		self.f:SetMax(UnitManaMax(self.unit))
		self.f:SetValue(UnitMana(self.unit))
	else
		self.MPPerc:SetText("")
		self.f:SetValue(0)
	end

	-- Register the events we will use
	self:RegisterEvent("PET_UI_UPDATE",			"UpdatePet")
	self:RegisterEvent("PLAYER_PET_CHANGED",	"UpdatePet")
	self:RegisterEvent("PET_BAR_CHANGED",		"UpdatePet")
	self:RegisterEvent("UNIT_PET",				"UpdatePet")
	self:RegisterEvent("UNIT_MANA",				"UpdateMana")
	self:RegisterEvent("UNIT_MAXMANA",			"UpdateMana")
	self:RegisterEvent("UNIT_ENERGY",			"UpdateMana")
	self:RegisterEvent("UNIT_MAXENERGY",		"UpdateMana")
	self:RegisterEvent("UNIT_RAGE",				"UpdateMana")
	self:RegisterEvent("UNIT_MAXRAGE",			"UpdateMana")
	self:RegisterEvent("UNIT_FOCUS",			"UpdateMana")
	self:RegisterEvent("UNIT_MAXFOCUS",			"UpdateMana")
	self:RegisterEvent("UNIT_DISPLAYPOWER")
	--self:RegisterEvent("PET_UI_CLOSE")

	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")

	self.f:Show()
end

function module:UNIT_DISPLAYPOWER()
	self:UpdateColor(UnitPowerType(self.unit))
	self.f:SetMax(UnitManaMax(self.unit))
end

function module:UpdatePet()
	if(event == "UNIT_PET" and arg1 ~= "player") then return end
	if(UnitExists(self.unit)) then
		self:UpdateColor(UnitPowerType(self.unit))
		self.f:SetMax(UnitManaMax(self.unit))
		self.f:SetValue(UnitMana(self.unit))
		self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
		self.f:Show()
	else
		self.f:Hide()
	end
end

function module:UpdateMana()
	if(arg1 == self.unit) then
		if(event == "UNIT_MAXMANA" or event == "UNIT_MAXENERGY" or event == "UNIT_MAXRAGE" or event == "UNIT_MAXFOCUS") then
			self:UpdateColor(UnitPowerType(self.unit))
			self.f:SetMax(UnitManaMax(self.unit))
		else
			self.f:SetValue(UnitMana(self.unit))
			self.MPPerc:SetText(floor((UnitMana(self.unit) / UnitManaMax(self.unit)) * 100).."%")
		end
	end
end

