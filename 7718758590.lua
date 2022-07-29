---@diagnostic disable: unused-local, undefined-global, unused-function
-- PRODUCTION BEGIN.

if not rconsolecreate or not rconsoleclear or not rconsoleregisterfont or not rconsolefont or not rconsoleprint then
	return LocalPlayer:Kick("this is script-ware only!!!!");
end

-- open console, and register fonts =D
do rconsolecreate() rconsoleclear(); rconsoleregisterfont("Courier New") rconsolefont("Courier New") end

-- debug print functions :face_with_raised_eyebrow:
local print, warn, error
do local table_pack = table.pack function print(...)local a=""local b=table_pack(...)for c=1,b.n do a=a.."\t"..b[c]end;rconsoleprint("[print] ","bwhite")rconsoleprint(a.."\n","white")end;function warn(...)local a=""local b=table_pack(...)for c=1,b.n do a=a.."\t"..b[c]end;rconsoleprint("[warn] ","bwhite")rconsoleprint(a.."\n","yellow")end;function error(...)local a=""local b=table_pack(...)for c=1,b.n do a=a.."\t"..b[c]end;rconsoleprint("[error] ","bwhite")rconsoleprint(a.."\n","red")end end

local PlaceId = tostring( game.PlaceId )
if not isfolder( PlaceId ) then
	makefolder(PlaceId)
end

local Library = loadfile(string.format("%s/libraries/ui.lua", PlaceId ) )() -- baller code rn;;;
local Window = Library:CreateWindow( 'HeadHook - Transfur Outbreak' );

-- Create tabs.
local _Rage = Window:AddTab( 'Rage' );
local _Misc = Window:AddTab( 'Misc' );

-- Create Tab Boxes.
local lMisc1 = _Misc:AddLeftTabbox();
local lRage1 = _Rage:AddLeftTabbox();

local Rage = lRage1:AddTab('Rage')
local Misc = lMisc1:AddTab('Misc')

Misc:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
	Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);