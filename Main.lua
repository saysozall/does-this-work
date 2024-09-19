if game.PlaceId == 18688206652 then

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Cui = game:GetService("CoreGui")
local scrn = Instance.new("ScreenGui",Cui)

local color = Color3.fromRGB(111, 111, 111)

local frame = Instance.new("Frame",scrn)
local corner = Instance.new("UICorner",frame)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.111, 0,0.197, 0)
frame.Size = UDim2.new(0, 100,0, 30)
frame.BackgroundColor3 = color
frame.Draggable = false
frame.ZIndex = 4
corner.CornerRadius = UDim.new(1,0)

local button = Instance.new("TextButton",frame)
button.Size = UDim2.new(1,0,1,0)
button.TextSize = 16
button.Text = "toggle"
button.BackgroundTransparency = 1
button.ZIndex = 5
button.Draggable = true




-- local 
local uis = game:GetService("UserInputService")


local Window = Fluent:CreateWindow({
    Title = "Zal Hub|Ijul Piece",
    SubTitle = "by me",
    TabWidth = 160,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

button.MouseButton1Click:Connect(function ()
    Window.Minimized = not Window.Minimized
end)





end
