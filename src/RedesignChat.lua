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

----------------------------------------------------------------------------------
--  New Functions to ZO_ChatWindowMinBar --
----------------------------------------------------------------------------------

-- TODO: Assign Functionality to Options Control
local function Initialize_SC_ChatWindowMinBarOptions()
    local control = GetControl("SC_ChatWindowMinBarOptions")
    control:SetParent(ZO_ChatWindowMinBar)
end


----------------------------------------------------------------------------------
--  ZO_ChatWindow Rearranging --
----------------------------------------------------------------------------------

local function Reanchor_ZO_ChatWindowBG()
    local control = GetControl("ZO_ChatWindowBg")
    control:ClearAnchors()
    control:SetAnchor(TOPLEFT, nil, nil, -10, 0)
    control:SetAnchor(BOTTOMRIGHT, nil, nil, -10, 10)

end

local function Reanchor_ZO_ChatWindowMinBar()
    local control = GetControl("ZO_ChatWindowMinBar")
    control:ClearAnchors()
    control:SetAnchor(BOTTOMLEFT, GuiRoot, BOTTOMLEFT, 0, 0)
end

local function Reanchor_ZO_ChatWindowMinimize()
    local control = GetControl("ZO_ChatWindowMinimize")
    control:ClearAnchors()
    control:SetAnchor(BOTTOMLEFT, ZO_ChatWindow , BOTTOMLEFT, -7, 7)
end

local function Reanchor_ZO_ChatWindowTextEntry()
    local control = GetControl("ZO_ChatWindowTextEntry")
    control:ClearAnchors()
    control:SetAnchor(BOTTOMLEFT, ZO_ChatWindowMinimize , BOTTOMRIGHT, 0, 0)
    control:SetAnchor(BOTTOMRIGHT, nil, nil, -23, 0)
end

local function Reanchor_ZO_ChatWindowOptions()
    local control = GetControl("ZO_ChatWindowOptions")
    control:ClearAnchors()
    control:SetAnchor(BOTTOMLEFT, ZO_ChatWindowMinimize, TOPLEFT, 0, 7)
end

-- It is neccessary to overwrite the orginal function because it overwrites the Anchors
-- every time the chat is Minimized. This is to rearange the Minibar.
function ZO_ChatSystem:ShowMinBar()
    --clear the anchors
    self.mailButton:ClearAnchors()
    self.mailLabel:ClearAnchors()
    self.friendsButton:ClearAnchors()
    self.friendsLabel:ClearAnchors()
    self.notificationsButton:ClearAnchors()
    self.notificationsLabel:ClearAnchors()
    self.minBar.maxButton:ClearAnchors()
    self.agentChatButton:ClearAnchors()

    --reset the parentage for fading purposes
    self.mailButton:SetParent(self.minBar)
    self.mailLabel:SetParent(self.minBar)
    self.friendsButton:SetParent(self.minBar)
    self.friendsLabel:SetParent(self.minBar)
    self.notificationsButton:SetParent(self.minBar)
    self.notificationsLabel:SetParent(self.minBar)
    self.agentChatButton:SetParent(self.minBar)

    --reanchor everything
    self.minBar.maxButton:SetAnchor(BOTTOMLEFT, self.minBar, BOTTOMLEFT, -7, 7)

    self.friendsButton:SetAnchor(BOTTOMLEFT, SC_ChatWindowMinBarOptions, TOPLEFT, 0, -15)
    self.friendsLabel:SetAnchor(TOPLEFT, self.friendsButton, BOTTOMLEFT, 0, -10)
    self.friendsLabel:SetAnchor(TOPRIGHT, self.friendsButton, BOTTOMRIGHT, 0, -10)

    self.mailButton:SetAnchor(BOTTOMLEFT, self.friendsButton, TOPLEFT, 0, -15)
    self.mailLabel:SetAnchor(TOPLEFT, self.mailButton, BOTTOMLEFT, 0, -10)
    self.mailLabel:SetAnchor(TOPRIGHT, self.mailButton, BOTTOMRIGHT, 0, -10)

    self.notificationsButton:SetAnchor(BOTTOMLEFT, self.mailButton, TOPLEFT, 0, -15)
    self.notificationsLabel:SetAnchor(TOPLEFT, self.notificationsButton, BOTTOMLEFT, 0, -10)
    self.notificationsLabel:SetAnchor(TOPRIGHT, self.notificationsButton, BOTTOMRIGHT, 0, -10)

    self.agentChatButton:SetAnchor(TOPLEFT, self.notificationsButton, BOTTOMLEFT, 0, -15)

    --center the labels
    self.mailLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
    self.friendsLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
    self.notificationsLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)

    self.minBar:SetHidden(false)
    self.isMinimized = true
end

function ZO_ChatSystem:HideMinBar()
    --clear the anchors
    ZO_ChatWindowOptions:ClearAnchors()
    self.mailButton:ClearAnchors()
    self.mailLabel:ClearAnchors()
    self.friendsButton:ClearAnchors()
    self.friendsLabel:ClearAnchors()
    self.notificationsButton:ClearAnchors()
    self.notificationsLabel:ClearAnchors()
    self.agentChatButton:ClearAnchors()

    --reset the parentage for fading purposes
    ZO_ChatWindowOptions:SetParent(self.control)
    self.mailButton:SetParent(self.control)
    self.mailLabel:SetParent(self.control)
    self.friendsButton:SetParent(self.control)
    self.friendsLabel:SetParent(self.control)
    self.notificationsButton:SetParent(self.control)
    self.notificationsLabel:SetParent(self.control)
    self.agentChatButton:SetParent(self.control)

    --reanchor everything
    ZO_ChatWindowOptions:SetAnchor(BOTTOMLEFT, ZO_ChatWindowMinimize, TOPLEFT, 0, 7)

    self.friendsButton:SetAnchor(BOTTOMLEFT, ZO_ChatWindowOptions, TOPLEFT, 0, -15)
    self.friendsLabel:SetAnchor(TOPLEFT, self.friendsButton, BOTTOMLEFT, 0, -10)
    self.friendsLabel:SetAnchor(TOPRIGHT, self.friendsButton, BOTTOMRIGHT, 0, -10)

    self.mailButton:SetAnchor(BOTTOMLEFT, self.friendsButton, TOPLEFT, 0, -15)
    self.mailLabel:SetAnchor(TOPLEFT, self.mailButton, BOTTOMLEFT, 0, -10)
    self.mailLabel:SetAnchor(TOPRIGHT, self.mailButton, BOTTOMRIGHT, 0, -10)

    self.notificationsButton:SetAnchor(BOTTOMLEFT, self.mailButton, TOPLEFT, 0, -15)
    self.notificationsLabel:SetAnchor(TOPLEFT, self.notificationsButton, BOTTOMLEFT, 0, -10)
    self.notificationsLabel:SetAnchor(TOPRIGHT, self.notificationsButton, BOTTOMRIGHT, 0, -10)

    self.agentChatButton:SetAnchor(TOPLEFT, self.notificationsButton, BOTTOMLEFT, 0, -15)

    --center the labels
    self.mailLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
    self.friendsLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
    self.notificationsLabel:SetHorizontalAlignment(TEXT_ALIGN_CENTER)

    self.isMinimized = false
    self.minBar:SetHidden(true)
end




function SANE_Chat.RedesignChat()
    Initialize_SC_ChatWindowMinBarOptions()
    Reanchor_ZO_ChatWindowMinBar()
    Reanchor_ZO_ChatWindowBG()
    Reanchor_ZO_ChatWindowMinimize()
    Reanchor_ZO_ChatWindowTextEntry()
    Reanchor_ZO_ChatWindowOptions()
end