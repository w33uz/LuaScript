local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/w3uz/Lua/main/finityuifork.lua"))()

local ui = library.new(true, "Strelizia Fork | Finity version", UDim2.new(0, 600, 0, 350))
ui.ChangeToggleKey(Enum.KeyCode.Insert)

local HomeCategory = ui:Category("Home")
local MainCategory = ui:Category("Main")
local ShardCategory = ui:Category("Shard")
local MiscCategory = ui:Category("Misc")

local eggsbegan = game:GetService("Players").LocalPlayer.leaderstats["Eggs Opened"].Value

local plr = game.Players.LocalPlayer
local char = plr.Character
local root = char.HumanoidRootPart

function toTarget(pos, targetPos, targetCFrame)
        local info = TweenInfo.new((targetPos - pos).Magnitude / 80, Enum.EasingStyle.Quad)
        local tween, err =
            pcall(
            function()
                local tween =
                    game:GetService("TweenService"):Create(
                    plr.Character["HumanoidRootPart"],
                    info,
                    {CFrame = targetCFrame}
                )
                tween:Play()
            end
        )
        if not tween then
            return err
        end
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game.StarterGui:SetCore("SendNotification", {
   Title = "Strelizia Fork";
   Text = "Finity version has loaded\nDiscord Server: https://discord.gg/pC8wTaj";
   Duration = "1";
})

local cccc = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
repeat
wait()
cccc = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
until cccc ~= nil
local hat1 = cccc.HatchEgg
local hat3 = cccc.MultiHatchEgg

-- Home Category

local CreditsSector = HomeCategory:Sector("Credits")

CreditsSector:Cheat("Label", "UI Library: Finity")
CreditsSector:Cheat("Label", "Script was made by weuz_#9020")
CreditsSector:Cheat("Label", "Finity version may be laggy, also i'll update finity version after wally")
CreditsSector:Cheat("Label", "Discord Invite: https://discord.gg/pC8wTaj")
CreditsSector:Cheat("Button", "Copy Discord Invite", function()
	setclipboard("https://discord.gg/pC8wTaj")
end, {text="Copy"})

-- Main Category

local Autofarm = MainCategory:Sector("Autofarm")

local bubbleblow = false

Autofarm:Cheat(
	"Checkbox", -- Type
	"Blow Bubbles", -- Name
	function(State)
	   if bubbleblow == false then
        bubbleblow = true
            while bubbleblow and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BlowBubble"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1)
            end
        else
        end
        bubbleblow = false
end)

local christmasfarm = false

local skiptargets = {}

Autofarm:Cheat(
	"Checkbox", -- Type
	"Christmas Houses", -- Name
	function(State)
	   if christmasfarm == false then
        christmasfarm = true
            while christmasfarm and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local distance = math.huge
				local target
				for i,v in pairs(game:GetService("Workspace").ChristmasMap.Houses:GetChildren()) do
					if v:WaitForChild("Activation"):WaitForChild("Tag"):WaitForChild("BillboardGui"):WaitForChild("Tag").Text == "Deliver Gift" and v:WaitForChild("Activation"):WaitForChild("Active").Value and (root.Position - v.Activation.Root.Position).Magnitude < distance and v ~= skiptargets[1] and v ~= skiptargets[2] and v ~= skiptargets[3] then
						distance = (root.Position - v.Activation.Root.Position).Magnitude
						target = v.Activation.Root
						if #skiptargets == 3 then
							table.remove(skiptargets, 1)
						end
					end
				end
				if not target ~= nil and target.Parent.Active.Value and target.Parent.Tag.BillboardGui.Tag.Text == "Deliver Gift" then
					toTarget(root.Position,target.Position + Vector3.new(0,2,0),target.CFrame + Vector3.new(0,2,0))
				end
				local starttime = os.time()
				local connection
            end
        else
        end
        christmasfarm = false
end)

local EggsSector = MainCategory:Sector("Open Eggs/Crates")

EggsSector:Cheat("Textbox", "Egg/Crate Name", function(Value)
	shared.egg = Value
end, {
	placeholder = "Egg/Crate Name"
})

local openx1 = false

EggsSector:Cheat(
	"Checkbox", -- Type
	"Open (x1)", -- Name
	function(State)
	   if openx1 == false then
        openx1 = true
            while openx1 and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "PurchaseEgg"
                local A_2 = shared.egg
                local A_3 = "Multi"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2, A_3)
            end
        else
        end
        openx1 = false
end)

local openx3 = false

EggsSector:Cheat(
	"Checkbox", -- Type
	"Open (x3)", -- Name
	function(State)
    if openx3 == false then
        openx3 = true
            while openx3 and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "PurchaseEgg"
                local A_2 = shared.egg
                local A_3 = "Multi"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2, A_3)
            end
        else
        end
        openx3 = false
end)

EggsSector:Cheat(
    "Checkbox",
    "Skip Animation",
    function(gh)
        cccc.HatchEgg = (gh == true and function()
            end or hat1)
        cccc.MultiHatchEgg = (gh == true and function()
            end or hat3)
    end
)

local Merchant = MainCategory:Sector("Merchant Autobuy")

local merchantone = false

Merchant:Cheat(
	"Checkbox", -- Type
	"Autobuy Merchant One", -- Name
	function(State)
    if merchantone == false then
        merchantone = true
            while merchantone and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 1
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchantone = false
end)

local merchanttwo = false

Merchant:Cheat(
	"Checkbox", -- Type
	"Autobuy Merchant Two", -- Name
	function(State)
    if merchanttwo == false then
        merchanttwo = true
            while merchanttwo and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 2
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchanttwo = false
end)

local merchantthree = false

Merchant:Cheat(
	"Checkbox", -- Type
	"Autobuy Merchant Three", -- Name
	function(State)
    if merchantthree == false then
        merchantthree = true
            while merchantthree and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 3
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchantthree = false
end)

local MainOther = MainCategory:Sector("Other")

local groupreward = false

MainOther:Cheat(
	"Checkbox", -- Type
	"Group Reward", -- Name
	function(State)
    if groupreward == false then
        groupreward = true
            while groupreward and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "CollectGroupReward"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteFunction
                Event:InvokeServer(A_1)
                wait(3)
            end
        else
        end
        groupreward = false
end)

local spintowin = false

MainOther:Cheat(
	"Checkbox", -- Type
	"Spin To Win", -- Name
	function(State)
    if spintowin == false then
        spintowin = true
            while spintowin and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "SpinToWin"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1)
                wait(3)
            end
        else
        end
        spintowin = false
end)

local dailyreward = false

MainOther:Cheat(
	"Checkbox", -- Type
	"Daily Rewards", -- Name
	function(State)
    if dailyreward == false then
        dailyreward = true
            while dailyreward and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "ClaimDailyReward"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1)
                wait(3)
            end
        else
        end
        dailyreward = false
end)


-- Shard Category

local ShardQuest = ShardCategory:Sector("Shard AutoQuest")

local autoquest = false

ShardQuest:Cheat(
	"Checkbox", -- Type
	"Get/Confirm Shard Quests", -- Name
	function(State)
    if autoquest == false then
        autoquest = true
            while autoquest and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "ClaimShardQuestReward"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1)
    			wait(1)
                local A_1 = "GetShardQuest"
                local A_2 = "Hard"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        autoquest = false
end)

local ShardAutobuy = ShardCategory:Sector("Shard AutoBuy")

local shardluckautobuy = false

ShardAutobuy:Cheat(
	"Checkbox", -- Type
	"Autobuy Luck", -- Name
	function(State)
    if shardluckautobuy == false then
        shardluckautobuy = true
            while shardluckautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 1
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardluckautobuy = false
end)

local shardspeedautobuy = false

ShardAutobuy:Cheat(
	"Checkbox", -- Type
	"Autobuy Speed", -- Name
	function(State)
    if shardspeedautobuy == false then
        shardspeedautobuy = true
            while shardspeedautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 2
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardspeedautobuy = false
end)

local shardshinyautobuy = false

ShardAutobuy:Cheat(
	"Checkbox", -- Type
	"Autobuy Shiny", -- Name
	function(State)
    if shardshinyautobuy == false then
        shardshinyautobuy = true
            while shardshinyautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 3
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardshinyautobuy = false
end)

local shardmythicautobuy = false

ShardAutobuy:Cheat(
	"Checkbox", -- Type
	"Autobuy Mythic", -- Name
	function(State)
    if shardmythicautobuy == false then
        shardmythicautobuy = true
            while shardmythicautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 4
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardmythicautobuy = false
end)

local TheLab = ShardCategory:Sector("The Lab")

local autocraftshadow = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft Shadow Potion", -- Name
	function(State)
    if autocraftshadow == false then
        autocraftshadow = true
            while autocraftshadow and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 3
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftshadow = false
end)

local autocraftmaxlvl = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft MaxLevel", -- Name
	function(State)
    if autocraftmaxlvl == false then
        autocraftmaxlvl = true
            while autocraftmaxlvl and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 4
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftmaxlvl = false
end)

local autocraftmaxench = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft MaxEnchant", -- Name
	function(State)
    if autocraftmaxench == false then
        autocraftmaxench = true
            while autocraftmaxench and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 5
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftmaxench = false
end)

local autocraftmaxshad = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft Max Shadow", -- Name
	function(State)
    if autocraftmaxshad == false then
        autocraftmaxshad = true
            while autocraftmaxshad and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 6
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftmaxshad = false
end)

local autocraftmoneypot = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft Money Potion", -- Name
	function(State)
    if autocraftmoneypot == false then
        autocraftmoneypot = true
            while autocraftmoneypot and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 7
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftmoneypot = false
end)

local autocraftworldpot = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft Worlds Potion", -- Name
	function(State)
    if autocraftworldpot == false then
        autocraftworldpot = true
            while autocraftworldpot and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 8
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftworldpot = false
end)

local autocraftbubblepot = false

TheLab:Cheat(
	"Checkbox", -- Type
	"Autocraft Bubble Potion", -- Name
	function(State)
    if autocraftbubblepot == false then
        autocraftbubblepot = true
            while autocraftbubblepot and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BrewPotion"
                local A_2 = 8
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
                wait(1)
            end
        else
        end
        autocraftbubblepot = false
end)

local TheLabMisc = ShardCategory:Sector("The Lab Misc")

local autocraftclaim = false

TheLabMisc:Cheat(
	"Checkbox", -- Type
	"Autoclaim Potions", -- Name
	function(State)
    if autocraftclaim == false then
        autocraftclaim = true
            while autocraftclaim and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "ClaimPotion"
                local A_2 = 1
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2) 
                wait(1)
            end
        else
        end
        autocraftclaim = false
end)

local antiuhoh = false

TheLabMisc:Cheat(
	"Checkbox", -- Type
	"Anti Uh-Oh!", -- Name
	function(State)
    if antiuhoh == false then
        antiuhoh = true
            while antiuhoh and game:GetService("RunService").RenderStepped:wait() do
                wait()
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MaxPotions.Visible = false
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MaxBrewing.Visible = false
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Overlay.Visible = false
                wait(1)
            end
        else
        end
        antiuhoh = false
end)

-- Misc Category

local MiscSector = MiscCategory:Sector("Misc")

local tradeban = false

MiscSector:Cheat("Toggle", "Fake Tradeban", function()
    if tradeban == false then
        tradeban = true
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Trade.Banned.Visible = true
    else
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Trade.Banned.Visible = false
        tradeban = false
    end
end)

local ministats = false

MiscSector:Cheat("Toggle", "Stats Overlay", function()
    if ministats == false then
        ministats = true
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MobileStats.Visible = true
    else
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MobileStats.Visible = false
        ministats = false
    end
end)

MiscSector:Cheat("Button", "Session Eggs", function()
    local eggssrn = game:GetService("Players").LocalPlayer.leaderstats["Eggs Opened"].Value
    local eggsses = math.abs(eggsbegan-eggssrn)
    game.StarterGui:SetCore("SendNotification", {
       Title = "Session Eggs";
       Text = "You hatched already\n"..eggsses.."\neggs in this roblox session";
       Duration = "1";
    })
end, {text="Get Info"})

MiscSector:Cheat("Button", "Boost FPS", function()
   local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end 
end, {text = '+20 FPS'})

local LocalPlayer = MiscCategory:Sector("LocalPlayer")

LocalPlayer:Cheat("Slider", "WalkSpeed", function(v)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, {min = 0, max = 500, suffix = " studs"})

LocalPlayer:Cheat("Slider", "JumpPower", function(v)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end, {min = 0, max = 500, suffix = " studs"})

local GuiSettings = MiscCategory:Sector("GUI Settings")

GuiSettings:Cheat("Button", "Destroy GUI", function()
   game:GetService("CoreGui").FinityUI:Destroy() 
end, {text="Destroy GUI"})
