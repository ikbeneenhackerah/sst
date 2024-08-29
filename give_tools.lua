-- Plaats dit script in een ServerScriptService in Roblox Studio

local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

-- Functie om alle tools in ServerStorage te tonen en ze aan de speler te geven
local function giveAllToolsToPlayer(player)
    -- Verkrijg alle tools in ServerStorage
    local tools = ServerStorage:GetChildren()
    
    -- Controleer of de speler al een Backpack heeft
    local backpack = player:FindFirstChildOfClass("Backpack")
    if not backpack then
        backpack = Instance.new("Backpack")
        backpack.Parent = player
    end

    -- Geef elke tool in ServerStorage aan de speler
    for _, item in ipairs(tools) do
        if item:IsA("Tool") then
            local toolClone = item:Clone()
            toolClone.Parent = backpack
            print("Tool toegevoegd aan de inventory van " .. player.Name .. ": " .. toolClone.Name)
        end
    end
end

-- Geef alle tools aan de speler die het spel betreedt
Players.PlayerAdded:Connect(function(player)
    -- Wacht een korte tijd totdat de speler volledig is geladen
    wait(5)
    giveAllToolsToPlayer(player)
end)
