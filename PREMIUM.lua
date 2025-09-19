-- Shine VIP Loader dengan Key System
local ValidKeys = {"PREMIUM"}

local function isKeyValid(k)
    for _, v in ipairs(ValidKeys) do
        if tostring(k) == v then return true end
    end
    return false
end

-- ========== Key UI ==========
local CoreGui = game:GetService("CoreGui")

local KeyGui = Instance.new("ScreenGui", CoreGui)
KeyGui.Name = "ShineKeyGui"

local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0, 360, 0, 180)
Frame.Position = UDim2.new(0.5, -180, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundTransparency = 1
Title.Text = "Shine VIP - Enter Key"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1,0,0,20)
Status.Position = UDim2.new(0,0,0,35)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 230, 120)
Status.Font = Enum.Font.SourceSans
Status.TextSize = 14

local Box = Instance.new("TextBox", Frame)
Box.Size = UDim2.new(1,-20,0,40)
Box.Position = UDim2.new(0,10,0,70)
Box.PlaceholderText = "Masukkan Key..."
Box.Text = ""
Box.ClearTextOnFocus = false
Box.TextColor3 = Color3.fromRGB(240,240,240)
Box.BackgroundColor3 = Color3.fromRGB(40,40,40)
Box.Font = Enum.Font.SourceSans
Box.TextSize = 18
Box.TextXAlignment = Enum.TextXAlignment.Left

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(0,120,0,34)
Button.Position = UDim2.new(0.5,-60,1,-44)
Button.Text = "Submit"
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 18
Button.BackgroundColor3 = Color3.fromRGB(60,60,60)
Button.TextColor3 = Color3.fromRGB(255,255,255)

local function failMsg(msg)
    Status.Text = msg or "Silahkan Membeli Script Premium"
    Status.TextColor3 = Color3.fromRGB(255, 100, 100)
end

local function successMsg(msg)
    Status.Text = msg or "Key Benar. Membuka menu..."
    Status.TextColor3 = Color3.fromRGB(120, 255, 120)
end

-- Submit
Button.MouseButton1Click:Connect(function()
    if isKeyValid(Box.Text) then
        successMsg()
        wait(0.4)
        KeyGui:Destroy()

        -- ========== Lanjutan: load Rayfield UI ==========
        local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
        local function run(url) loadstring(game:HttpGet(url))() end

        local Window = Rayfield:CreateWindow({
            Name = "Shine VIP || Loader",
            LoadingTitle = "Loading...",
            LoadingSubtitle = "Shine VIP Menu",
            Theme = "DarkBlue",
            DisableRayfieldPrompts = true,
        })

        --// Tab Main Scripts
        local Main = Window:CreateTab("Main Scripts")

        Main:CreateButton({
            Name = "Loader",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/Loader.lua")
            end
        })

        Main:CreateButton({
            Name = "Fix Lag", -- Potato
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/Potato.lua")
            end
        })

        Main:CreateButton({
            Name = "RollBack", -- RB
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/RB.lua")
            end
        })

        Main:CreateButton({
            Name = "AFK Gui", -- AFK
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/afk.lua")
            end
        })

        Main:CreateButton({
            Name = "Record Auto Walk", -- Record
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/record.lua")
            end
        })

        Main:CreateButton({
            Name = "Fling All", -- Rusuh2
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/rusuh2.lua")
            end
        })

        --// Tab Movement
        local Movement = Window:CreateTab("Movement")

        Movement:CreateButton({
            Name = "Fly",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/fly.lua")
            end
        })

        Movement:CreateButton({
            Name = "Infinite Jump",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/infjump.lua")
            end
        })

        Movement:CreateButton({
            Name = "Teleport",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/tp.lua")
            end
        })

        --// Tab Auto Walk
        local AutoWalk = Window:CreateTab("🗻 Auto Walk")

        -- Bypass paling atas
        AutoWalk:CreateButton({
            Name = "Bypass",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXMountYahayuk1/main/Loader/WataX.lua")
            end
        })

        -- Section kosong sebagai jarak
        AutoWalk:CreateSection(" ")

        -- Daftar gunung
        AutoWalk:CreateButton({
            Name = "Gunung Atin",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/mainmap792.lua")
            end
        })

        AutoWalk:CreateButton({
            Name = "Gunung Yahayuk",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXMountYahayuk1/main/Loader/mainmap970.lua")
            end
        })

        AutoWalk:CreateButton({
            Name = "Gunung Antartika",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXAntartika157/main/Loader/mainmap273.lua")
            end
        })

        AutoWalk:CreateButton({
            Name = "Gunung Lembayana",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXMountLembayana/main/Loader/mainmap993.lua")
            end
        })

        AutoWalk:CreateButton({
            Name = "Gunung Daun",
            Callback = function()
                run("https://raw.githubusercontent.com/WataXScript/WataXMountDaun/main/Loader/mainmap926.lua")
            end
        })
    else
        failMsg("Silahkan Membeli Script Premium")
    end
end)
