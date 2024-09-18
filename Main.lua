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

local tpsection = tele:AddSection({
	Name = "Teleport"
})

--value
getgenv().mapsSelect = "Windmill"


--function


--call


--"Windmill", "Jungle","ShellsTown","BuggyTown","Boss Island","SnowIsland","DesertIland1","DesertIland2","Hueco Mundo","TojiIsland","PadangPyramid","Mini House Island","Magma Island","Dark Island","Dummy Island","Jungle V2 Island"

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
		local plr = game.PLayers.LocalPlayer.Character.HumanoidRootPart
		for i,place in pairs(game:GetService("Workspace").Map.SpawnLocation:GetChildren()) do
			if place.Name == maps then
				plr.CFrame = place.CFrame
			end
		end

  	end    
})




OrionLib:Init()
