local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "IDK Hub|Ijul Piece", HidePremium = false, SaveConfig = true, ConfigFolder = "IDK",})

local main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local tele = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



--value
getgenv().mapsSelect = "Windmill"
getgenv().npcSelect = "N/A"


--function
function test(ncp)
	for i,mapselect in pairs(game:GetService("Workspace").Map.NPC:GetChildren()) do
		mapselect.Name = ncp
	end
end

--call


--"Windmill", "Jungle","ShellsTown","BuggyTown","Boss Island","SnowIsland","DesertIland1","DesertIland2","Hueco Mundo","TojiIsland","PadangPyramid","Mini House Island","Magma Island","Dark Island","Dummy Island","Jungle V2 Island"

local tpsection = tele:AddSection({
	Name = "Teleport Place"
})

tele:AddDropdown({
	Name = "Select Place",
	Default = "Windmill",
	Options = {"Windmill", "Jungle","ShellsTown","BuggyTown","Boss Island","SnowIsland","DesertIland1","DesertIland2","Hueco Mundo","TojiIsland","PadangPyramid","Mini House Island","Magma Island","Dark Island","Dummy Island","Jungle V2 Island"},
	Callback = function(Value)
		getgenv().mapsSelect = Value
        --print(getgenv().mapsSelect)
	end    
})

tele:AddButton({
	Name = "Teleport",
	Callback = function(maps)
		maps = getgenv().mapsSelect
      	--game:GetService("ReplicatedStorage").Remotes.Requirer:FireServer(maps,"TP")
		local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
		for i,place in pairs(game:GetService("Workspace").Map.SpawnLocation:GetChildren()) do
			if place.Name == maps then
				plr.CFrame = place.CFrame
			end
		end

  	end    
})

local tpsection = tele:AddSection({
	Name = "Teleport NPC"
})

--[[for i,npcs in pairs(game:GetService("Workspace").Map.NPC:GetChildren()) do
	npcs.Name = getgenv().npcSelect
end]]

tele:AddDropdown({
	Name = "Select NPC",
	Default = "N/A",
	Options = {test(ncp)},
	Callback = function(Value)
		getgenv().npcSelect = Value
	end    
})

tele:AddButton({
	Name = "Teleport",
	Callback = function(nps)
		nps = getgenv().npcSelect
		local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
		for i,pc in pairs(game:GetService("Workspace").Map.NPC:GetChildren()) do
			if pc.Name == nps then
				plr.CFrame = pc.CFrame
			end
		end
  	end    
})


OrionLib:Init()
