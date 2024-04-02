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
Section:NewButton("รีเฟชร","รีเฟชร ผู้เล่น", function()
  drop:Refresh(Plr)
end)
local TweenService = game:GetService("TweenService")

Section:NewButton("คลิกเพื่อ Tween ", "", function()
  local Player = game.Players.LocalPlayer
  local Target = game.Players[PlayerTP]
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
  if Player and Target then
    local PlayerCharacter = Player.Character
    local TargetCharacter = Target.Character
    if PlayerCharacter and TargetCharacter then
      local PlayerHumanoidRootPart = PlayerCharacter:FindFirstChild("HumanoidRootPart")
      local TargetHumanoidRootPart = TargetCharacter:FindFirstChild("HumanoidRootPart")
      if PlayerHumanoidRootPart and TargetHumanoidRootPart then
        local TweenInfo = TweenInfo.new((PlayerHumanoidRootPart.Position - TargetHumanoidRootPart.Position).Magnitude / 100, Enum.EasingStyle.Linear)
        local Goals = {CFrame = TargetHumanoidRootPart.CFrame}
        _G.Tween = TweenService:Create(PlayerHumanoidRootPart, TweenInfo, Goals)
        _G.Tween:Play()
      end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
  end
end)
Section:NewToggle("ออโต้ Tween", "", function(t)
  _G.TweenPlayer = t
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
  while _G.TweenPlayer do wait()
    local Player = game.Players.LocalPlayer
    local Target = game.Players[PlayerTP]
    if Player and Target then
      local PlayerCharacter = Player.Character
      local TargetCharacter = Target.Character
      if PlayerCharacter and TargetCharacter then
        local PlayerHumanoidRootPart = PlayerCharacter:FindFirstChild("HumanoidRootPart")
        local TargetHumanoidRootPart = TargetCharacter:FindFirstChild("HumanoidRootPart")
        if PlayerHumanoidRootPart and TargetHumanoidRootPart then
          local TweenInfo = TweenInfo.new((PlayerHumanoidRootPart.Position - TargetHumanoidRootPart.Position).Magnitude / 100, Enum.EasingStyle.Linear)
          local Goals = {CFrame = TargetHumanoidRootPart.CFrame}
          _G.Tween = TweenService:Create(PlayerHumanoidRootPart, TweenInfo, Goals)
          _G.Tween:Play()
          _G.Tween.Completed:Wait() -- Wait for the tween to complete
        end
      end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
  end
end)
Section:NewButton("ยกเลิก Tween ", "", function()
  if _G.Tween then
    _G.Tween:Cancel()
  end
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

