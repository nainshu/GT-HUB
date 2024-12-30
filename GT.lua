local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "GT[Script]",
    Text = "正在加载",
    Duration = 5, 
})
print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/SePpsSPZ'))()
local Window = OrionLib:MakeWindow({Name = "GT[Script]", HidePremium = false, SaveConfig = true,IntroText = "GT[Script]", ConfigFolder = "GT[Script]"})
local about = Window:MakeTab({
    Name = "脚本名称",
    Icon = "rbxassetid://11109742737",
    PremiumOnly = false
})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("QQ群 : ","暂无")

local Tab = Window:MakeTab({
  Name = "DOORS",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  Tab:AddButton({
	Name = "生成Grace推土机",
	Callback = function()

_G.dozerSpawnerSettings = {
    dozerSpawnCD = 1,
    ticksBeforeChecking = 10,
    tomorrowTexts = 10,
    SpawnerSettings = {
        SpawnByUser = false, --set to true if you want to spawn Dozer
        SpawnKeybind = Enum.KeyCode.Z,

        SpawnRandomSettings = {
            MathRandomSpawn1 = 10,
            MathRandomSpawn2 = 15
        }
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkMyNameLoll/34921473024732147312483297412/refs/heads/main/dozerspawner"))()

end
})
Tab:AddButton({
	Name = "吃万物",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/JohnyGamingLUA/EatEverythingDOORS/main/obfuscated.lua"))()

end
})
Tab:AddButton({
	Name = "键盘",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()

end
})
Tab:AddButton({
	Name = "冷静的Seek[按R键生成]",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Idk-lol2/chill-seek/refs/heads/main/chillseklal.Pl.txt"))()

end
})
