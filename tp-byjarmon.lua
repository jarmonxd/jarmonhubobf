local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Jarmon Hub by jarmon", "DarkTheme")
local Tab = Window:NewTab("หน้าแรก")
local Section = Tab:NewSection("ขอให้สนุกกับการtpครับ")
Plr = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Plr,v.Name) 
end
local drop = Section:NewDropdown("เลือกผู้เล่น", "คลิกเพื่อเลือกผู้เล่น", Plr, function(t)
   PlayerTP = t
end)
Section:NewButton("คลิกเพื่อ tp ", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end)
Section:NewToggle("ออโต้ Tp", "", function(t)
_G.TPPlayer = t
while _G.TPPlayer do wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end
end)

Section:NewButton("รีเฟชร","รีเฟชร ผู้เล่น", function()
  drop:Refresh(Plr)
end)
