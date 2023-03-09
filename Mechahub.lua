getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Mobs = game:GetService("Workspace").Mobs:GetChildren()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function getAllTPs()
local a = {}
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Portal") then
        table.insert(a,v)
        end
    end
    return a
end

function getAllTPsName()
local a = {}
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Portal") then
        table.insert(a,v.Name)
        end
    end
    return a
end

local Window = Rayfield:CreateWindow({
   Name = "Mechamato Farm Script",
   LoadingTitle = "Kambing Corp.",
   LoadingSubtitle = "by Fawwaz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Mecha Hub", -- Create a custom folder for your hub/game
      FileName = "Mecha Hub"
   },
   KeySystem = false, -- Set this to true to use our key system
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

local Slider = Tab:CreateSlider({Name = "Y Offset",Range = {0, 50},Increment = 1,CurrentValue = 10,Flag = "Slider1",Callback = function(Option)end,})

local Toggle = Tab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value == true then
        for index, mob in pairs(Mobs) do
        if Value == false then
    do continue end
end
while task.wait() do

if string.find(mob.Name, "Koncho") or string.find(mob.Name, "Bitbobeep") or string.find(mob.Name, "Armbot") then break end


if mob:FindFirstChild("CollisionBox") == nil then break end

if mob.CollisionBox.CFrame.Position == nil then break end


    LocalPlayer.Character.HumanoidRootPart.CFrame 
    = CFrame.new(mob.CollisionBox.CFrame.Position.X, mob.CollisionBox.CFrame.Position.Y + Slider.CurrentValue, mob.CollisionBox.CFrame.Position.Z)
    sendAttack(mob.CollisionBox.CFrame.Position)
    --mouse1click()
    task.wait()
end
end
   end
   end,
})

local Button = Tab:CreateButton({
   Name = "Get All Coins",
   Callback = function()
   for i, v in pairs(Mobs) do
   while task.wait() do
    for num, part in pairs(game:GetService("Workspace").CurrencyDrops:GetChildren()) do
    part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame 
    task.wait()
end
end
   end
   end,
})

local Dropdown = Tab:CreateDropdown({Name = "Weapon",Options = {"Mecha Blaster","Mecha Hammer","Mecha Zooka", "Mecha Rapid Blaster"},CurrentOption = "MechaBlaster",Flag = "Dropdown1",Callback = function(Option)end,})

local Input = Tab:CreateInput({
   Name = "Fight Boss",
   PlaceholderText = "Mega Paintaso, Grakakus, Mega Sumorai, Trocket",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
   game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TeleportService"):WaitForChild("RF"):WaitForChild("TeleportToPlace"):InvokeServer(Text)
   end,
})

-- FAST ATTACK --
local Section = Tab:CreateSection("Fast Attack")

local Toggle9 = Tab:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "Toggle9",
   Callback = function(Value)
   end,
})
local Keybind = Tab:CreateKeybind({
   Name = "Bind",
   CurrentKeybind = "Q",
   HoldToInteract = true,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
   if Toggle9.CurrentValue then
    sendAttack(LocalPlayer:GetMouse().Hit.Position)
   end
   end,
})

local Toggle2 = Tab:CreateToggle({
   Name = "Hold",
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(Value)
   Keybind.HoldToInteract = Value
   end,
})

function sendAttack(pos)
if Dropdown.CurrentOption == "Mecha Zooka" then
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mecha Zooka").FireWeapon:FireServer("MechaZooka_Normal", pos)
elseif Dropdown.CurrentOption == "Mecha Blaster" then
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mecha Blaster").FireWeapon:FireServer("MechaBlaster_Normal", pos)
elseif Dropdown.CurrentOption == "Mecha Hammer" then
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mecha Hammer").AttackWeapon:FireServer("MechaHammer_Normal", pos)
elseif Dropdown.CurrentOption == "Mecha Rapid Blaster" then
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mecha Rapid Blaster").FireWeapon:FireServer("MechaRapidBlaster_Normal", pos)
end
end

-- PLAYER TAB--

local Button6 = PlayerTab:CreateButton({
   Name = "Equip Weapon",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RF"):WaitForChild("EquipTool"):InvokeServer(Dropdown.CurrentOption)
   end,
})

local Slider6 = PlayerTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 500},
   Increment = 10,
   CurrentValue = 16,
   Flag = "Slider2",
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSection("Teleportation")

local Dropdown1 = PlayerTab:CreateDropdown(
    {Name = "Portal",
    Options = getAllTPsName()
     ,CurrentOption = "Null",
     Flag = "Dropdown2",
     Callback = function(Option)end,})

     local Button10 = PlayerTab:CreateButton({
   Name = "TP Portal",
   Callback = function()
       for i, v in pairs(getAllTPs()) do
       if Dropdown1.CurrentOption == v.Name then
        if string.find(v.Name, "Portal") then
        print(v.Name)
        local c
           for index, value in v:GetChildren() do
            if string.find(value.Name, "Portal")  then
                c = value.CFrame.Position
            end
        end
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(c.X, c.Y + 20, c.Z)
        end
     end
     end
   end,
})

Rayfield:LoadConfiguration()

