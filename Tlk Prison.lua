-- Values

plr = game.Players.LocalPlayer
local g = game
local Players = g:FindFirstChildOfClass("Players")
local ReplicatedStorage = g:FindFirstChildOfClass("ReplicatedStorage")
local LocalPlayer = plr
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local RootPart = Character:FindFirstChild("HumanoidRootPart")
local oldPos

local config = {
   ["HeaderWidth"] = 250,
   ["AccentColor"] = Color3.new(0.75,0,0)
}
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)

local PVP = gui:CreateCategory("PVP")
local Defensive = PVP:CreateSection("Defensive")
local Offensive = PVP:CreateSection("Offense")

local Tools = gui:CreateCategory("Tools")
local Get = Tools:CreateSection("Get Tool")

local Map = gui:CreateCategory("Map")
local Remove = Map:CreateSection("Remove")
local Teleportation = Map:CreateSection("Teleportation")

local Misc = gui:CreateCategory("Misc")
local Teams = Misc:CreateSection("Teams")
local Ps = Misc:CreateSection("Player Stuff")
local Avatar = Misc:CreateSection("Avatar")

Avatar:CreateButton("Become Dominous Dude",function() 
    local args = {
        [1] = 46,
        [2] = 21070012,
        [3] = "Dominus Empyreus",
        [4] = "21070012"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    
        local args = {
        [1] = 46,
        [2] = 192557913,
        [3] = "Sparkling Angel Wings",
        [4] = "192557913"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    
    local args = {
        [1] = 46,
        [2] = 5648736852,
        [3] = "white suit",
        [4] = "5648736852"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    
    local args = {
        [1] = 46,
        [2] = 5648737442,
        [3] = "white suit",
        [4] = "5648737442"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
end)

Avatar:CreateButton("Become Astronaut",function() 
    local args = {
        [1] = 46,
        [2] = 1081366,
        [3] = "Astronaut Helmet",
        [4] = "1081366"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    
    local args = {
        [1] = 46,
        [2] = 6438129622,
        [3] = "Astronaut-",
        [4] = "6438129622"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    
    local args = {
        [1] = 46,
        [2] = 344831018,
        [3] = "Astronaut",
        [4] = "344831018"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
end)

Avatar:CreateButton("Wings",function() 
    local args = {
        [1] = 46,
        [2] = 192557913,
        [3] = "Sparkling Angel Wings",
        [4] = "192557913"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
end)

Avatar:CreateSwitch("Loop Wings", function(bool) 
    LoopWings = bool
     if bool then
     while LoopWings and wait(0.02) do
        for i=1,5 do
        local args = {
        [1] = 46,
        [2] = 192557913,
        [3] = "Sparkling Angel Wings",
        [4] = "192557913"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Import"):FireServer(unpack(args))
    end
     end
end
end,false)

Ps:CreateSelector("Kill Player",function(selected)
    local player = selected
    oldPos = RootPart.CFrame
    for i=1,10 do
        RootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,3,0)
        local args = {
            [1] = LocalPlayer,
            [2] = player.Character.HumanoidRootPart,
            [3] = Character:FindFirstChildOfClass("Tool")
        }
        ReplicatedStorage.Combat:FireServer(unpack(args))
        wait(0.25)
    end
    RootPart.CFrame = oldPos
end,function() return game.Players:GetPlayers() end,nil)

Ps:CreateSelector("Kick Player",function(selected)
    local args = {
        [1] = selected.Name
    }

    game:GetService("ReplicatedStorage").VoteKickEvents.startKick:FireServer(unpack(args))
    
    for i=1,50 do 
    local args = {
        [1] = selected
    }

    game:GetService("ReplicatedStorage").VoteKickEvents.addToAmount:FireServer(unpack(args))
    end
    
end,function() return game.Players:GetPlayers() end,nil)

Ps:CreateSelector("Goto Player",function(selected)
    plr.character.HumanoidRootPart.CFrame = selected.character.HumanoidRootPart.CFrame
end,function() return game.Players:GetPlayers() end,nil)

Teams:CreateButton("Change To Prisoner",function() 
    plr.PlayerGui.TeamChangePrisoner.Frame.Visible = true
end)

Teams:CreateButton("Change To Police",function() 
    plr.PlayerGui.TeamChangePolice.Frame.Visible = true
end)

Teams:CreateButton("Change To Fugitive",function() 
    plr.PlayerGui.TeamChangeFugitive.Frame.Visible = true
end)

Teams:CreateButton("Choosing Magic",function() 
    plr.PlayerGui.Menu.OpenAndClose.Visible = true
    plr.PlayerGui.Menu.GUI.Visible = true
    plr.PlayerGui.Menu.TeamMenu.Visible = false
    plr.PlayerGui.Stamina.StaminaBarFrame.Visible = true
    plr.character.HumanoidRootPart.CFrame = CFrame.new(320.243, 3.08828, -96.6848)
end)

Teleportation:CreateButton("Prison",function() 
    plr.character.HumanoidRootPart.CFrame = CFrame.new(50.227, 14.2692, -21.9349)
end)

Teleportation:CreateButton("Outside",function() 
    plr.character.HumanoidRootPart.CFrame = CFrame.new(289.506, 3.05052, -295.087)
end)

Teleportation:CreateButton("Fugitive Base",function() 
    plr.character.HumanoidRootPart.CFrame = CFrame.new(388.731, 3.10556, -81.3732)
end)

Remove:CreateButton("Remove Doors",function() 
    for i,v in pairs(game.Workspace:GetDescendants()) do 	
       if v.Name == "Door" then
           v:Destroy()
           end
       end
end)

Remove:CreateButton("Remove JailBars",function() 
    for i,v in pairs(game.Workspace:GetDescendants()) do 	
       if v.Name == "JailBars" then
           v:Destroy()
           end
       end
end)

Remove:CreateButton("Remove Misc",function() 
    game.Workspace["Chain Link Fence Metal Gate Double Door"]:Destroy()
end)

Remove:CreateTextLabel("---")

Remove:CreateButton("Remove Every Tool",function() 
    for i,v in game.Workspace:GetChildren() do if v:IsA("Tool") then plr.character.Humanoid:EquipTool(v) end end
end)

Remove:CreateButton("Remove Taser",function() 
    plr.character.Humanoid:EquipTool(game.Workspace.Taser)
end)

Remove:CreateButton("Remove fug Handcuffs",function() 
    plr.character.Humanoid:EquipTool(game.Workspace["Handcuffs (fugitive)"])
end)

Remove:CreateButton("Remove Rope",function() 
    for i,v in game.Workspace:GetChildren() do if v.Name == "Rope" then plr.character.Humanoid:EquipTool(v) end end
end)

Get:CreateButton("Axe",function() 
    fireclickdetector(game.Workspace.Axe.ClickDetector)
end)

Get:CreateButton("Pickaxe",function() 
    fireclickdetector(game.Workspace.Pickaxe.ClickDetector)
end)

Get:CreateButton("Knife",function() 
    fireclickdetector(game.Workspace.Knife.ClickDetector)
end)

Get:CreateButton("Crowbar",function() 
    fireclickdetector(game.Workspace.Crowbar.ClickDetector)
end)

Get:CreateButton("Bat",function() 
    fireclickdetector(game.Workspace.table.Bat.ClickDetector)
end)

Get:CreateButton("Handcuffs and rope",function() 
    fireclickdetector(game.Workspace["Handcuffs (fugitive)"].ClickDetector)
    fireclickdetector(game.Workspace.Rope.ClickDetector)
end)

Get:CreateButton("Keycard",function() 
    fireclickdetector(game.Workspace.KeyCard.ClickDetector)
end)

Get:CreateButton("Taser",function() 
    fireclickdetector(game.Workspace:FindFirstChild("Taser").ClickDetector)
end)

Tools:CreateSwitch("Loop Get Fight Pack", function(bool) 
    GetFight = bool
     if bool then
     while GetFight do
        fireclickdetector(game.Workspace.Axe.ClickDetector)
        fireclickdetector(game.Workspace.Food.Main.ClickDetector)
        wait(0.05)
     end
end
end,false)

Tools:CreateSwitch("Loop Get Food", function(bool) 
    GetFood = bool
     if bool then
     while GetFood do
        fireclickdetector(game.Workspace.Food.Main.ClickDetector)
        wait(0.05)
     end
end
end,false)

Tools:CreateSwitch("Loop Get Hamburger", function(bool) 
    GetHam = bool
     if bool then
     while GetHam do
        fireclickdetector(game.Workspace.Hamburger.ClickDetector)
        wait(0.05)
     end
end
end,false)

Defensive:CreateSwitch("WalkSpeed Bypass", function(bool) 
    TPWalk = bool
end,false)

Defensive:CreateSlider("WalkSpeed Bypass Speed", function(value) 
    Speed = value /100
end,50,300,nil,true,50)

Defensive:CreateSwitch("Infinite Sprint", function(bool) 
    InfiniteSprint = bool
    if bool then
    while InfiniteSprint do
        if FasterSprint then
            plr.character:FindFirstChild("Humanoid").WalkSpeed = 30
        else
            plr.character:FindFirstChild("Humanoid").WalkSpeed = 25
        end
        wait(0.03)
    end
end
end,false)

Defensive:CreateTextLabel("---")

Defensive:CreateSwitch("AutoHeal", function(bool) 
    Autoheal = bool
    if bool then
    while Autoheal and wait(0.5) do
        local hp = plr.character:FindFirstChild("Humanoid").Health
        if hp ~= 100 then
            local food = plr.Backpack:FindFirstChild("Food") or plr.Backpack:FindFirstChild("Hamburger")
            local old = plr.character:FindFirstChildOfClass("Tool")
            
            plr.character:FindFirstChild("Humanoid"):EquipTool(food)
            plr.character:FindFirstChild("Food"):Activate()
            
            wait()
            
            if old ~= nil then
                plr.character:FindFirstChild("Humanoid"):EquipTool(old)
                end
            end
        end
    end
end,false)

Defensive:CreateTextLabel("---")

Defensive:CreateSwitch("Anti Disable Inventory", function(bool) 
    AntiDisable = bool
    if bool then
    while AntiDisable do
        game.StarterGui:SetCoreGuiEnabled("Backpack", true)
        wait(0.05)
    end
end
end,false)

Defensive:CreateSwitch("Anti Disable Jump", function(bool) 
    AntiJump = bool
    if bool then
        while AntiJump do
            plr.character.JumpLimit.Disabled = true
            wait(5)
            end
        end
end,false)

Offensive:CreateSwitch("Killaura", function(bool) 
    killaura = bool
    if bool == true then
    local lp = game:FindFirstChildOfClass("Players").LocalPlayer
local chr = lp.Character
while wait(0.25) and killaura do
local lowest = math.huge
local NearestPlayer = nil
for _,plr in pairs(game:FindFirstChildOfClass("Players"):GetPlayers()) do
    if plr ~= lp and plr.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 and plr.Team ~= lp.Team then
        local distance = plr:DistanceFromCharacter(chr.HumanoidRootPart.Position)
        if distance < lowest then
            lowest = distance
            NearestPlayer = {plr}
        end
    end
end
for i,v in pairs(NearestPlayer) do
local args = {
    [1] = chr,
    [2] = v.Character.HumanoidRootPart,
    [3] = chr:FindFirstChildOfClass("Tool")
}
wait()
game:GetService("ReplicatedStorage"):WaitForChild("Combat"):FireServer(unpack(args))
end
end
end
end,false)

Offensive:CreateSwitch("Friend Killaura", function(bool) 
    fkillaura = bool
    if bool == true then
    local lp = game:FindFirstChildOfClass("Players").LocalPlayer
local chr = lp.Character
while wait(0.25) and fkillaura do
local lowest = math.huge
local NearestPlayer = nil
for _,plr in pairs(game:FindFirstChildOfClass("Players"):GetPlayers()) do
    if plr ~= lp and plr.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 and plr.Team ~= lp.Team and not lp:IsFriendsWith(plr.UserId) then
        local distance = plr:DistanceFromCharacter(chr.HumanoidRootPart.Position)
        if distance < lowest then
            lowest = distance
            NearestPlayer = {plr}
        end
    end
end
for i,v in pairs(NearestPlayer) do
local args = {
    [1] = chr,
    [2] = v.Character.HumanoidRootPart,
    [3] = chr:FindFirstChildOfClass("Tool")
}
wait()
game:GetService("ReplicatedStorage"):WaitForChild("Combat"):FireServer(unpack(args))
end
end
end
end,false)

     TPWalking = game:GetService("RunService").Heartbeat:Wait()
	 game:GetService("RunService").Stepped:Connect(function()
		if TPWalk == true then
		 if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection.Magnitude > 0 then
			 if Speed then
				  game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * Speed * TPWalking * 10)
			 else
				  game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * TPWalking * 10)
			 end
			end
		end
	end)