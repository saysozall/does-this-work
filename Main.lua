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

local misc = Window:MakeTab({
	Name = "Mics",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


--value
getgenv().mapsSelect = "Windmill"
getgenv().npcSelect = "N/A"
getgenv().Rtraits = true
getgenv().Rfamily = true


--function

function traits()
	game:GetService("ReplicatedStorage").Events.SpinTrait:FireServer("Normal")
	wait(0.1)
end

function family()
	game:GetService("ReplicatedStorage").Events.SpinFamily:FireServer("Normal")
	wait(0.1)
end

function traitsMenu()
	local plr = game.Players.LocalPlayer
	local gui = plr.PlayerGui
	local store = gui:FindFirstChild("TraitsStorage")
	store.Frame.Visible = true
end

--call


--"Windmill", "Jungle","ShellsTown","BuggyTown","Boss Island","SnowIsland","DesertIland1","DesertIland2","Hueco Mundo","TojiIsland","PadangPyramid","Mini House Island","Magma Island","Dark Island","Dummy Island","Jungle V2 Island"


local Item = tele:AddSection({
	Name = "Item"
})

main:AddToggle({
	Name = "Auto Traits",
	Default = false,
	Callback = function(Value)
		while getgenv().Rtraits == Value do
			traits()
		end
	end    
})

main:AddToggle({
	Name = "Auto Family",
	Default = false,
	Callback = function(Value)
		while getgenv().Rfamily == Value do
			family()
		end
	end    
})





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



misc:AddButton({
	Name = "Open Traits Menu",
	Callback = function()
		traitsMenu()
  	end    
})




OrionLib:Init()
