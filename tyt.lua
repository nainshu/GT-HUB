local correctPassword = "AlexPT"
local whiteList = {"LikeKozekiUi", "ylxdxlh", "zgq374", "ACOOLMAN_RON", "kukuhuitu", "ifjfjrnfj"}

-- 导入音乐相关库
local SoundService = game:GetService("SoundService")

-- 创建一个屏幕GUI用于显示密码输入界面
local passwordGui = Instance.new("ScreenGui")
passwordGui.Name = "PasswordGui"
passwordGui.Parent = game.Players.LocalPlayer.PlayerGui

-- 创建一个框架来容纳其他元素
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.35, 0)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = passwordGui

-- 创建一个文本标签用于显示"Q群: 793336700"文字
local qqGroupLabel = Instance.new("TextLabel")
qqGroupLabel.Size = UDim2.new(1, 0, 0.15, 0)
qqGroupLabel.BackgroundTransparency = 1
qqGroupLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
qqGroupLabel.Font = Enum.Font.SourceSansBold
qqGroupLabel.TextSize = 16
qqGroupLabel.Text = "Q群: 963770308"
qqGroupLabel.Position = UDim2.new(0, 0, 0.05, 0)
qqGroupLabel.Parent = frame

-- 创建一个文本标签用于提示玩家输入密码
local passwordPrompt = Instance.new("TextLabel")
passwordPrompt.Size = UDim2.new(1, 0, 0.3, 0)
passwordPrompt.BackgroundTransparency = 1
passwordPrompt.TextColor3 = Color3.new(1, 1, 1)
passwordPrompt.Font = Enum.Font.SourceSansBold
passwordPrompt.TextSize = 20
passwordPrompt.Text = "GT脚本秘钥系统"
passwordPrompt.Position = UDim2.new(0, 0, 0.2, 0)
passwordPrompt.Parent = frame

-- 创建一个文本框用于玩家输入密码（白名单玩家不使用，仅为非白名单玩家显示）
local passwordTextBox = Instance.new("TextBox")
passwordTextBox.Size = UDim2.new(1, 0, 0.2, 0)
passwordTextBox.Position = UDim2.new(0, 0, 0.5, 0)
passwordTextBox.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
passwordTextBox.TextColor3 = Color3.new(1, 1, 1)
passwordTextBox.Font = Enum.Font.SourceSans
passwordTextBox.TextSize = 18
passwordTextBox.Parent = frame

-- 创建一个提交按钮
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.3, 0, 0.2, 0)
submitButton.Position = UDim2.new(0.35, 0, 0.75, 0)
submitButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 20
submitButton.Text = "提交"
submitButton.Parent = frame

-- 创建一个音乐对象并播放音乐
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://16190782181"
music.Volume = 0.5
music.Parent = SoundService
music:Play()

-- 检查玩家是否在白名单中，如果在则直接通过，否则显示密码输入界面
local player = game.Players.LocalPlayer
if table.find(whiteList, player.Name) then
    passwordGui:Destroy()
    music:Stop()
    -- 加载并执行外部脚本
    loadAndExecuteScript()
else
    passwordTextBox.Visible = true
    submitButton.Visible = true
end

-- 提交按钮的点击事件处理函数（仅非白名单玩家使用）
submitButton.MouseButton1Click:Connect(function()
    local enteredPassword = passwordTextBox.Text
    if enteredPassword == correctPassword then
        passwordGui:Destroy()
        music:Stop()
        -- 加载并执行外部脚本
        loadAndExecuteScript()
    else
        passwordTextBox.Text = ""
        print("密码错误，请重新输入。")
    end
end)

-- 加载并执行外部脚本的函数
local function loadAndExecuteScript()
    local scriptContent = game:HttpGet("https://raw.githubusercontent.com/nainshu/GT-HUB/main/GTjismi.lua")
    local func = loadstring(scriptContent)
    if func then
        func()
    else
        print("加载脚本失败: ", debug.traceback())
    end
end
