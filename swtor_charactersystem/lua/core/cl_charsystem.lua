SCS = SCS or {}

local background = Material("background.png")

local factions = {
    "Sith" = {
        name = "Sith Imperium",
        logo = Material("sith_logo.png"),
    },
    "Republic" = {
        name = "Galactic Republic",
        logo = Material("jedi_logo.png"),
    },
}

local function SCS.FactionSelectMenu()
    local SCS.FactionSelectBackground = vgui.Create("DFrame")
    SCS.FactionSelectBackground:SetSize(surface.ScreenWidth(), surface.ScreenHeight())
    SCS.FactionSelectBackground:SetPos(0, 0)
    SCS.FactionSelectBackground:SetTitle("")
    SCS.FactionSelectBackground:SetDraggable(false)
    SCS.FactionSelectBackground:ShowCloseButton(false)
    SCS.FactionSelectBackground:MakePopup()
    SCS.FactionSelectBackground.Paint = function(self, w, h)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(background)
        surface.DrawTexturedRect(0, 0, w, h)
    end
    
    local SCS.FactionSelectButton = SCS.FactionSelectBackground:Add("DButton")
    SCS.FactionSelectButton:SetSize(200, 50)
    SCS.FactionSelectButton:SetPos(0, 0)
    SCS.FactionSelectButton:SetText(" ")
    SCS.FactionSelectButton.Paint = function(self, w, h)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(factions.logo)
        surface.DrawTexturedRect(0, 0, w, h)
    end

end 