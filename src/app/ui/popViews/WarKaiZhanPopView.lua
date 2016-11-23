--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarKaiZhanPopView = class("WarKaiZhanPopView", BasePopView)

local Functions = require("app.common.Functions")

WarKaiZhanPopView.csbResPath = "lk/csb"
WarKaiZhanPopView.debug = true
WarKaiZhanPopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarKaiZhanPopView.studioSpriteFrames > 0 then
    WarKaiZhanPopView.spriteFrameNames = WarKaiZhanPopView.spriteFrameNames or {}
    table.insertto(WarKaiZhanPopView.spriteFrameNames, WarKaiZhanPopView.studioSpriteFrames)
end
function WarKaiZhanPopView:onInitUI()

    --output list
    self._Text_title_name_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Text_title_name")
	self._Panel_yuan_jun_1_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_yuan_jun_1")
	self._Panel_yuan_jun_2_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_yuan_jun_2")
	self._Panel_yuan_jun_3_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_yuan_jun_3")
	self._Panel_yuan_jun_4_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_yuan_jun_4")
	
    --label list
    
    --button list
    self._Button_Members_close_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Button_Members_close")
	self._Button_Members_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_members_closeClick), "zoom"))

	self._Button_kaizhan_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Button_kaizhan")
	self._Button_kaizhan_t:onTouch(Functions.createClickListener(handler(self, self.onButton_kaizhanClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_members_close btFunc
function WarKaiZhanPopView:onButton_members_closeClick()
    Functions.printInfo(self.debug,"Button_members_close button is click!")
    self.close(self)
end
--@auto code Button_members_close btFunc end

--@auto code Button_kaizhan btFunc
function WarKaiZhanPopView:onButton_kaizhanClick()
    Functions.printInfo(self.debug,"Button_kaizhan button is click!")
    
    WarData:sendWar(self.bigID, self.smallID, handler(self, self.warJump))

end
--@auto code Button_kaizhan btFunc end

--@auto button backcall end


--@auto code output func
function WarKaiZhanPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarKaiZhanPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	self.bigID = data.bigId
	self.smallID = data.smallId
    local camp = WarData:getOneStrongholdCamp()
    local name = ""
    if camp == 1 then
        name = LanguageConfig.language_war_2
    elseif camp == 2 then
        name = LanguageConfig.language_war_3
    elseif camp == 3 then
        name = LanguageConfig.language_war_4
    else
        name = LanguageConfig.language_war_5
    end
    
    local CityName = WarData:getStrongholdInfo()[self.smallID].name.."("..name..")"
    self._Text_title_name_t:setString(CityName)
	local data = WarData:getOneStronghold()
    for k, v in pairs(data) do
        if v.state == 1 or v.state == 2 then
            local str = string.format("_Panel_yuan_jun_%d_t", k)
            local node = self[str]
            self:nodeShow(node,v)
        end
    end
end

function WarKaiZhanPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarKaiZhanPopView:warJump(playerInfo)
    Functions.printInfo(self.debug,"child class create call ")

    GameCtlManager:push("app.ui.combatSystem.CombatViewController",
        { data = {  combatType = CombatCenter.CombatType.RB_CountryFight,
            big = self.bigID,
            small = self.smallID,
            playerData = playerInfo
        }
        })
    self.close(self)
end

function WarKaiZhanPopView:nodeShow(node,data)
    Functions.printInfo(self.debug,"nodeShow")
    local strName = LanguageConfig.language_9_50
    if data.name then
        strName = tostring(data.name)
    end
    node:getChildByName("Text_wanjia_name"):setString(strName)
    node:getChildByName("Image_bar_bg"):setVisible(true)

    if data.pic then
        Functions.loadImageWithWidget(node:getChildByName("Image_head_bg"):getChildByName("Image_head"), Functions.getDisHeadFImagePathOfId(data.pic))
    end
    
    if data.state == 2 then
        node:getChildByName("Image_bar_bg"):getChildByName("Text_state"):setString(LanguageConfig.language_war_1)
    elseif data.state == nil then
        local str = tostring(0).."%"
        node:getChildByName("Image_bar_bg"):getChildByName("Text_state"):setString(str)
        node:getChildByName("Image_bar_bg"):getChildByName("LoadingBar"):setPercent(0)
    else
        local str = tostring(data.ratio).."%"
        node:getChildByName("Image_bar_bg"):getChildByName("Text_state"):setString(str)
        node:getChildByName("Image_bar_bg"):getChildByName("LoadingBar"):setPercent(data.ratio)
    end
end

return WarKaiZhanPopView