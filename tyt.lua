local correctPassword = "AlexPT"
local whiteList = {"zgq374", "Player2"} -- 在此处添加白名单中的玩家名称或标识符

-- 导入音乐相关库
local SoundService = game:GetService("SoundService")

-- 创建一个屏幕GUI用于显示密码输入界面
local passwordGui = Instance.new("ScreenGui")
passwordGui.Name = "PasswordGui"
passwordGui.Parent = game.Players.LocalPlayer.PlayerGui

-- 创建一个框架来容纳其他元素
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.35, 0)  -- 适当增加框架高度，为元素留出更多空间
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = passwordGui

-- 创建一个文本标签用于显示"Q群: 793336700"文字
local qqGroupLabel = Instance.new("TextLabel")
qqGroupLabel.Size = UDim2.new(1, 0, 0.15, 0)  -- 调整Q群标签大小
qqGroupLabel.BackgroundTransparency = 1
qqGroupLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)  -- 设置Q群标签颜色为灰色，与其他文字区分开
qqGroupLabel.Font = Enum.Font.SourceSansBold
qqGroupLabel.TextSize = 16
qqGroupLabel.Text = "Q群: 963770308"
qqGroupLabel.Position = UDim2.new(0, 0, 0.05, 0)  -- 调整Q群标签位置在上方
qqGroupLabel.Parent = frame

-- 创建一个文本标签用于提示玩家输入密码
local passwordPrompt = Instance.new("TextLabel")
passwordPrompt.Size = UDim2.new(1, 0, 0.3, 0)
passwordPrompt.BackgroundTransparency = 1
passwordPrompt.TextColor3 = Color3.new(1, 1, 1)  -- 设置GT脚本秘钥系统文字颜色为白色
passwordPrompt.Font = Enum.Font.SourceSansBold
passwordPrompt.TextSize = 20
passwordPrompt.Text = "GT脚本秘钥系统"
passwordPrompt.Position = UDim2.new(0, 0, 0.2, 0)  -- 调整GT脚本秘钥系统位置在下方
passwordPrompt.Parent = frame

-- 创建一个文本框用于玩家输入密码（白名单玩家不使用，仅为非白名单玩家显示）
local passwordTextBox = Instance.new("TextBox")
passwordTextBox.Size = UDim2.new(1, 0, 0.2, 0)
passwordTextBox.Position = UDim2.new(0, 0, 0.5, 0)  -- 适当调整文本框位置
passwordTextBox.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
passwordTextBox.TextColor3 = Color3.new(1, 1, 1)
passwordTextBox.Font = Enum.Font.SourceSans
passwordTextBox.TextSize = 18
passwordTextBox.Parent = frame

-- 创建一个提交按钮
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.3, 0, 0.2, 0)
submitButton.Position = UDim2.new(0.35, 0, 0.75, 0)  -- 适当调整提交按钮位置
submitButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 20
submitButton.Text = "提交"
submitButton.Parent = frame

-- 创建一个音乐对象并播放音乐
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://16190782181" -- 将<音乐ID>替换为你实际的音乐ID
music.Volume = 0.5 -- 设置音量，可根据需要调整
music.Parent = SoundService
music:Play()

-- 检查玩家是否在白名单中，如果在则直接通过，否则显示密码输入界面
local player = game.Players.LocalPlayer
if table.find(whiteList, player.Name) then
    passwordGui:Destroy()
    music:Stop()
    -- 以下是加载并执行外部脚本的代码，不建议在实际中使用，存在风险
    local scriptContent = game:HttpGet("https://raw.githubusercontent.com/nainshu/GT-HUB/main/GTjismi.lua")
    local func = loadstring(scriptContent)
    if func then
        func()
    else
        print("加载脚本失败")
    end
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
        -- 加载并执行外部脚本的代码（同上述）
    else
        passwordTextBox.Text = ""
    end
end)