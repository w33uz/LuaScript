-- This is fork of strelizia tho

local LatestSupportedVersion = 1870

local eggsbegan = game:GetService("Players").LocalPlayer.leaderstats["Eggs Opened"].Value

game.StarterGui:SetCore("SendNotification", {
   Title = "Strelizia Fork";
   Text = "Script has loaded\nDiscord Server: https://discord.gg/T97SmtTegD";
   Duration = "1";
})

local cccc = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
repeat
wait()
cccc = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
until cccc ~= nil
local hat1 = cccc.HatchEgg
local hat3 = cccc.MultiHatchEgg

function scr()
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(
        function()
            wait(900)
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    )

    local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/w3uz/Lua/main/wallyfork.lua"), true))()

    local f =
        debug.getupvalues(
        require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService).UpdateClickDelay
    )[1]
    repeat
        wait(.1)
        f =
            debug.getupvalues(
            require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService).UpdateClickDelay
        )[1]
    until f ~= nil
    local Module = game:GetService("ReplicatedStorage").Assets.Modules.ImageService
    local guiserv = require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService)

    local pets = debug.getupvalues(require(Module))[1]

    local farm = library:CreateWindow("Strelizia Fork")

    local petlist = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.PetModule)
    local hatlist = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.HatModule)
    local raritys = {}
    local moneyz = require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService)

    local currencys = {}
    local currencylist = {}
    table.insert(currencylist, "Bubbles")
    table.insert(currencylist, "Coins")
    local canafford = false
    local canaffordchange = false
    for i, d in pairs(moneyz) do
        if string.find(i, "Changed") ~= nil then
            currencys[i:sub(1, #i - 7)] = debug.getupvalues(d)[3]
            table.insert(currencylist, i:sub(1, #i - 7))
        end
    end
    for i, d in pairs(petlist) do
        if d["Rarity"] ~= "Legendary" then
            raritys[d["Rarity"]] = true
        end
    end
    local function ownsgamepass(userid, gamepassid)
        local mar = game:GetService "MarketplaceService"
        local s, res = pcall(mar.UserOwnsGamePassAsync, mar, userid, gamepassid)
        if not s then
            res = false
        end
        return res
    end

    local triple = ownsgamepass(game.Players.LocalPlayer.UserId, 5502695)
    local plusFive = ownsgamepass(game.Players.LocalPlayer.UserId, 5364330)
    local vip = ownsgamepass(game.Players.LocalPlayer.UserId, 5361608)
    
    local shard = library:CreateWindow("Shard")
	
	shard:Section("AutoQuest")
	shard:Toggle('Redeem Shard Chal', {flag = 'shardChal'})
	shard:Section("AutoBuy")
	shard:Toggle('Autobuy Shard Luck', {flag = 'shardLuck'})
	shard:Toggle('Autobuy Shard Speed', {flag = 'shardSpeed'})
	shard:Toggle('Autobuy Shard Mythic', {flag = 'shardMyth'})
	shard:Toggle('Autobuy Shadow Potions', {flag = 'shardPot'})
	shard:Section("The Lab")
	shard:Section("AutoCraft Pot")
	shard:Toggle("+1 Lvl", {flag = 'onelevel'})
	shard:Toggle("+1 Enchant", {flag = 'oneenchant'})
	shard:Toggle("+1 Shadow", {flag = 'oneshadow'})
	shard:Toggle("Max Level", {flag = 'maxlvl'})
	shard:Toggle("Max Enchant", {flag = 'maxenchant'})
	shard:Toggle("Max Shadow", {flag = 'maxshadow'})
	shard:Toggle("Money Pot", {flag = 'moneypot'})
	shard:Toggle("Worlds Pot", {flag = 'worldspot'})
	shard:Toggle("Bubbles Pot", {flag = 'bubblespot'})
	shard:Section("AutoClaim Pot")
	shard:Toggle("Autoclaim Potions", {flag = 'autoclaimpot'})
    shard:Toggle("Anti Uh-Oh!", {flag = 'antiuhoh'})
	
	
    local worlds = {}
    local loadworlds = false
    repeat
        wait(0.1)
        local modul =
            require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.WorldService).SetWorld
        for i, d in pairs(debug.getupvalue(modul, 3)) do
            loadworlds = true
        end
    until loadworlds
    local tpyes = require(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.WorldService)
    table.insert(worlds, "Overworld")
    table.insert(worlds, "Event")
    for i, d in pairs(debug.getupvalue(tpyes.SetWorld, 3)) do
        if i ~= "Overworld" then
            table.insert(worlds, i)
        end
    end

    currentWorld = "Overworld"
    currentBuff = "Bubbles"
    buffChange = true

    local function changeBuff(oldBuff, newBuff)
        if oldBuff ~= newBuff then
            currentBuff = newBuff
            buffChange = true
        else
            buffChange = false
        end
    end

    local function tptoDrops(oldworld, newworld)
        if oldworld ~= newworld then
            if oldworld == "Event" then
                tpyes.SetWorld(tpyes, "Overworld")
                f["FireServer"](f, "Teleport", "EventLeave")
            end
            if newworld == "Event" then
                tpyes.SetWorld(tpyes, "Overworld")
                f["FireServer"](f, "Teleport", "EventSpawn")
            elseif newworld == "Overworld" then
                tpyes.SetWorld(tpyes, newworld)
                f["FireServer"](f, "Teleport", "EventLeave")
            else
                tpyes.SetWorld(tpyes, newworld)
            end
            currentWorld = newworld
        end
    end

    

    collectingchests = false
    chestscollected = 0

    local function collectChests(size)
        local oldBuff = currentBuff
        local oldWorld = currentWorld
        if size == "CoinChest" then
            changeBuff(currentBuff, "Coins")
            tptoDrops(currentWorld, "Overworld")
            wait(2)
            for k, d in pairs(islandchests[size]) do
                for i, v in pairs(game:GetService("Workspace").FloatingIslands:GetDescendants()) do
                    if v.Name == "Chest" and v.ClassName == "Model" and v.Parent.Name == d then
                        f["FireServer"](f, "TeleportToCheckpoint", v.Parent.Name)
                        wait(0.25)
                        repeat
                            f["FireServer"](f, "CollectChestReward", v.Parent.Name)
                            wait()
                        until v.Regen.Enabled == true
                        wait(0.25)
                    end
                end
            end
            changeBuff(currentBuff, oldBuff)
            tptoDrops(currentWorld, oldWorld)
            wait(2)
        else
            for k, d in pairs(worlds) do
                if d == "Underworld" then
                    changeBuff(currentBuff, "Magma")
                elseif d == "Rainbow Land" then
                    changeBuff(currentBuff, "Stars")
                elseif d == "Mystic Forest" then
                    changeBuff(currentBuff, "Crystals")
                elseif d == "Candy Land" then
                    changeBuff(currentBuff, "Candy")
                elseif d == "Atlantis" then
                    changeBuff(currentBuff, "Pearls")
                elseif d == "Toy Land" then
                    changeBuff(currentBuff, "Blocks")
                elseif d == "Beach World" then
                    changeBuff(currentBuff, "Shells")
                end

                if d ~= "Event" then
                    tptoDrops(currentWorld, d)
                    wait(2)
                    for i, v in pairs(game:GetService("Workspace").FloatingIslands:GetDescendants()) do
                        if size == "All" then
                            if v.Name == "Chest" and v.ClassName == "Model" then
                                if d == "Overworld" then
                                    if v.Parent.Name == "The Floating Island" then
                                        changeBuff(currentBuff, "Coins")
                                    else
                                        changeBuff(currentBuff, "Gems")
                                    end
                                end
                                game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                    v.Parent.Collision.CFrame
                                f["FireServer"](f, "TeleportToCheckpoint", v.Parent.Name)
                                wait(0.25)
                                repeat
                                    f["FireServer"](f, "CollectChestReward", v.Parent.Name)
                                    wait()
                                until v.Regen.Enabled == true
                                wait(0.25)
                            end
                        else
                            for k, d in pairs(islandchests[size]) do
                                if v.Name == "Chest" and v.ClassName == "Model" and v.Parent.Name == d then
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
                                        v.Parent.Collision.CFrame
                                    f["FireServer"](f, "TeleportToCheckpoint", v.Parent.Name)
                                    wait(0.25)
                                    repeat
                                        f["FireServer"](f, "CollectChestReward", v.Parent.Name)
                                        wait()
                                    until v.Regen.Enabled == true
                                    wait(0.25)
                                end
                            end
                        end
                    end
                end
            end
            changeBuff(currentBuff, oldBuff)
            tptoDrops(currentWorld, oldWorld)
            wait(2)
        end
    end

    maxRewards = 200

    spawn(
        function()
            while wait(.1) do
                if misc.flags.AutoWorldRewards then
                    for i, d in pairs(worlds) do
                        if currentWorld ~= nil then
                            if d == currentWorld then
                                for x = 1, maxRewards do
                                    f:FireServer("CollectReward", d, x)
                                    wait(1.5)
                                end
                            end
                        end
                    end
                end
            end
        end
    )


    local eggtps = {}
    local eggsnames = {}
    local egginfo = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.EggModule)
    local crateinfo = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.CrateModule)
    for i, d in pairs(require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.EggModule)) do
        if game.Workspace.Eggs:FindFirstChild(i) then
            eggtps[i] = game.Workspace.Eggs[i].Hotkey
        end
        table.insert(eggsnames, i)
    end
    for i, d in pairs(require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.CrateModule)) do
        if game.Workspace.Eggs:FindFirstChild(i) then
            eggtps[i] = game.Workspace.Eggs[i].Hotkey
        end
        table.insert(eggsnames, i)
    end

    sell = false
    local range = 100

    local plr = game.Players.LocalPlayer
    local char = plr.Character

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

    spawn(
        function()
            while wait(.1) do
                local canaffordold = canafford
                if
                    not sell and not collectingchests and not autoguessing and
                        (farm.flags.eggs == true or farm.flags.three == true)
                 then
                    if farm.flags.egg ~= nil then
                        if (egginfo[farm.flags.egg] or crateinfo[farm.flags.egg]) then
                            local cost = (egginfo[farm.flags.egg] or crateinfo[farm.flags.egg]).Cost
                            local e = 0
                            e = cost[2]
                            if farm.flags.three then
                                e = e * 3
                            end
                            if currencys[cost[1]] and sell ~= true then
                                if currencys[cost[1]].Value >= e then
                                    canafford = true
                                    if eggtps[farm.flags.egg] then
                                        if
                                            game.Players.LocalPlayer.Character and
                                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                         then
                                            if
                                                (eggtps[farm.flags.egg].Position -
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                                                    10
                                             then
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                    CFrame.new(
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                                    eggtps[farm.flags.egg].Position.Y,
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                                                )
                                                toTarget(
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                                                    eggtps[farm.flags.egg].Position,
                                                    eggtps[farm.flags.egg].CFrame
                                                )
                                            else
                                                if farm.flags.three == true then
                                                    f["FireServer"](f, "PurchaseEgg", farm.flags.egg, "Multi")
                                                else
                                                    f["FireServer"](f, "PurchaseEgg", farm.flags.egg)
                                                end
                                            end
                                        end
                                    end
                                else
                                    canafford = false
                                end
                            else
                                canafford = false
                            end
                        else
                            canafford = false
                        end
                    else
                        canafford = false
                    end
                else
                    canafford = false
                end
            end
        end
    )
    farm:Section("Open Eggs / Crates")
    farm:SearchBox(
        "Egg",
        {
            location = farm.flags,
            flag = "egg",
            list = eggsnames
        },
        function()
        end
    )

    farm:Toggle("Buy Eggs", {flag = "eggs"})
    if triple then
        farm:Toggle("Buy Eggs (3x)", {flag = "three"})
    end
    farm:Section("Farm")
    farm:Toggle("Auto-Bubble Blow", {flag = "Bubble"})

    farm:Box(
        "Radius",
        {
            flag = "Rad",
            type = "number"
        }
    )

    farm:Toggle("Farm Drops", {flag = "Drops"})
    farm:Section("Acquire Buffs")
    farm:Toggle("Daily Challenge", {flag = "dailyChal"})
    farm:Toggle("Group Benefits", {flag = "groupBene"})

    farm:Section("MiniGames")
    farm:Toggle("Spin To Win", {flag = "spt"})
    farm:Toggle("Doggy Jump", {flag = "doggyJump"})
    farm:Toggle("AutoGuess Pet", {flag = "Guess"})
    farm:Section("Merchant Autobuy")
    farm:Toggle("Autobuy First", {flag = 'merchantOne'})
    farm:Toggle("Autobuy Second", {flag = 'merchantTwo'})
    farm:Toggle("Autobuy Third", {flag = 'merchantThree'})
	farm:Section("https://discord.gg/T97SmtTegD")

	
    local events = library:CreateWindow("Event")
    events:Section("Events Autofarm")
	events:Toggle("Christmas Houses", {flag = "housesch"})
	events:Section("Christmas Shop Buy")
	events:Toggle("Autobuy Luck", {flag = 'ChristmasOne'})
	events:Toggle("Autobuy Speed", {flag = 'ChristmasTwo'})
	events:Toggle("Autobuy +1 Enchant", {flag = 'ChristmasThree'})
	events:Toggle("Autobuy Shadow Pot", {flag = 'ChristmasFour'})
	events:Toggle("Autobuy Max Level", {flag = 'ChristmasFive'})
	events:Toggle("Autobuy Max Enchant", {flag = 'ChristmasSix'})
    
    
    local misc = library:CreateWindow("Misc")
    misc:Section("Swap")
    misc:Dropdown(
        "World",
        {
            location = _G,
            flag = "world",
            list = worlds
        },
        function(new)
            tptoDrops(currentWorld, new)
        end
    )
    
    misc:Section("Other")
    misc:Toggle(
        "Skip Animation",
        {flag = "soa"},
        function(gh)
            cccc.HatchEgg = (gh == true and function()
                end or hat1)
            cccc.MultiHatchEgg = (gh == true and function()
                end or hat3)
        end
    )
    misc:Button(
        "Stats Overlay ON",
        function()
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MobileStats.Visible = true
        end
    )
    misc:Button(
        "Stats Overlay OFF",
        function()
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MobileStats.Visible = false
        end
    )
    misc:Button(
        "Fake Tradeban",
        function()
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Trade.Banned.Visible = true
        end
    )
    misc:Button(
        "Fake Trade Ban OFF",
        function()
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.TempTradeBan.Visible = false
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Trade.Banned.Visible = false
        end
    )
    misc:Button(
        "Fix In Game GUI",
        function()
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Visible = true
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Visible = true
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Settings.Visible = true
        end
    )
    misc:Button(
        "Session Eggs",
        function()
            local eggssrn = game:GetService("Players").LocalPlayer.leaderstats["Eggs Opened"].Value
            local eggsses = math.abs(eggsbegan-eggssrn)
            game.StarterGui:SetCore("SendNotification", {
               Title = "Session Eggs";
               Text = "You hatched already\n"..eggsses.."\neggs in this roblox session";
               Duration = "1";
            })
        end
    )
    
    misc:Section("Items/Prizes/Rewards")
    misc:Toggle("Bubbles", {flag = "AutoClaimBubbles"})
    misc:Toggle("Eggs", {flag = "AutoClaimEggs"})
    misc:Toggle("World Pet Rewards", {flag = "AutoWorldRewards"})
    misc:Section("LocalPlayer")
    misc:Slider("Walkspeed", {
        min=0;
        max=300;
        flags="localwsplayer"},function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    )
    misc:Slider("JumpPower", {
        min=0;
        max=500;
        flags="localjpplayer"},function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    )
    misc:Section("GUI Settings")
    misc:Button(
        "Destroy GUI",
        function()
            game.CoreGui.ScreenGui:Destroy()
        end
    )
    
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local root = char.HumanoidRootPart
   
    function toTarget(pos, targetPos, targetCFrame)
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new((targetPos - pos).Magnitude/50, Enum.EasingStyle.Quad)
       -- local tic_k = tick()
        local tween, err = pcall(function()
            local tween = tween_s:Create(plr.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
            tween:Play()
        end)
        if not tween then return err end
    end
	
	local skiptargets = {}
   
	spawn(function()
		while wait() do
			if not _G.sell and events.flags.housesch == true and not ((farm.flags.eggs == true or farm.flags.three == true) and _G.canafford) then
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
				if not farm.flags.walk and target ~= nil and target.Parent.Active.Value and target.Parent.Tag.BillboardGui.Tag.Text == "Deliver Gift" then
					toTarget(root.Position,target.Position + Vector3.new(0,2,0),target.CFrame + Vector3.new(0,2,0))
				end
				local starttime = os.time()
				local connection
				if farm.flags.walk and target ~= nil and target.Parent.Active.Value and target.Parent.Tag.BillboardGui.Tag.Text == "Deliver Gift" then
					game:GetService("Players").LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(2486.85, 55.0488, -294.33))
					connection = game:GetService("Players").LocalPlayer.Character.Humanoid.MoveToFinished:Connect(function()
						game:GetService("Players").LocalPlayer.Character.Humanoid:MoveTo(target.Position, target)
						connection:Disconnect()
						connection = nil
					end)
				end
				repeat
					wait()
				until target == nil or not target.Parent.Active.Value or target.Parent.Tag.BillboardGui.Tag.Text ~= "Deliver Gift" or os.time() > starttime + 10
				if target and target.Parent.Active.Value and farm.flags.walk then
					table.insert(skiptargets, target.Parent.Parent)
					print("Skipping target")
				end
			end
		end
	end)
	
	spawn(
        function()
            while wait(7) do
        if shard.flags.onelevel then
            local A_1 = "BrewPotion"
            local A_2 = 1
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.oneenchant then
            local A_1 = "BrewPotion"
            local A_2 = 2
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.oneshadow then
            local A_1 = "BrewPotion"
            local A_2 = 3
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.maxlvl then
            local A_1 = "BrewPotion"
            local A_2 = 4
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.maxenchant then
            local A_1 = "BrewPotion"
            local A_2 = 5
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.maxshadow then
            local A_1 = "BrewPotion"
            local A_2 = 6
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.moneypot then
            local A_1 = "BrewPotion"
            local A_2 = 7
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.worldspot then
            local A_1 = "BrewPotion"
            local A_2 = 8
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.bubblespot then
            local A_1 = "BrewPotion"
            local A_2 = 9
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if shard.flags.autoclaimpot then
           local A_1 = "ClaimPotion"
            local A_2 = 1
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2) 
           wait(3) 
        end
        if farm.flags.merchantOne then
            local A_1 = "BuyMerchantItem"
            local A_2 = 1
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
		end
        if farm.flags.merchantTwo then
            local A_1 = "BuyMerchantItem"
            local A_2 = 2
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
        if farm.flags.merchantThree then
            local A_1 = "BuyMerchantItem"
            local A_2 = 3
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
            wait(3)
        end
		if shard.flags.shardLuck then
			local A_1 = "BuyShardShopItem"
			local A_2 = 1
			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
			Event:FireServer(A_1, A_2)
			wait(3)
		end
		if shard.flags.shardSpeed then
			local A_1 = "BuyShardShopItem"
			local A_2 = 2
			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
			Event:FireServer(A_1, A_2)
			wait(3)
		end
		if shard.flags.shardMyth then
			local A_1 = "BuyShardShopItem"
			local A_2 = 3
			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
			Event:FireServer(A_1, A_2)
			wait(3)
		end
		if shard.flags.shardPot then
			local A_1 = "BuyShardShopItem"
			local A_2 = 4
			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
			Event:FireServer(A_1, A_2)
			wait(3)
		end
		if events.flags.ChristmasOne then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 1
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
		if events.flags.ChristmasTwo then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 2
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
		if events.flags.ChristmasThree then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 3
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
		if events.flags.ChristmasFour then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 4
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
		if events.flags.ChristmasFive then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 5
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
		if events.flags.ChristmasSix then
	        local A_1 = "BuyChristmasItem"
            local A_2 = 6
            local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
            Event:FireServer(A_1, A_2)
	    end
        end
    end
    )
	
    spawn(
        function()
            while wait(10) do
    		if shard.flags.shardChal then
    			f['FireServer'](f, 'ClaimShardQuestReward')
    			wait(1)
    			f['FireServer'](f, 'GetShardQuest', 'Hard')
    			wait(1)
    		end
                if farm.flags.spt then
                    f["FireServer"](f, "SpinToWin")
                    wait(6)
                    guiserv:DisplayFrame("")
                end
                if farm.flags.doggyJump then
                    for i = 1, 4 do
                        f["FireServer"](f, "DoggyJumpWin", i)
                        wait(3)
                    end
                end
                if farm.flags.groupBene then
                    f["InvokeServer"](f, "CollectGroupReward")
                    wait(3)
                end
                if farm.flags.dailyChal then
                    f["FireServer"](f, "ClaimDailyReward")
                    wait(3)
                end
		
            end
        end
    )

    spawn(
        function()
            while wait(.1) do
                if farm.flags.Bubble then
                    if f then
                        f["FireServer"](f, "BlowBubble")
                    else
                        f =
                            debug.getupvalues(
                            require(
                                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService
                            ).UpdateClickDelay
                        )[1]
                    end
                end
            end
        end
    )

    spawn(
        function()
            while wait(.1) do
                if farm.flags.Sell and not collectingchests and not autoguessing then
                    local counter = 0
                    local leftside = ""
                    local rightside = ""
                    local a = {"", ""}
                    a =
                        string.split(
                        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:WaitForChild("StatsFrame").Bubble.Amount.Text,
                        "/"
                    )
                    if string.find(a[1], ",") ~= nil then
                        leftside = a[1]:gsub(",", "")
                    else
                        leftside = a[1]
                    end
                    if string.find(a[2], ",") ~= nil then
                        rightside = a[2]:gsub(",", "")
                    else
                        rightside = a[2]
                    end

                    if leftside ~= "" then
                        leftside = tonumber(leftside)
                    else
                        leftside = 0
                    end
                    if rightside ~= "" then
                        rightside = tonumber(rightside)
                    else
                        rightside = 0
                    end
                    if leftside >= rightside then
                        sell = true
                        guiserv:DisplayFrame("")

                        wait(.1)
                        local oldWorld = currentWorld
                        local oldBuff = currentBuff
                        tptoDrops(currentWorld, "Mystic Forest")
                        wait(2)
                        repeat
                            f["FireServer"](f, "Teleport", "Sell")
                            wait(.1)
                            f["FireServer"](f, "Sell")
                            wait(.1)
                        until string.split(
                            game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:WaitForChild("StatsFrame").Bubble.Amount.Text,
                            "/"
                        )[1] == "0"
                        changeBuff(currentBuff, oldBuff)
                        tptoDrops("Mystic Forest", oldWorld)
                        wait(2)
                        if farm.flags.Drops then
                            for k, d in pairs(islandchests["GiantChests"]) do
                                for i, v in pairs(game:GetService("Workspace").FloatingIslands:GetDescendants()) do
                                    if v.Name == "Chest" and v.ClassName == "Model" and v.Parent.Name == d then
                                        game:GetService("Players").LocalPlayer.Character:WaitForChild(
                                                "HumanoidRootPart"
                                            ).CFrame = v.Parent.Collision.CFrame
                                        f["FireServer"](f, "TeleportToCheckpoint", v.Parent.Name)
                                        wait(2)
                                    end
                                end
                            end
                        end
                        sell = false
                    else
                        sell = false
                    end
                end
            end
        end
    )

    autoguessing = false
    game:GetService("Workspace").GuessThatPet.GuessThatPetBoard.SurfaceGui.Frame.Main.Pet.Changed:Connect(
        function()
            if not collectingchests and not sell and farm.flags.Guess then
                autoguessing = true
                local oldWorld = currentWorld
                local oldBuff = currentBuff
                local guessboard = game:GetService("Workspace").GuessThatPet.GuessThatPetBoard
                changeBuff(currentBuff, "Gems")
                tptoDrops(currentWorld, "Overworld")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
                    guessboard.CFrame.Y - 2,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
                toTarget(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                    guessboard.Position + Vector3.new(0, -2, 0),
                    guessboard.CFrame + Vector3.new(0, -2, 0)
                )
                for i, d in pairs(pets) do
                    if d == game:GetService("Workspace").GuessThatPet.GuessThatPetBoard.SurfaceGui.Frame.Main.Pet.Image then
                        for x = 1, 10, 1 do
                            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                i,
                                "All"
                            )
                            wait(1)
                        end
                    end
                end
                wait(10)
                tptoDrops(currentWorld, oldWorld)
                autoguessing = false
            else
                autoguessing = false
            end
        end
    )

    local target = nil
    spawn(
        function()
            while wait() do
                if not sell and (farm.flags.Drops or target) then
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                end
            end
        end
    )

    spawn(
        function()
            while wait(.2) do
                if not collectingchests and farm.flags.Drops then
                    local closest = nil
                    local dis = math.huge
                    for i, v in ipairs(game.Workspace.Pickups:GetChildren()) do
                        range = farm.flags.Rad
                        if tonumber(range) ~= nil then
                            if v:FindFirstChild("TouchInterest") and (char.HumanoidRootPart.Position - v.Position).magnitude <= tonumber(range) and (char.HumanoidRootPart.Position - v.Position).magnitude < dis and
                                    farm.flags.Drops and
                                    canafford ~= true and
                                    sell ~= true
                             then
                                closest = v
                                dis = (char.HumanoidRootPart.Position - v.Position).magnitude
                            end
                        end
                    end
                    if closest ~= nil and (target == nil or target.Parent == nil) then
                        local dis = closest.CFrame.Y - char.HumanoidRootPart.CFrame.Y
                        if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
                            char.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.CFrame.X, closest.CFrame.Y + 2, char.HumanoidRootPart.CFrame.Z)
                        end
                        toTarget(
                            char.HumanoidRootPart.Position,
                            closest.Position + Vector3.new(0, 2, 0),
                            closest.CFrame + Vector3.new(0, 2, 0)
                        )
                    end
                end
            end
        end
    )

    spawn(
        function()
            local prize = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.PrizeModule)
            while wait(.1) do
                if misc.flags.AutoClaimBubbles then
                    for i, d in ipairs(prize["Bubbles"]) do
                        f:InvokeServer("CollectPrize", "Bubbles", i)
                        wait(3)
                    end
                end

                if misc.flags.AutoClaimEggs then
                    for k, v in ipairs(prize["Eggs"]) do
                        f:InvokeServer("CollectPrize", "Eggs", k)
                        wait(3)
                    end
                end
            end
        end
    )

    spawn(
        function()
        while game:GetService("RunService").RenderStepped:wait() do
            if shard.flags.antiuhoh then
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MaxPotions.Visible = false
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MaxBrewing.Visible = false
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Overlay.Visible = false
            end
        end
    end)

    local Module = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService
    local gg = require(Module)

    local function GetRarity(name)
        local entry = petlist[name]
        if entry ~= nil then
            return petlist[name]["Rarity"]
        else
            return "error"
        end
    end

    local function HGetRarity(name)
        local entry = hatlist[name]
        if entry ~= nil then
            return hatlist[name]["Rarity"]
        else
            return "error"
        end
    end

    local function Delete(Id)
        f["FireServer"](f, "DeletePet", Id)
    end
    local function HDelete(Id)
        f["FireServer"](f, "DeleteHat", Id)
    end
    repeat
        wait()
    until typeof(gg.TryShowPetsFrame) == "function"
    local get = debug.getupvalues(require(Module).TryShowPetsFrame)[4]["PetsFrame"]

    local Eggs = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.EggModule)
    local Crates = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.CrateModule)
    local EasyLeg = {}
    for i, v in pairs(Eggs) do
        for i, v in pairs(v.Rarities) do
            if GetRarity(v[1]) == "Legendary" and v[2] >= 0.1 then
                table.insert(EasyLeg, v[1])
            end
        end
    end
    local HEasyLeg = {}
    for i, v in pairs(Crates) do
        for i, v in pairs(v.Rarities) do
            if GetRarity(v[1]) == "Legendary" and v[2] >= 0.1 then
                table.insert(HEasyLeg, v[1])
            end
        end
    end

    local pn = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["PETS"]
    local hn = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["HATS"]
    local prizeModule = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.PrizeModule)
    local claimedHatchRewardIndex =
        require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["CLAIMED_HATCH_REWARDS"]
    local redeemedCodes = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["REDEEMED_CODES"]
    local potionIndex = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["POTIONS"]
    local playerData = f:InvokeServer("GetPlayerData")
end


 scr()
