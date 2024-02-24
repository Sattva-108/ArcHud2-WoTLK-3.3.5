local module = ArcHUD:NewModule("PetHealth")
local _, _, rev = string.find("$Rev: 82 $", "([0-9]+)")
module.version = "2.0." .. rev
module.unit = "pet"
module.defaults = {
	Enabled = true,
	Outline = true,
	ShowPerc = true,
	ColorMode = "fade",
	Color = {r = 0, g = 1, b = 0},
	Attach = false,
	Side = 1,
	Level = -2,
}
module.options = {
	{name = "ShowPerc", text = "SHOWPERC", tooltip = "SHOWPERC"},
	{name = "Attach", text = "ATTACHRING", tooltip = "ATTACHRING"},
	hascolorfade = true,
	attach = false,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, ArcHUDFrame)

	self.f:SetAlpha(0)

	self.HPPerc = self:CreateFontString(self.f, "BACKGROUND", {100, 17}, 16, "RIGHT", {1.0, 1.0, 1.0}, {"BOTTOMLEFT", self.f, "BOTTOMLEFT", -165, -125})
end

function module:Update()
	if(self.db.profile.ShowPerc) then
		self.HPPerc:Show()
	else
		self.HPPerc:Hide()
	end

	if(self.db.profile.Attach) then
		self.f:SetScale(1)
		fontName, _, fontFlags = self.HPPerc:GetFont()
		self.HPPerc:SetFont(fontName, 11, fontFlags)

		self.HPPerc:SetWidth(40)
		self.HPPerc:SetHeight(12)

		self.HPPerc:ClearAllPoints()
		if(self.db.profile.Side == 1) then
			-- Attach to left side
			self.HPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", -100, -115)
		else
			-- Attach to right side
			self.HPPerc:SetPoint("TOPLEFT", self.f, "BOTTOMLEFT", 50, -115)
		end
	else
		self.f:SetScale(0.6)
		self.f.BG:SetReversed(false)
		self.f.BG:SetAngle(180)

		self.f:SetReversed(false)
		self.f:ClearAllPoints()
		self.f:SetPoint("TOPLEFT", self.parent:GetModule("Anchors").Left, "LEFT", 0, 90)

		self.HPPerc:SetWidth(100)
		self.HPPerc:SetHeight(17)

		self.HPPerc:ClearAllPoints()
		self.HPPerc:SetPoint("BOTTOMLEFT", self.f, "BOTTOMLEFT", -165, -125)
		fontName, _, fontFlags = self.HPPerc:GetFont()
		self.HPPerc:SetFont(fontName, 16, fontFlags)
	end

	self.f:SetValue(UnitHealth(self.unit))
	self:UpdateColor()
end

function module:Enable()
	self:UpdateColor(self.defaults.Color)
	if(UnitExists(self.unit)) then
		self.HPPerc:SetText(floor((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100).."%")
		self.f:SetMax(UnitHealthMax(self.unit))
		self.f:SetValue(UnitHealth(self.unit))
	else
		self.HPPerc:SetText("")
		self.f:SetValue(0)
	end

	-- Register the events we will use
	self:RegisterEvent("PET_UI_UPDATE",			"UpdatePet")
	self:RegisterEvent("PLAYER_PET_CHANGED",	"UpdatePet")
	self:RegisterEvent("PET_BAR_CHANGED",		"UpdatePet")
	self:RegisterEvent("UNIT_PET",				"UpdatePet")
	self:RegisterEvent("UNIT_HEALTH", 			"UpdateHealth")
	self:RegisterEvent("UNIT_MAXHEALTH", 		"UpdateHealth")
	--f:RegisterEvent("PET_UI_CLOSE")

	-- Activate the timers
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")
	self:StartMetro(self.name .. "Update")

	self.f:Show()
end

function module:UpdatePet()
	if(event == "UNIT_PET" and arg1 ~= "player") then return end
	if(UnitExists(self.unit)) then
		self:UpdateColor()
		self.f:SetMax(UnitHealthMax(self.unit))
		self.f:SetValue(UnitHealth(self.unit))
		self.HPPerc:SetText(floor((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100).."%")
		self.f:Show()
	else
		self.f:Hide()
	end
end

function module:UpdateHealth()
	if(arg1 == self.unit) then
		local p=UnitHealth(self.unit)/UnitHealthMax(self.unit)
		local r, g = 1, 1
		if ( p > 0.5 ) then
			r = (1.0 - p) * 2
			g = 1.0
		else
			r = 1.0
			g = p * 2
		end
		if ( r < 0 ) then r = 0 elseif ( r > 1 ) then r = 1 end
		if ( g < 0 ) then g = 0 elseif ( g > 1 ) then g = 1 end
		if(self.ColorMode == "fade") then
			self:UpdateColor({r = r, g = g, b = 0})
		else
			self:UpdateColor()
		end

		if (event == "UNIT_MAXHEALTH") then
			self.f:SetMax(UnitHealthMax(self.unit))
		else
			self.f:SetValue(UnitHealth(self.unit))
			self.HPPerc:SetText(floor((UnitHealth(self.unit) / UnitHealthMax(self.unit)) * 100).."%")
		end
	end
end
