-- Debug levels
local d_warn = 1
local d_info = 2
local d_notice = 3

-- Set mixins and libraries
ArcHUD:SetModuleMixins("AceEvent-2.0", "AceHook-2.1", "Metrognome-2.0")
ArcHUD.modulePrototype.parent = ArcHUD

-- Debug function uses the core :Debug function
function ArcHUD.modulePrototype:Debug(level, msg, ...)
	if(self.parent.LevelDebug) then
		self.parent:LevelDebug(level, "["..self.name.."] "..msg, ...)
	end
end

function ArcHUD.modulePrototype:RegisterDewdropSettings()
	local t = {}

	table.insert(self.parent.dewdrop_menu.L1, {"text", self.L[self.name] or self.name, "hasArrow", true, "value", "L2_"..self.name})

	self.parent.dewdrop_menu["L2_"..self.name] = {
		{
			"text", self.L[self.name] or self.name,
			"isTitle", true
		},
		{
			"text", self.L["Version: "]..self.version,
			"notClickable", true
		},
		{
			"text", self.L["Author: "]..self.author,
			"notClickable", true
		},
		{},
		{
			"text", self.L["TEXT"]["ENABLED"],
			"tooltipTitle", self.L["TEXT"]["ENABLED"],
			"tooltipText", self.L["TOOLTIP"]["ENABLED"],
			"checked", false,
			"func", ArcHUD.modDB,
			"arg1", "toggle",
			"arg2", "Enabled",
			"arg3", self.name
		},
	}
	if(self.f) then
		table.insert(self.parent.dewdrop_menu["L2_"..self.name], {
			"text", self.L["TEXT"]["OUTLINE"],
			"tooltipTitle", self.L["TEXT"]["OUTLINE"],
			"tooltipText", self.L["TOOLTIP"]["OUTLINE"],
			"checked", false,
			"func", ArcHUD.modDB,
			"arg1", "toggle",
			"arg2", "Outline",
			"arg3", self.name
		})

		if(not self.options.nocolor) then
			t = {
				"text", self.L["TEXT"]["COLOR"],
				"tooltipTitle", self.L["TEXT"]["COLOR"],
				"tooltipText", self.L["TOOLTIP"]["COLOR"],
				"hasArrow", true,
				"value", "L3_"..self.name.."_color"
			}
			table.insert(self.parent.dewdrop_menu["L2_"..self.name], t)

			self.parent.dewdrop_menu["L3_"..self.name.."_color"] = { }
			if(self.options.hascolorfade) then
				t = {
					"text", self.L["TEXT"]["COLORFADE"],
					"tooltipTitle", self.L["TEXT"]["COLORFADE"],
					"tooltipText", self.L["TOOLTIP"]["COLORFADE"],
					"checked", false,
					"isRadio", true,
					"func", ArcHUD.modDB,
					"arg1", "set",
					"arg2", "ColorMode",
					"arg3", self.name,
					"arg4", "fade"
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)
			end

			t = {
				"text", self.L["TEXT"]["COLORDEF"],
				"tooltipTitle", self.L["TEXT"]["COLORDEF"],
				"tooltipText", self.L["TOOLTIP"]["COLORDEF"],
				"checked", false,
				"isRadio", true,
				"func", ArcHUD.modDB,
				"arg1", "set",
				"arg2", "ColorMode",
				"arg3", self.name,
				"arg4", "default"
			}
			table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

			t = {
				"text", self.L["TEXT"]["COLORCUST"],
				"tooltipTitle", self.L["TEXT"]["COLORCUST"],
				"tooltipText", self.L["TOOLTIP"]["COLORCUST"],
				"checked", false,
				"isRadio", true,
				"func", ArcHUD.modDB,
				"arg1", "set",
				"arg2", "ColorMode",
				"arg3", self.name,
				"arg4", "custom"
			}
			table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

			table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], {})

			if(self.options.hasfriendfoe) then
				t = {
					"text", self.L["TEXT"]["COLORFRIEND"],
					"tooltipTitle", self.L["TEXT"]["COLORFRIEND"],
					"tooltipText", self.L["TOOLTIP"]["COLORFRIEND"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorFriend",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

				t = {
					"text", self.L["TEXT"]["COLORFOE"],
					"tooltipTitle", self.L["TEXT"]["COLORFOE"],
					"tooltipText", self.L["TOOLTIP"]["COLORFOE"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorFoe",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)
			elseif(self.options.hasmanabar) then
				t = {
					"text", self.L["TEXT"]["COLORMANA"],
					"tooltipTitle", self.L["TEXT"]["COLORMANA"],
					"tooltipText", self.L["TOOLTIP"]["COLORMANA"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorMana",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

				t = {
					"text", self.L["TEXT"]["COLORRAGE"],
					"tooltipTitle", self.L["TEXT"]["COLORRAGE"],
					"tooltipText", self.L["TOOLTIP"]["COLORRAGE"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorRage",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

				t = {
					"text", self.L["TEXT"]["COLORFOCUS"],
					"tooltipTitle", self.L["TEXT"]["COLORFOCUS"],
					"tooltipText", self.L["TOOLTIP"]["COLORFOCUS"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorFocus",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)

				t = {
					"text", self.L["TEXT"]["COLORENERGY"],
					"tooltipTitle", self.L["TEXT"]["COLORENERGY"],
					"tooltipText", self.L["TOOLTIP"]["COLORENERGY"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "ColorEnergy",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)
			else
				t = {
					"text", self.L["TEXT"]["COLORSET"],
					"tooltipTitle", self.L["TEXT"]["COLORSET"],
					"tooltipText", self.L["TOOLTIP"]["COLORSET"],
					"hasColorSwatch", true,
					"r", 1,
					"g", 1,
					"b", 1,
					"colorFunc", function(val, mod, r, g, b, a) ArcHUD.modDB("set", val, mod, {r = r, g = g, b = b}) end,
					"colorArg1", "Color",
					"colorArg2", self.name
				}
				table.insert(self.parent.dewdrop_menu["L3_"..self.name.."_color"], t)
			end
		end
	end

	for k,v in ipairs(self.options) do
		if(self.customlocals) then
			if(type(v) == "table") then
				t = {
					"text", v.text,
					"tooltipTitle", v.text,
					"tooltipText", v.tooltip,
					"checked", false,
					"func", ArcHUD.modDB,
					"arg1", "toggle",
					"arg2", v.name,
					"arg3", self.name
				}
				table.insert(self.parent.dewdrop_menu["L2_"..self.name], t)
			end
		else
			if(type(v) == "table") then
				t = {
					"text", self.L["TEXT"][v.text],
					"tooltipTitle", self.L["TEXT"][v.text],
					"tooltipText", self.L["TOOLTIP"][v.tooltip],
					"checked", false,
					"func", ArcHUD.modDB,
					"arg1", "toggle",
					"arg2", v.name,
					"arg3", self.name
				}
				table.insert(self.parent.dewdrop_menu["L2_"..self.name], t)
			end
		end
	end

	t = {
		"text", self.L["TEXT"]["SIDE"],
		"tooltipTitle", self.L["TEXT"]["SIDE"],
		"tooltipText", self.L["TOOLTIP"]["SIDE"],
		"disabled", (not self.options.attach),
		"hasArrow", true,
		"value", "L3_"..self.name
	}
	table.insert(self.parent.dewdrop_menu["L2_"..self.name], t)
	self.parent.dewdrop_menu["L3_"..self.name] = {
		{
			"text", self.L["SIDE"]["LEFT"],
			"isRadio", true,
			"checked", true,
			"func", ArcHUD.modDB,
			"arg1", "set",
			"arg2", "Side",
			"arg3", self.name,
			"arg4", 1
		},
		{
			"text", self.L["SIDE"]["RIGHT"],
			"isRadio", true,
			"checked", false,
			"func", ArcHUD.modDB,
			"arg1", "set",
			"arg2", "Side",
			"arg3", self.name,
			"arg4", 2
		},
	}
	t = {
		"text", self.L["TEXT"]["LEVEL"],
		"tooltipTitle", self.L["TEXT"]["LEVEL"],
		"tooltipText", self.L["TOOLTIP"]["LEVEL"],
		"disabled", (not self.options.attach),
		"hasArrow", true,
		"hasSlider", true,
		"sliderMin", -5,
		"sliderMax", 5,
		"sliderStep", 1,
		"sliderValue", 0,
		"sliderFunc", ArcHUD.modDB,
		"sliderArg1", "set",
		"sliderArg2", "Level",
		"sliderArg3", self.name
	}
	table.insert(self.parent.dewdrop_menu["L2_"..self.name], t)


end

-- Enabling/Disabling

function ArcHUD.modulePrototype:OnInitialize()
	self.parent:ToggleModuleActive(self, false)
	self:Debug(d_notice, "Creating locale instance")
	self.L = AceLibrary("AceLocale-2.2"):new("ArcHUD_Module")
	if(self.Initialize) then
		self:Initialize()
		self:Debug(d_info, "Ring initialized")
		self:RegisterEvent("ARCHUD_MODULE_ENABLE")
		self:RegisterEvent("ARCHUD_MODULE_UPDATE")
	else
		self:Debug(d_warn, "Missing Initialize(). Aborting")
		return
	end
	if(self.defaults and type(self.defaults) == "table") then
		-- Add defaults to ArcHUD defaults table
		self:Debug(d_notice, "Acquiring ring DB namespace")
		self.db = self.parent:AcquireDBNamespace(self.name)
		self:Debug(d_notice, "Registering ring default options")
		self.parent:RegisterDefaults(self.name, "profile", self.defaults)
		if(not self.db) then
			self:Debug(d_warn, "Failed to acquire DB namespace")
		end

		-- Register chat commands
		self:RegisterDewdropSettings()
	end

	-- Add metadata for module if it doesn't exist
	if(not self.version) then
		self.version = self.parent.version
	end
	if(not self.author) then
		self.author = self.parent.author
	end
	if(not self.date) then
		self.date = self.parent.date
	end

	self:Debug(d_notice, "Registering Metrognome timers")
	if(not self:MetroStatus(self.name .. "Alpha")) then
		self:RegisterMetro(self.name .. "Alpha", ArcHUDRingTemplate.AlphaUpdate, 0.01, self.f)
	end
	if(not self:MetroStatus(self.name .. "Fade")) then
		self:RegisterMetro(self.name .. "Fade", ArcHUDRingTemplate.DoFadeUpdate, 0.01, self.f)
	end
	if(not self:MetroStatus(self.name .. "Update")) then
		self:RegisterMetro(self.name .. "Update", ArcHUDRingTemplate.UpdateAlpha, 0.05, self)
	end
	self:Debug(d_info, "Ring loaded")
end

function ArcHUD.modulePrototype:OnEnable()
	self:Debug(d_notice, "Recieved enable event")
	if(self.Enable and self.db.profile.Enabled) then
		self:Debug(d_info, "Enabling ring")
		if(self.disableEvents and (not self.disableEvents.option or self.disableEvents.option and self.db.profile[self.disableEvents.option])) then
			self:Debug(d_notice, "Disabling events:")
			for k,v in ipairs(self.disableEvents) do
				local f = getglobal(v.frame)
				if(f) then
					self:Debug(d_notice, "- Frame '"..f:GetName().."':")
					for _, event in pairs(v.events) do
						self:Debug(d_notice, "  * "..event)
						f:UnregisterEvent(event)
					end
					if(v.hide and f:IsVisible()) then
						self:Debug(d_notice, "- Frame '"..f:GetName().."' hiding")
						f:Hide()
					end
				end
			end
			self.eventsDisabled = TRUE
		end
		self:Debug(d_notice, "Calling Update handler")
		self:ARCHUD_MODULE_UPDATE(self:ToString())
		self:Debug(d_notice, "Calling self:Enable()")
		self:Enable()
		self:RegisterEvent("ARCHUD_MODULE_DISABLE")
		if(not self:IsEventRegistered("ARCHUD_MODULE_UPDATE")) then
			self:RegisterEvent("ARCHUD_MODULE_UPDATE")
		end
		self:Debug(d_info, "Ring enabled")
	else
		self:Debug(d_info, "Ring disabled as per user setting")
		self.parent:ToggleModuleActive(self, false)
	end
end

function ArcHUD.modulePrototype:OnDisable()
	self:Debug(d_info, "Disabling ring")
	if(self.disableEvents and self.eventsDisabled) then
		self:Debug(d_notice, "Re-enabling events:")
		for k,v in ipairs(self.disableEvents) do
			local f = getglobal(v.frame)
			if(f) then
				self:Debug(d_notice, "- Frame '"..f:GetName().."':")
				for _, event in pairs(v.events) do
					self:Debug(d_notice, "  * "..event)
					f:RegisterEvent(event)
				end
			end
		end
		self.eventsDisabled = FALSE
	end
	if(self.f) then
		self.f:Hide()
	end
	if(self.Disable) then
		self:Disable()
	end
	self:RegisterEvent("ARCHUD_MODULE_ENABLE")
	self:RegisterEvent("ARCHUD_MODULE_UPDATE")
	self:Debug(d_info, "Ring disabled")
end

function ArcHUD.modulePrototype:ARCHUD_MODULE_ENABLE()
	self.parent:ToggleModuleActive(self, true)
end
function ArcHUD.modulePrototype:ARCHUD_MODULE_DISABLE()
	self.parent:ToggleModuleActive(self, false)
end
function ArcHUD.modulePrototype:ARCHUD_MODULE_UPDATE(module)
	if(module == self:ToString()) then
		if(self.db.profile.Enabled and not self.parent:IsModuleActive(self)) then
			self.parent:ToggleModuleActive(self, true)
		elseif(not self.db.profile.Enabled and self.parent:IsModuleActive(self)) then
			self.parent:ToggleModuleActive(self, false)
		elseif(self.db.profile.Enabled and self.parent:IsModuleActive(self)) then
			if(self.f.BG) then
				if(self.db.profile.Outline) then
					self.f.BG:Show()
				else
					self.f.BG:Hide()
				end
			end

			if(not self.nocolor) then
				self.ColorMode = self.db.profile.ColorMode
			end

			-- Special treatment for Pet rings
			if(string.find(self.name, "Pet")) then
				self.options.attach = self.db.profile.Attach
			end

			if(self.options.attach) then
				-- Clear all points for the ring
				self.f:ClearAllPoints()
				self.f:SetValue(0)
				if(self.db.profile.Side == 1) then
					-- Attach to left side
					self.f:SetPoint("TOPLEFT", self.parent:GetModule("Anchors").Left, "TOPLEFT", self.db.profile.Level * -15, 0)
					if(self.f.BG) then
						self.f.BG:SetReversed(false)
					end
					self.f:SetReversed(false)
				else
					-- Attach to right side
					self.f:SetPoint("TOPRIGHT", self.parent:GetModule("Anchors").Right, "TOPRIGHT", self.db.profile.Level * 15, 0)
					if(self.f.BG) then
						self.f.BG:SetReversed(true)
					end
					self.f:SetReversed(true)
				end
				if(self.f.BG) then
					self.f.BG:SetAngle(180)
				end
			end

			if(self.Update) then
				self:Debug(d_info, "Updating ring")
				self:Update()
			end
		end
	end
end

-- Ring frame creation and setup
function ArcHUD.modulePrototype:CreateRing(hasBG, parent)
	-- Create frame
	local f = CreateFrame("Frame", nil, parent)
	f:SetFrameStrata("BACKGROUND")
	f:SetFrameLevel(10)
	f:SetWidth(256)
	f:SetHeight(256)

	-- Set up textures
	local t

	f.quadrants = {}

	t = f:CreateTexture(nil, "ARTWORK")
	t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\Ring.tga")
	t:SetAllPoints(f)
	f.quadrants[1] = t

	t = f:CreateTexture(nil, "ARTWORK")
	t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\Ring.tga")
	t:SetAllPoints(f)
	f.quadrants[2] = t

	t = f:CreateTexture(nil, "ARTWORK")
	t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\Ring.tga")
	t:SetAllPoints(f)
	f.chip = t

	t = f:CreateTexture(nil, "ARTWORK")
	t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\Slice.tga")
	t:SetAllPoints(f)
	f.slice = t

	-- Set up frame
	ArcHUDRingTemplate:OnLoad(f)

	if(hasBG) then
		-- Create frame
		local fBG = CreateFrame("Frame", nil, f)
		fBG:SetFrameLevel(0)
		fBG:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 0, 0)
		fBG:SetWidth(256)
		fBG:SetHeight(256)

		-- Set up textures
		fBG.quadrants = {}
		t = fBG:CreateTexture(nil, "BACKGROUND")
		t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\RingBG.tga")
		t:SetAllPoints(fBG)
		fBG.quadrants[1] = t

		t = fBG:CreateTexture(nil, "BACKGROUND")
		t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\RingBG.tga")
		t:SetAllPoints(fBG)
		fBG.quadrants[2] = t

		t = fBG:CreateTexture(nil, "BACKGROUND")
		t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\RingBG.tga")
		t:SetAllPoints(fBG)
		fBG.chip = t

		t = fBG:CreateTexture(nil, "BACKGROUND")
		t:SetTexture("Interface\\Addons\\ArcHUD2\\Icons\\Slice.tga")
		t:SetAllPoints(fBG)
		fBG.slice = t

		-- Set up frame
		ArcHUDRingTemplate:OnLoadBG(fBG)

		f.BG = fBG
	end

	return f
end

function ArcHUD.modulePrototype:CreateFontString(parent, layer, size, fontsize, justify, color, point)
	local fs = parent:CreateFontString(nil, layer)
	local width, height = unpack(size)

	fs:SetWidth(width)
	fs:SetHeight(height)
	fs:SetFont("Fonts\\"..self.L["FONT"], fontsize, "OUTLINE")
	if(color) then
		fs:SetTextColor(unpack(color))
	end
	fs:SetJustifyH(justify)
	fs:SetPoint(unpack(point))

	fs:Show()

	return fs
end

function ArcHUD.modulePrototype:CreateTexture(parent, layer, size, texture, point)
	local t = parent:CreateTexture(nil, layer)
	local width, height = unpack(size)

	t:SetWidth(width)
	t:SetHeight(height)
	if(texture) then
		t:SetTexture(texture)
	end
	if(point) then
		t:SetPoint(unpack(point))
	end

	t:Show()

	return t
end

-- Support stuff
local color_switch = {
	friendfoe = {
		[1] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorFriend or self.db.profile.ColorFriend) end,
		[2] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorFoe or self.db.profile.ColorFoe) end,
	},
	manabar = {
		[0] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorMana or self.db.profile.ColorMana) end,
		[1] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorRage or self.db.profile.ColorRage) end,
		[2] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorFocus or self.db.profile.ColorFocus) end,
		[3] = function(self) self.f:UpdateColor(self.ColorMode == "default" and self.defaults.ColorEnergy or self.db.profile.ColorEnergy) end,
	}
}

function ArcHUD.modulePrototype:UpdateColor(color)
	if(color and type(color) == "table") then
		self.f:UpdateColor(color)
	elseif(color and type(color) == "number") then
		if(self.options.hasfriendfoe) then
			-- Friend / Foe = 1 / 2
			if(color_switch.friendfoe[color]) then
				color_switch.friendfoe[color](self)
			end
		elseif(self.options.hasmanabar) then
			-- Mana / Rage / Focus / Energy = 0 / 1 / 2 / 3
			if(color_switch.manabar[color]) then
				color_switch.manabar[color](self)
			end
		end
	else
		if(self.ColorMode == "fade") then return end
		self.f:UpdateColor(self.ColorMode == "default" and self.defaults.Color or self.db.profile.Color)
	end
end
