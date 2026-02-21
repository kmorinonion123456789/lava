local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "shiun4545 Hub",
   LoadingTitle = "Loading Scripts...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "shiun4545_Configs",
      FileName = "MainHub"
   }
})

local Tab = Window:CreateTab("Main Features", 4483362458) 

Tab:CreateButton({
   Name = "Rebirth & Speed (10)",
   Callback = function()
       local rebirthRemote = game:GetService("ReplicatedStorage").Events.Rebirth
       local speedRemote = game:GetService("ReplicatedStorage").Events.Speed
       
       print("Rebirth & Speed を送信しました")
       rebirthRemote:InvokeServer("GetRebirths")
       speedRemote:InvokeServer(table.unpack({"Speed", 10}))
   end,
})

Tab:CreateButton({
   Name = "Upgrade Execute",
   Callback = function()
       local upgradeRemote = game:GetService("ReplicatedStorage").Events.Upgrade
       upgradeRemote:InvokeServer()
       print("Upgrade を実行しました")
   end,
})

Tab:CreateButton({
   Name = "Collect All Brainrots (1-99)",
   Callback = function()
       local brainrotRemote = game:GetService("ReplicatedStorage").Events.AnimateBrainrot
       local count = 0
       
       for p = 1, 2 do
           local plot = workspace.GameFolder.Plots:FindFirstChild(tostring(p))
           if plot and plot:FindFirstChild("Brainrots") then
               for i = 1, 99 do
                   local item = plot.Brainrots:FindFirstChild(tostring(i))
                   if item and firesignal then
                       firesignal(brainrotRemote.OnClientEvent, item)
                       count = count + 1
                   end
               end
           end
       end
       
       Rayfield:Notify({
          Title = "Success",
          Content = count .. " 個のBrainrotを処理しました",
          Duration = 3,
          Image = 4483362458,
       })
   end,
})

Rayfield:LoadConfiguration()
