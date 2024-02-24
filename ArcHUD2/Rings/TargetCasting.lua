local module = ArcHUD:NewModule("TargetCasting")
local _, _, rev = string.find("$Rev: 81 $", "([0-9]+)")
module.version = "2.1." .. rev
module.unit = "target"
module.defaults = {
	Enabled = true,
	Outline = true,
	ShowSpell = true,
	ShowTime = true,
	ColorMode = "default",
	ColorFriend = {r = 0, g = 1, b = 0},
	ColorFoe = {r = 1, g = 0, b = 0},
	Side = 1,
	Level = -1,
}
module.options = {
	{name = "ShowSpell", text = "SHOWSPELL", tooltip = "SHOWSPELL"},
	{name = "ShowTime", text = "SHOWTIME", tooltip = "SHOWTIME"},
	hasfriendfoe = true,
	attach = true,
}
module.localized = true

function module:Initialize()
	-- Setup the frame we need
	self.f = self:CreateRing(true, ArcHUDFrame)
	self.f:SetAlpha(0)

	self.Text = self:CreateFontString(self.f, "BACKGROUND", {175, 14}, 10, "LEFT", {1.0, 1.0, 1.0}, {"TOP", "ArcHUDFrameCombo", "BOTTOM", -28, -14})
	self.Time = self:CreateFontString(self.f, "BACKGROUND", {40, 14}, 10, "RIGHT", {1.0, 1.0, 1.0}, {"TOPLEFT", self.Text, "TOPRIGHT", 0, 0})

	-- Register timers
	self:RegisterMetro(self.name .. "Casting", self.Casting, 0.01, self)
end

function module:Update()
	if(self.db.profile.ShowSpell) then
		self.Text:Show()
	else
		self.Text:Hide()
	end

	if(self.db.profile.ShowTime) then
		self.Time:Show()
	else
		self.Time:Hide()
	end
end

function module:Enable()
	self.OnTaxi = nil
	self.flying = nil
	self.f.fadeIn = 0.25
	self.f.fadeOut = 2

	self.f.dirty = true

	-- Register the events we will use
	self:RegisterEvent("UNIT_SPELLCAST_START")
	self:RegisterEvent("UNIT_SPELLCAST_DELAYED")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE")

	self:RegisterEvent("UNIT_SPELLCAST_STOP", 			"SpellcastStop")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", 	"SpellcastChannelStop")

	self:RegisterEvent("PLAYER_TARGET_CHANGED")

	-- Activate the timers
	self:StartMetro(self.name .. "Casting")
	self:StartMetro(self.name .. "Alpha")
	self:StartMetro(self.name .. "Fade")

	self.f:Show()
end

function module:Casting()
	if ( self.f.casting == nil ) then
		self.f.casting = 0 end
	if ( self.channeling == nil ) then
		self.channeling = 0 end
	if ( self.spellstart == nil ) then
		self.spellstart = GetTime()*1000 end

	if ( self.f.casting == 1) then
		local status = (GetTime()*1000 - self.spellstart)
		local time_remaining = self.f.maxValue - status

		if ( self.channeling == 1) then
			status = time_remaining
		end

		if ( status > self.f.maxValue ) then
			status = self.f.maxValue
		end

		self.f:SetValue(status)

		if ( time_remaining < 0 ) then
			time_remaining = 0
		end

		local texttime = ""
		if((time_remaining/1000) > 60) then
			local minutes = math.floor(time_remaining/60000)
			local seconds = math.floor(((time_remaining/60000) - minutes) * 60)
			if(seconds < 10) then
				texttime = minutes..":0"..seconds
			else
				texttime = minutes..":"..seconds
			end
		else
			local intlength = string.len(string.format("%u",time_remaining/1000))
			texttime = strsub(string.format("%f",time_remaining/1000),1,intlength+2)
		end
		self.Time:SetText(texttime)
		if(time_remaining == 0) then
			self:SpellcastStop(self.unit)
		end
	end
end

function module:PLAYER_TARGET_CHANGED()
	local casting, _, _, _, _, _ = UnitCastingInfo(self.unit)
	local channel, _, _, _, _, _ = UnitChannelInfo(self.unit)
	if(casting) then
		self:UNIT_SPELLCAST_START(self.unit)
	elseif(channel) then
		self:UNIT_SPELLCAST_CHANNEL_START(self.unit)
	else
		self:SpellcastStop(self.unit, true)
		self:SpellcastChannelStop(self.unit, true)
	end
end

function module:UNIT_SPELLCAST_START(arg1)
	if(arg1 == self.unit) then
		local spell, rank, displayName, icon, startTime, endTime = UnitCastingInfo(self.unit)
		if(UnitIsFriend("player", self.unit)) then
			self:UpdateColor(1)
			self.Text:SetTextColor(1, 1, 1)
			self.Time:SetTextColor(1, 1, 1)
		else
			self:UpdateColor(2)
			self.Text:SetTextColor(1, 0, 0)
			self.Time:SetTextColor(1, 0, 0)
		end
		self.Text:SetText(displayName)
		self.startValue = 0
		self.f:SetMax(endTime - startTime)
		self.f.casting = 1
		self.channeling = 0
		self.spellstart = startTime
		if(ArcHUD.db.profile.FadeIC > ArcHUD.db.profile.FadeOOC) then
			self.f:SetRingAlpha(ArcHUD.db.profile.FadeIC)
		else
			self.f:SetRingAlpha(ArcHUD.db.profile.FadeOOC)
		end
	end
end

function module:UNIT_SPELLCAST_CHANNEL_START(arg1)
	if(arg1 == self.unit) then
		local spell, rank, displayName, icon, startTime, endTime = UnitChannelInfo(self.unit)
		if(UnitIsFriend("player", self.unit)) then
			self:UpdateColor(1)
			self.Text:SetTextColor(1, 1, 1)
			self.Time:SetTextColor(1, 1, 1)
		else
			self:UpdateColor(2)
			self.Text:SetTextColor(1, 0, 0)
			self.Time:SetTextColor(1, 0, 0)
		end
		self.Text:SetText(displayName)
		self.startValue = 0
		self.f:SetMax(endTime - startTime)
		self.f:SetValue(endTime - startTime)
		self.channeling = 1
		self.f.casting = 1
		self.spellstart = startTime
		if(ArcHUD.db.profile.FadeIC > ArcHUD.db.profile.FadeOOC) then
			self.f:SetRingAlpha(ArcHUD.db.profile.FadeIC)
		else
			self.f:SetRingAlpha(ArcHUD.db.profile.FadeOOC)
		end
	end
end

function module:UNIT_SPELLCAST_CHANNEL_UPDATE()
	if(arg1 == self.unit) then
		local spell, rank, displayName, icon, startTime, endTime = UnitChannelInfo(arg1)
		self.f:SetValue(self.f.startValue - (startTime - self.spellstart))
		self.spellstart = startTime
	end
end

function module:UNIT_SPELLCAST_DELAYED()
	if(arg1 == self.unit) then
		local spell, rank, displayName, icon, startTime, endTime = UnitCastingInfo(arg1)
		self.f:SetMax(endTime - self.spellstart)
	end
end

function module:SpellcastStop(arg1, force)
	if(arg1 == self.unit and self.f.casting == 1 and self.channeling == 0 or force) then
		self.f:SetValue(self.f.maxValue)
		self.f.casting = 0
		self.Time:SetText("")
		self.f:SetRingAlpha(0)
	end
end

function module:SpellcastChannelStop(arg1, force)
	if(arg1 == self.unit and self.f.casting == 1 or force) then
		self.f.casting = 0
		self.channeling = 0
		self.Text:SetText("")
		self.f:SetValue(0)

		self.Time:SetText("")
		self.f:SetRingAlpha(0)
	end
end
