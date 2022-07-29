---@diagnostic disable: unused-local, undefined-global, unused-function, empty-block
if syn and syn.run_secure_lua or not (not isexecutorclosure)  then
    return game:GetService("Players").LocalPlayer:Kick("Please use a exploit that supports UNC\nyour exploit is currently not following UNC.");
end
--[[
headhook™ is a registered trademark of Ballin’ Technologies LLC
headhook™ is licensed under a simple "you cant sell, you cant edit, you cannot use this code in any project that is not given explicit permission by Ballin’ Technologies LLC Chief operations officer and or the CEO.
--]]
-- if not rconsolecreate or not rconsoleclear or not rconsoleregisterfont or not rconsolefont or not rconsoleprint then
--     -- lol not anymore!!! xD
--     return game:GetService("Players").LocalPlayer:Kick("this is script-ware only!!!!");

-- end

-- -- open console, and register fonts =D

-- do rconsolecreate() rconsoleclear(); rconsoleregisterfont("Courier New") rconsolefont("Courier New") end


-- debug print functions :face_with_raised_eyebrow:

-- local function print(...) rconsoleprint("[print] ","bwhite") rconsoleprint( tostring( ... ) .. "\n" ,"white") end
-- local function warn(...) rconsoleprint("[warn] ","bwhite") rconsoleprint(tostring( ... ) .. "\n" ,"yellow") end
-- local function error(...) rconsoleprint("[error] ","bwhite") rconsoleprint( tostring( ... ) .. "\n" ,"red") end

local PlaceId = tostring( game.PlaceId )
if not isfolder( PlaceId ) then
	makefolder(PlaceId)
end

local shared = getrenv( ).shared 


local ui_src = game:HttpGet("https://raw.githubusercontent.com/froggisfriend/LinoriaLib/main/UI%20Library%202.0.lua");
local Library = loadstring( ui_src )( );
local Window = Library:CreateWindow( 'HeadHook - RIOT' );

-- Create tabs.
local _Rage = Window:AddTab( 'Rage' );
local _Misc = Window:AddTab( 'Misc' );
local _Character = Window:AddTab( 'Character' );

-- Create Tab Boxes.
local lMisc1 = _Misc:AddLeftTabbox();
local lCharacter1 = _Character:AddLeftTabbox();
local lRage1 = _Rage:AddLeftTabbox();

local Combat = lRage1:AddTab('Combat')
local Misc = lMisc1:AddTab('Misc')
local Character = lCharacter1:AddTab('Character')

local local_player = game:GetService("Players").LocalPlayer
local char = local_player.Character or local_player.CharacterAdded:Wait();


local Dash_Toggle = Character:AddToggle("Dash",{Text = 'Infinite Dash',Default = false})
local Rage_Toggle = Combat:AddToggle("Rage",{Text = 'Infinite Rage',Default = false})
local Stomp_Toggle = Combat:AddToggle("Stomp",{Text = 'Auto Stomp',Default = false})

local NoDelay_Toggle = Combat:AddToggle("Delay",{Text = 'No Attack Delay',Default = false})

local KillAura = Combat:AddToggle("KillAura",{Text = 'KillAura',Default = false}):AddKeyPicker('KillAura', { Text = 'KillAura', Default = 'R' });
local Distance_slider = Combat:AddSlider("Distance",{Text = 'Distance',Default = 8,Min = 0,Max = 25, Suffix = 'm', Rounding = 0})
local Stamina_Toggle = Character:AddToggle("Stamina",{Text = 'Infinite Stamina',Default = false})


local function dash( )
    game:GetService("Players").LocalPlayer:SetAttribute("InfiniteDash",Toggles.Dash.Value)
end
local function stamina( )
    game:GetService("Players").LocalPlayer:SetAttribute("InfStamina",Toggles.Stamina.Value)

end
local function auto_stomp( )
    local args = {
        [1] = {
            ["KeyCode"] = Enum.KeyCode.X
        }
    }
    
    game:GetService("ReplicatedStorage").Remotes.MainRemote:FireServer({unpack(args)})
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 16

end

local function rage( )
    game:GetService("Players").LocalPlayer:SetAttribute("RageMode",Toggles.Rage.Value)
    game:GetService("Players").LocalPlayer:SetAttribute("WeaponSpam",Toggles.Rage.Value)
end
local function killaura( )

for _,player in next, game:GetService("Players"):GetPlayers( ) do 
    if not local_player.Character then continue end 
    if not player.Character then continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool") then continue end 
    if not local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("WeaponRemote") then continue end 
    if player == local_player then continue end 

    local distance_between = (local_player.Character:FindFirstChild("Torso").Position - player.Character:FindFirstChild("Torso").Position).Magnitude
    if distance_between <= Options.Distance.Value  --[[should be it]] and not player.Character:GetAttribute("Downed") then
    local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("WeaponRemote"):FireServer("Z", 1 or 2, "the/???")
    local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("WeaponRemote"):FireServer("T", player.Character.Torso, "lol  ")
    end

end

end
local function no_delay()
    if not Toggles.Delay.Value then return end 
    if not local_player.Character:FindFirstChildOfClass("Tool") then
        return 
    end
    if not local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("WeaponClient") then
        return
    end
    if local_player.Character:FindFirstChildOfClass("Tool"):GetAttribute("gaming") then 
    return
    end
    if not local_player.Character:FindFirstChildOfClass("Tool"):GetAttribute("gaming")  then 
    local_player.Character:FindFirstChildOfClass("Tool"):SetAttribute("gaming",true);
    for i,v in next, getgc(true) do
        if type(v) == 'function' and islclosure(v) and not isourclosure(v) then
            if getfenv(v).script == local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("WeaponClient") and debug.info(v,'n') == 'Activated' then
                rawset(getupvalues(v)[6],'AttackDebounce',0);
                rawset(getupvalues(v)[6],'EquipAttackDelay',0);
                rawset(getupvalues(v)[6],'AttackWindow',0);
                rawset(getupvalues(v)[6],'AttackWindowDelay',0);
                
            end
        end
    end

    end

end
-- generates a random string
function randomString()
    return game:GetService("HttpService"):GenerateGUID(false)
end

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("dashhax") end)
game:GetService("RunService"):BindToRenderStep( "dashhax" , 200 , dash ); -- Camera Controls: 200

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("ragehax") end)
game:GetService("RunService"):BindToRenderStep( "ragehax" , 200 , rage ); -- Camera Controls: 200

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("staminahax") end)
game:GetService("RunService"):BindToRenderStep( "staminahax" , 200 , stamina ); -- Camera Controls: 200

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("killaurahax") end)
game:GetService("RunService"):BindToRenderStep( "killaurahax" , 200 , killaura ); -- Camera Controls: 200


pcall(function() game:GetService("RunService"):UnbindFromRenderStep("nodelayhax") end)
game:GetService("RunService"):BindToRenderStep( "nodelayhax" , 200 , no_delay ); -- Camera Controls: 200

pcall(function() game:GetService("RunService"):UnbindFromRenderStep("stomphax") end)
game:GetService("RunService"):BindToRenderStep( "stomphax" , 200 , auto_stomp ); -- Camera Controls: 200

Misc:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);


-- print("Headhook - For RIOT has loaded without errors.");
-- print([[
-- Credits:
-- froggysfriend - making like the entire fucking script    
-- Script-Ware - being the only executor that will take me in a refugee, and the amazing staff and development team. aswell as the amazing extensive script execution engine.
-- ]])
Library:Notify('Loaded - Press right shift to open UI.');

Library:Notify('Thanks for having patience, and waiting for me to stop being lazy.');

-- table.foreach(Options, function(k, v)
--     print(k, v)
-- end)
local function is_baller( )
return true
end

--if is_baller( ) then
    Library:Notify([=[ “‘Cursed be anyone who lies with any kind of animal.’ And all the people shall say, ‘Amen.’ -Deuteronomy 27:21 ]=]);
--end
