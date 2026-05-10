--for i = 1,100 do game.ServerStorage['Rainbow Speed Coil']:Clone().Parent = game.Players.RQ_Feng.Backpack end
local plr = game:GetService('Players').LocalPlayer
local bp = plr.Backpack
local char = plr.Character

local function SpamItem(item)
    if not item:IsA('Tool') then return end
    task.spawn(function()
        local function GetItem()
            local handle = item:WaitForChild('Handle',3)
            handle.Transparency = 1
            repeat handle.Position = char.HumanoidRootPart.Position; task.wait(0.1) until item.Parent == bp or item.Parent == char
        end

        if item.Parent == workspace then GetItem() end

        repeat 
            item.Parent = char
            task.wait(0.5)
            item.Parent = workspace
            task.wait(3)
            GetItem()
        until not char
    end)
end

local SpamItemsEvent

local function SpamItems()
    for _, item in pairs(bp:GetChildren()) do SpamItem(item) end
    for _, item in pairs(workspace:GetChildren()) do SpamItem(item) end
    SpamItemsEvent = workspace.ChildAdded:Connect(SpamItem)
end

SpamItems()
repeat task.wait() until not char
SpamItemsEvent:Disconnect()