-- This is the code for the custom items right now this is just for testiong things out!
-- local cameraEntity = nil
-- local isCameraActive = false

-- local speedKMH = 15
-- local speedMS = speedKMH / 3.6  -- Convert speed to meters per second

-- local sensitivity = 3.0  -- Adjust the sensitivity for mouse control

-- RegisterCommand("startcamera", function()
--     if not isCameraActive then
--         local playerPed = GetPlayerPed(-1)
--         local playerCoords = GetEntityCoords(playerPed)
--         local playerHeading = GetEntityHeading(playerPed)
--         local forwardVector = GetEntityForwardVector(playerPed)
--         local cameraPosition = playerCoords + forwardVector * 10.0  -- Adjust the distance from the player

--         cameraEntity = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
--         SetCamCoord(cameraEntity, cameraPosition.x, cameraPosition.y, cameraPosition.z + 5.0)  -- Adjust the camera height
--         SetCamRot(cameraEntity, 0.0, 0.0, playerHeading)
--         SetCamFov(cameraEntity, 70.0)  -- Adjust the field of view
--         RenderScriptCams(true, true, 0, true, true)

--         local forwardVector = vector3(0, 0, speedMS)  -- Adjust the initial forward movement vector

--         isCameraActive = true

--         while isCameraActive do
--             Citizen.Wait(0)

--             -- Camera movement
--             local newPos = GetCamCoord(cameraEntity) + forwardVector
--             SetCamCoord(cameraEntity, newPos.x, newPos.y, newPos.z)

--             -- Mouse control
--             local mouseX, mouseY = GetControlNormal(0, 1), GetControlNormal(0, 2)
--             local currentRot = GetCamRot(cameraEntity)
--             local newRot = vector3(currentRot.x - mouseY * sensitivity, currentRot.y + mouseX * sensitivity, currentRot.z)
--             SetCamRot(cameraEntity, newRot.x, newRot.y, newRot.z)

--             local _, _, _, _, _, _, _, _, _, hasHitWall = GetRaycastResult(playerPed)
            
--             if hasHitWall then
--                 -- Camera has collided with a wall
--                 ExplodeEntity(cameraEntity, 0, 1)  -- Create an explosion at the camera's position
--                 ClearFocus()

--                 DestroyCam(cameraEntity)
--                 isCameraActive = false
--             end

--             local cameraSpeed = Vdist(0.0, 0.0, 0.0, forwardVector.x, forwardVector.y, forwardVector.z)
--             if cameraSpeed < speedMS then
--                 -- Camera speed has dropped below the minimum, delete it
--                 ClearFocus()


--                 DestroyCam(cameraEntity)
--                 isCameraActive = false
--             end
--         end
--     end
-- end, false)

-- RegisterCommand("stopcamera", function()
--     if isCameraActive then
--         DestroyCam(cameraEntity)
--         isCameraActive = false
--     end
-- end, false)
