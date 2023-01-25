if not CLIENT then return end 

surface.CreateFont("SCS.FactionSelectFont", {
    font = "Roboto",
    size = 24,
    weight = 500,
    antialias = true,
    extended = true,
})

local background = Material("swtor_charsys/background.png")
local logo = Material("swtor_charsys/logo.png")


function SCS_FactionSelectMenu()
    local FactionSelectBackground = vgui.Create("DFrame")
    FactionSelectBackground:SetPos(0, 0)
    FactionSelectBackground:SetSize(ScrW(), ScrH())
    FactionSelectBackground:SetTitle("")
    FactionSelectBackground:ShowCloseButton(true)
    FactionSelectBackground:SetDraggable(false)
    FactionSelectBackground:MakePopup()
    FactionSelectBackground.Paint = function(self, w, h)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(background)
        surface.DrawTexturedRect(0, 0, w, h)

        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(logo)
        surface.DrawTexturedRect(ScrW() / 2 - 410, 150, 767, 255)
    end
    
    for i, v in pairs(SWTOR.CHARACTER.Config.Factions) do
        local FactionSelectButton = FactionSelectBackground:Add("DButton", FactionSelectBackground)
        FactionSelectButton:SetSize(256, 256)
        FactionSelectButton:SetPos((i - 1) * 300 + 500, ScrH() / 2 - 150 + 100)
        FactionSelectButton:SetText("")
        FactionSelectButton.Paint = function(self, w, h)
            if self:IsHovered() then 
                surface.SetDrawColor(250, 250, 250, 255)
                surface.SetMaterial(v.icon)
                surface.DrawTexturedRect(0, 0, w, h)
            else 
                surface.SetDrawColor(150, 150, 150, 255)
                surface.SetMaterial(v.icon)
                surface.DrawTexturedRect(0, 0, w, h)
            end
        end
        FactionSelectButton.DoClick = function()
            FactionSelectBackground:Remove()
        end
    end

end 

SCS_FactionSelectMenu()

net.Receive("SWTOR.OpenCharMenu", function()
    SCS_FactionSelectMenu()
end)

concommand.Add("swtor_open_char_menu", function()
    SCS_FactionSelectMenu()
end)