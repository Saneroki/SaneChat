--
-- Created by IntelliJ IDEA.
-- User: Glenn @Saneroki [EU] Drescher
-- Date: 21/12/2016
-- Time: 19:39
--

----------------------------------------------------------------------------------
--  Initialize Defaults and Variables --
----------------------------------------------------------------------------------

SANE_Chat = SANE_Chat or {}
local addonName = "SaneChat"
local addonVersion = 1.00


----------------------------------------------------------------------------------
-- Initialize --
----------------------------------------------------------------------------------
local function Initialize()

    SANE_Chat.RedesignChat()

    -- Unregister Event
    EVENT_MANAGER:UnregisterForEvent(
        addonName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
end

local function OnAddOnLoaded(event, loadedAddon)
    if loadedAddon ~= addonName then return end
    Initialize()
end


----------------------------------------------------------------------------------
-- Register Events --
----------------------------------------------------------------------------------
EVENT_MANAGER:RegisterForEvent(addonName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)