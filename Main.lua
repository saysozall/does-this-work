if game.PlaceId == 18688206652 then

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local uis = game:GetService("UserInputService")
local plr = game:GetService("Players").LocalPlayer
local Cui = game:GetService("CoreGui")
local scrn = Instance.new("ScreenGui",Cui)

local color = Color3.fromRGB(111, 111, 111)
local asset = "rbxasset://fonts/families/TitilliumWeb.json"

local frame = Instance.new("Frame",scrn)
local corner = Instance.new("UICorner",frame)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.111, 0,0.197, 0)
frame.Size = UDim2.new(0, 100,0, 30)
frame.BackgroundColor3 = color
frame.Draggable = true
frame.ZIndex = 4
corner.CornerRadius = UDim.new(0,10)

local button = Instance.new("TextButton",frame)
button.Size = UDim2.new(1,0,1,0)
button.TextSize = 30
button.Text = "toggle"
button.FontFace = Font.new(asset, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
button.BackgroundTransparency = 1
button.ZIndex = 5
button.Draggable = false

local Dragging, DragInput, MousePos , StartPos = false

button.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		Dragging = true
		MousePos = i.Position
		StartPos = frame.Position
		i.Changed:Connect(function()
			if i.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end
		end)
	end
end)

button.InputChanged:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
		DragInput = i
	end
end)

uis.InputChanged:Connect(function(i)
	if i == DragInput and Dragging then
		local delta = i.Position - MousePos
		frame.Position = UDim2.new(StartPos.X.Scale,StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
	end
end)



-- functions




-- variable
getgenv().mapSelect = "N/A"






local Window = Fluent:CreateWindow({
    Title = "Zal Hub|Ijul Piece",
    SubTitle = "by me",
    TabWidth = 160,
    Size = UDim2.fromOffset(475, 300),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

button.MouseButton1Click:Connect(function ()
    Window.Minimized = not Window.Minimized
    Window.Root.Visible = not Window.Minimized
end)

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    tele = Window:AddTab({ Title = "Teleport", Icon = "settings" })
}

local maps = Tabs.tele:AddDropdown("Dropdown", {
    Title = "Select Place",
    Values = {"Windmill", "Jungle","ShellsTown","BuggyTown","Boss Island","SnowIsland","DesertIland1","DesertIland2","Hueco Mundo","TojiIsland","PadangPyramid","Mini House Island","Magma Island","Dark Island","Dummy Island","Jungle V2 Island"},
    Multi = false,
    Default = "N/A",
})

maps:SetValue("N/A")
maps:OnChanged(function(Value)
    getgenv().mapSelect = Value

end)

Tabs.tele:AddButton({
    Title = "Teleport Place",
    Description = "",
    Callback = function(map)
        map = getgenv().mapSelect
        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
		for i,place in pairs(game:GetService("Workspace").Map.SpawnLocation:GetChildren()) do
			if place.Name == map then
				plr.CFrame = place.CFrame
			end
		end
        
    end
})






end
