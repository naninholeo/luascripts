-- SCRIPT DONE BY NANI, DONT SCAM CREDITS OR REPOST WITHOUT THEM TYSM
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/neonixran/MaterialLua/master/Module.lua"), "Material Lua")()
if getgenv().scriptexecuted == true then game.Players.LocalPlayer:Kick("Do not execute the script two times or more") end
repeat wait() until game:IsLoaded()
local Lib = Library:Load({
    Title = "Something hub",
    Style = 1,
    SizeX = 500,
    SizeY = 430,
    Theme = "Dark",
    Overrides = {
        MainFrame = Color3.fromRGB(10,10,10),
		Minimise = Color3.fromRGB(255,106,0),
		MinimiseAccent = Color3.fromRGB(147,59,0),
		Maximise = Color3.fromRGB(25,255,0),
		MaximiseAccent = Color3.fromRGB(0,255,110),
		NavBar = Color3.fromRGB(30,30,30),
		NavBarAccent = Color3.fromRGB(255,255,255),
		NavBarInvert = Color3.fromRGB(235,235,235),
		TitleBar = Color3.fromRGB(30,30,30),
		TitleBarAccent = Color3.fromRGB(255,255,255),
		Overlay = Color3.fromRGB(175,175,175),
		Banner = Color3.fromRGB(55,55,55),
		BannerAccent = Color3.fromRGB(255,255,255),
		Content = Color3.fromRGB(85,85,85),
		Button = Color3.fromRGB(75,75,75),
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(235,235,235),
		ChipSetAccent = Color3.fromRGB(85,85,85),
		DataTable = Color3.fromRGB(235,235,235),
		DataTableAccent = Color3.fromRGB(85,85,85),
		Slider = Color3.fromRGB(75,75,75),
		SliderAccent = Color3.fromRGB(235,235,235),
        Toggle = Color3.fromRGB(255,255,255),
        ToggleAccent = Color3.fromRGB(255,255,255), 
        Dropdown = Color3.fromRGB(0,0,0),
		DropdownAccent = Color3.fromRGB(235,235,235),
		ColorPicker = Color3.fromRGB(85,85,85),
		ColorPickerAccent = Color3.fromRGB(235,235,235),
		TextField = Color3.fromRGB(175,175,175),
		TextFieldAccent = Color3.fromRGB(255,255,255),
      },
})
--vars
local lp = game.Players.LocalPlayer
local char = lp.Character
getgenv().scriptexecuted = nil
local wsrs;
local startws = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed or game.Players.LocalPlayer.CharacterAdded.Humanoid.WalkSpeed
local startjp = game.Players.LocalPlayer.Character.Humanoid.JumpPower or game.Players.LocalPlayer.CharacterAdded.Humanoid.JumpPower
--functions
local function createhighlight(folder, chp)
    local high = Instance.new("Highlight",folder)
    high.FillTransparency = 0.4
    high.OutlineTransparency = 0
    high.OutlineColor = Color3.fromRGB(0,0,0)
    high.Adornee = chp.Character
end
local function createtext(folder, chp)
    local bgui = Instance.new("BillboardGui", folder)
    bgui.Name = "bgui for esp"
    bgui.Size = UDim2.new(7,0,7,0)
    bgui.AlwaysOnTop = true
    bgui.Active = true
    bgui.Adornee = chp.Character.HumanoidRootPart
    bgui.Enabled = true
    bgui.StudsOffsetWorldSpace = Vector3.new(0,1,0)
    local textlabel = Instance.new("TextLabel", bgui)
    textlabel.Size = UDim2.new(1,0,1,0)
    textlabel.Visible = true
    textlabel.Active = true
    textlabel.BackgroundTransparency = 1
    textlabel.TextSize = 10
    textlabel.TextColor3 = Color3.fromRGB(255,255,255)
    textlabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    textlabel.TextStrokeTransparency = 0
    textlabel.Name = "Espname"
    local rsforlabels = game:GetService("RunService").RenderStepped:Connect(function()
        textlabel.Text = chp.Name .. " | " .. tostring(math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chp.Character.HumanoidRootPart.Position).magnitude))  .. " studs away" .. " | " .. math.floor(chp.Character.Humanoid.Health)
    end)
end
function newesp(player)
    local findesp = game.CoreGui:FindFirstChild("foldesp")
    if not findesp then
        local foldesp = Instance.new("Folder", game.CoreGui)
        foldesp.Name = "foldesp"
        createhighlight(foldesp, player)
        createtext(foldesp,player)
        else createhighlight(findesp, player)
        createtext(findesp,player)
    end
end
--tabs and rest
local page1 = Lib:New({
    Title = "LocalPlayer"
})
local wsslider = page1:Slider({
    Text = "Walkspeed",
    Min = 10,
    Max = 400,
    Default = 16,
    Callback = function(value)
        getgenv().wsvalue = value
    end
})
local wstoggle = page1:Toggle({
    Text = "Toggle Walkspeed",
    Callback = function(on)
        getgenv().sppedon = on
        if getgenv().sppedon == true then
            wsrs = game:GetService("RunService").RenderStepped:Connect(function()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().wsvalue
            end)
        else 
            wsrs:Disconnect()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = startws
        end
    end,
    Enabled = false
})
local jpslider = page1:Slider({
    Text = "Jumpower",
    Min = 10,
    Max = 500,
    Default = 30,
    Callback = function(a)
        getgenv().jpvalue = a
    end
})
local lptoggle = page1:Toggle({
    Text = "Jumpower Toggle",
    Callback = function(on)
        getgenv().jppon = on
        if getgenv().jppon then
            getgenv().rsjp = game:GetService("RunService").RenderStepped:Connect(function()
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = getgenv().jpvalue
            end)
        else getgenv().rsjp:Disconnect() 
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = startjp 
        end
    end,
    Enabled = false
})
--new tab--
local Vis = Lib:New({
    Title = "Visual"
})
local esp = Vis:Toggle({
    Text = "Player esp",
    Callback = function(val)
        if val then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                    newesp(v)
            end
            end
        else game:GetService("CoreGui"):FindFirstChild("foldesp"):Destroy()
        end
    end,
    Enabled = false
})

getgenv().scriptexecuted = true
