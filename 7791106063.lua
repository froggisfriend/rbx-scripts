---@diagnostic disable: unused-local, undefined-global, unused-function, empty-block

--[[
headhook™ is a registered trademark of Ballin’ Technologies LLC
headhook™ is licensed under a simple "you cant sell, you cant edit, you cannot use this code in any project that is not given explicit permission by Ballin’ Technologies LLC Chief operations officer and or the CEO.
--]]
if not rconsolecreate or not rconsoleclear or not rconsoleregisterfont or not rconsolefont or not rconsoleprint then
    return game:GetService("Players").LocalPlayer:Kick("this is script-ware only!!!!");
end

-- open console, and register fonts =D

do rconsolecreate() rconsoleclear(); rconsoleregisterfont("Courier New") rconsolefont("Courier New") end


-- debug print functions :face_with_raised_eyebrow:

local function print(...) rconsoleprint("[print] ","bwhite") rconsoleprint( tostring( ... ) .. "\n" ,"white") end
local function warn(...) rconsoleprint("[warn] ","bwhite") rconsoleprint(tostring( ... ) .. "\n" ,"yellow") end
local function error(...) rconsoleprint("[error] ","bwhite") rconsoleprint( tostring( ... ) .. "\n" ,"red") end

local PlaceId = tostring( game.PlaceId )
if not isfolder( PlaceId ) then
	makefolder(PlaceId)
end

local shared = getrenv( ).shared 


local ui_src = readfile(string.format("%s/libraries/ui.lua", PlaceId ) )
local Library = loadstring( ui_src )( );
local Window = Library:CreateWindow( 'HeadHook - Furry the infection' );

-- Create tabs.
local _Rage = Window:AddTab( 'Game' );
local _Misc = Window:AddTab( 'Misc' );

-- Create Tab Boxes.
local lMisc1 = _Misc:AddLeftTabbox();
local lRage1 = _Rage:AddLeftTabbox();


local Puddle_Backup = Instance.new('Folder',game:GetService("Lighting"))
local Laser_BackUp = Instance.new('Folder',game:GetService("Lighting"))

local Combat = lRage1:AddTab('Combat')
local Misc = lMisc1:AddTab('Misc')
local Map = lRage1:AddTab('Map')

local local_player = game:GetService("Players").LocalPlayer

local function is_baller( )
	return true
end

local char = local_player.Character or local_player.CharacterAdded:Wait();

local KillAura = Combat:AddToggle("KillAura",{Text = 'KillAura',Default = false}):AddKeyPicker('KillAura', { Text = 'KillAura', Default = 'R' });

local AutoEscape = Combat:AddToggle("AutoEscape",{Text = 'Auto Escape',Default = false})


local NoLasers = Map:AddToggle("NoLasers",{Text = 'Remove Lasers',Default = false}):OnChanged(function()
state = Toggles.NoLasers.Value
if state then 
for _,Part in next, workspace:GetDescendants() do 
if Part:IsA("BasePart") or Part:IsA("UnionOperation") then
if Part.BrickColor == BrickColor.new("Really red") and Part.Material == Enum.Material.Neon then
        Part.Parent = Laser_BackUp
end

end

end

else

for _,_Part in next, Laser_BackUp:GetChildren() do 
    _Part.Parent = workspace
end

        
end


end)


local NoFaggots = Map:AddToggle("NoFaggots",{Text = 'Remove puddles',Default = false}):OnChanged(function()
    state = Toggles.NoFaggots.Value
if state then 
for i,v in next, game:GetService("Workspace").TransfurPart:GetChildren() do 
    v.Parent = Puddle_Backup
end
else
for i,v in next, Puddle_Backup:GetChildren() do 
            v.Parent = game:GetService("Workspace").TransfurPart
end
        
end

end)

local function auto_escape( )
if not Toggles.AutoEscape.Value then return end
if local_player:FindFirstChild( "PlayerGui" ):FindFirstChild( "EscapeGui" ) then
task.defer( keypress , 0x20 )
wait( )
task.defer( keyrelease , 0x20 )
end
end

local function killaura( )

for _,player in next, game:GetService("Players"):GetPlayers( ) do 
    if not Options.KillAura.Toggled then  continue end
    if not local_player.Character then continue end 
    if not player.Character then continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool") then continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Remote") then  continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Remote"):FindFirstChild("Hit") then continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handler") then continue end 
    if player.Team == local_player.Team then continue end 
    if player == local_player then continue end 

    local distance_between = (local_player.Character:FindFirstChild("Torso").Position - player.Character:FindFirstChild("Torso").Position).Magnitude
    if distance_between <= 20 then
    local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Remote"):FindFirstChild("Hit"):FireServer(player.Character:FindFirstChild("Torso"),player.Character:FindFirstChild("Humanoid"),player.Character:FindFirstChild("Torso").Position or Vector3.new())
    end

end

end

-- generates a random stringok
function randomString()
    return game:GetService("HttpService"):GenerateGUID(false)
end

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("killaurahax") end)
game:GetService("RunService"):BindToRenderStep( "killaurahax" , 200 , killaura ); -- Camera Controls: 200

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("escapehax") end)
game:GetService("RunService"):BindToRenderStep( "escapehax" , 200 , auto_escape ); -- Camera Controls: 200


Misc:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);


print("Headhook - For Furry the infection has loaded without errors.");
print([[
Credits:
froggysfriend - making like the entire fucking script    
Script-Ware - being the only executor that will take me in a refugee, and the amazing staff and development team. aswell as the amazing extensive script execution engine.
]])

Library:Notify('Loaded - Press right shift to open UI.');

if is_baller( ) then
Library:Notify([=[ “‘Cursed be anyone who lies with any kind of animal.’ And all the people shall say, ‘Amen.’ -Deuteronomy 27:21 ]=]);
end 
