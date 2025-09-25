-- 🌐 WataX Online AutoLoop Loader 🌐
-- This script fetches WataX_Path.json from GitHub (or any raw URL) and runs auto loop with respawn.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local running = false
local speed = 16
local resumeData = { pointIndex = 1 }

-- ⚠️ Ganti URL ini sesuai lokasi file WataX_Path.json di GitHub kamu (raw link)
local url = "https://raw.githubusercontent.com/indiaacacyah-ship-it/Project-Dutz/refs/heads/main/WataX_Path.json"

-- Load JSON waypoints
local success, data = pcall(function()
    return HttpService:JSONDecode(game:HttpGet(url))
end)

if not success or not data or not data.points then
    warn("Failed to load waypoints from URL:", url)
    return
end

local waypoints = {}
for _, p in ipairs(data.points) do
    table.insert(waypoints, Vector3.new(p[1], p[2], p[3]))
end
print("Loaded waypoints:", #waypoints)

local function getHRP()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

-- Respawn function (El Daun style)
local function respawnPlayer()
    player.Character:BreakJoints()
end

-- Step movement (WataX style)
local function stepTo(pos)
    local hrp = getHRP()
    local stepSize = 3
    local dir = (pos - hrp.Position)
    local dist = dir.Magnitude
    if dist == 0 then return end
    local unit = dir.Unit
    while dist > stepSize and running do
        hrp.CFrame = hrp.CFrame + unit * stepSize
        RunService.Heartbeat:Wait()
        dir = (pos - hrp.Position)
        dist = dir.Magnitude
        if dist == 0 then break end
        unit = dir.Unit
    end
    if running then hrp.CFrame = CFrame.new(pos) end
end

-- Play full track
local function playTrack(track)
    if not track or #track < 2 then return end
    for i = 2, #track do
        if not running then
            resumeData.pointIndex = i-1
            break
        end
        stepTo(track[i])
        resumeData.pointIndex = i
    end
end

-- Play from resume point
local function playTrackFromPoint(track, startIndex)
    if not track or #track < 2 then return end
    for i = startIndex+1, #track do
        if not running then
            resumeData.pointIndex = i-1
            break
        end
        stepTo(track[i])
        resumeData.pointIndex = i
    end
end

-- Start loop
function startLoop()
    if running then return end
    running = true
    resumeData.pointIndex = 1

    coroutine.wrap(function()
        while running do
            playTrack(waypoints)
            if running then
                respawnPlayer()
                task.wait(5)
                resumeData.pointIndex = 1
            end
        end
        running = false
    end)()
end

-- Stop loop
function stopLoop()
    running = false
end

-- Resume loop
function resumeLoop()
    if running then return end
    running = true
    coroutine.wrap(function()
        playTrackFromPoint(waypoints, resumeData.pointIndex or 1)
        if running then
            respawnPlayer()
            task.wait(5)
            resumeData.pointIndex = 1
            startLoop()
        end
    end)()
end

-- Auto start
startLoop()

print("WataX Online AutoLoop Loader loaded.")
