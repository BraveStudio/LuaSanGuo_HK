--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarGuanKaPopView = class("WarGuanKaPopView", BasePopView)

local Functions = require("app.common.Functions")

WarGuanKaPopView.csbResPath = "lk/csb"
WarGuanKaPopView.debug = true
WarGuanKaPopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarGuanKaPopView.studioSpriteFrames > 0 then
    WarGuanKaPopView.spriteFrameNames = WarGuanKaPopView.spriteFrameNames or {}
    table.insertto(WarGuanKaPopView.spriteFrameNames, WarGuanKaPopView.studioSpriteFrames)
end
function WarGuanKaPopView:onInitUI()

    --output list
    self._Text_title_name_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Text_title_name")
	self._Panel_ren_wu_info_4_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_ren_wu_info_4")
	self._Panel_ren_wu_info_2_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_ren_wu_info_2")
	self._Panel_ren_wu_info_3_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_ren_wu_info_3")
	self._Panel_ren_wu_info_1_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_ren_wu_info_1")
	self._Panel_daojishi_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_daojishi")
	self._Text_tiem_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Panel_daojishi"):getChildByName("Text_tiem")
	
    --label list
    
    --button list
    self._Button_Members_close_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Button_Members_close")
	self._Button_Members_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_members_closeClick), "zoom"))

	self._Button_BUT_3_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Button_BUT_3")
	self._Button_BUT_3_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_3Click), "zoom"))

	self._Button_BUT_2_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Button_BUT_2")
	self._Button_BUT_2_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_2Click), "zoom"))

	self._Button_BUT_4_t = self.csbNode:getChildByName("Panel_shili"):getChildByName("Panel_yuan_jun_info_bg"):getChildByName("Button_BUT_4")
	self._Button_BUT_4_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_4Click), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_members_close btFunc
function WarGuanKaPopView:onButton_members_closeClick()
    Functions.printInfo(self.debug,"Button_members_close button is click!")
    self.close(self)
end
--@auto code Button_members_close btFunc end

--@auto code Button_but_3 btFunc
function WarGuanKaPopView:onButton_but_3Click()
    Functions.printInfo(self.debug,"Button_but_3 button is click!")
    WarData:sendCheckFriend (self.bigID, handler(self,self.showCheckFriend))
   
end
--@auto code Button_but_3 btFunc end

--@auto code Button_but_2 btFunc
function WarGuanKaPopView:onButton_but_2Click()
    Functions.printInfo(self.debug,"Button_but_2 button is click!")
    
    --打开据点界面
    WarData:setStrongholdInfo(self.bigID, handler(self,self.showJuDian))
end
--@auto code Button_but_2 btFunc end

--@auto code Button_but_1 btFunc
function WarGuanKaPopView:onButton_but_1Click()
    Functions.printInfo(self.debug,"Button_but_1 button is click!")
    WarData:sendCityRank(self.bigID, handler(self,self.jumpRank))
    
end
--@auto code Button_but_1 btFunc end

--@auto code Button_but_4 btFunc
function WarGuanKaPopView:onButton_but_4Click()
    Functions.printInfo(self.debug,"Button_but_4 button is click!")
    WarData:sendApplyFriend (self.bigID, handler(self,self.showApplyFriend))
    
end
--@auto code Button_but_4 btFunc end

--@auto button backcall end


--@auto code output func
function WarGuanKaPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarGuanKaPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	
    --监听援军改变
    local onYuanJun = function(event)
        self:showPlayer()
    end
    Functions.bindEventListener(self, GameEventCenter, WarData.OK_YUAN_JUN, onYuanJun)
	
	self.bigID = data.bigId

    local mapInfo = WarData:getCityInfo()
    local name = ""
    if mapInfo.camp == 1 then
        name = LanguageConfig.language_war_2
    elseif mapInfo.camp == 2 then
        name = LanguageConfig.language_war_3
    elseif mapInfo.camp == 3 then
        name = LanguageConfig.language_war_4
    else
        name = LanguageConfig.language_war_5
    end
    local CityName = mapInfo.name.."("..name..")"
    self._Text_title_name_t:setString(CityName)

	local cityInfo = WarData:getCityInfo().boost
    for k,v in pairs(cityInfo) do
        local nodeStr = string.format("_Panel_ren_wu_info_%d_t", k)
        --local node = self._Panel_city_bg_t:getChildByName(nodeStr)
        self:showNode(self[nodeStr], v)
    end
    
    local cityInfo = WarData:getMapInfo()
    if PlayerData.eventAttr.m_uid == cityInfo[self.bigID].ownId then
        self._Button_BUT_3_t:setVisible(true)
        Functions.setEnabledBt(self._Button_BUT_4_t, false)
    else
        self._Button_BUT_3_t:setVisible(false)
        if PlayerData.eventAttr.m_camp == cityInfo[self.bigID].camp then
            Functions.setEnabledBt(self._Button_BUT_4_t, true)
        else
            Functions.setEnabledBt(self._Button_BUT_4_t,false)
        end 
    end

    if self.bigID == 4 or self.bigID == 21 or self.bigID == 26 then
        self._Button_BUT_2_t:setVisible(false)
        self._Button_BUT_3_t:setVisible(false)
        self._Button_BUT_4_t:setVisible(false)
    end
    --是否显示倒计时
    if cityInfo[self.bigID].state == 0 then
        self._Panel_daojishi_t:setVisible(true)
        self:showTime()
    end
end

function WarGuanKaPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarGuanKaPopView:showPlayer()
    Functions.printInfo(self.debug,"showPlayer")
    local cityInfo = WarData:getCityInfo().boost
    for k,v in pairs(cityInfo) do
        local nodeStr = string.format("_Panel_ren_wu_info_%d_t", k)
        self:showNode(self[nodeStr], v)
    end
end

function WarGuanKaPopView:showNode(node,data)
	Functions.printInfo(self.debug,"showNode")
    Functions.loadImageWithWidget(node:getChildByName("Image_head_bg"):getChildByName("Image_head"), Functions.getDisHeadFImagePathOfId(data.pic))
	Functions.initLabelOfString(node:getChildByName("Text_guanzhi_name"), data.offer, node:getChildByName("Text_wanjia_name"), data.name )
end

--跳转到据点界面
function WarGuanKaPopView:showJuDian()
    GameCtlManager:push("app.ui.warBattleMapSystem.WarBattleMapViewController",{data={bigID = self.bigID}})
end

--跳转到城池伤害界面
function WarGuanKaPopView:jumpRank()
    self._controller_t:openChildView("app.ui.popViews.WarDamagePopView", {data = {type = 1}})
end

--申请援军
function WarGuanKaPopView:showApplyFriend()
    --弹出报错信息
    PromptManager:openTipPrompt(LanguageConfig.language_war_9)
end

--申请援军
function WarGuanKaPopView:showCheckFriend()
    self._controller_t:openChildView("app.ui.popViews.WarReinforcementsPopView", {data={bigID = self.bigID}})
end

function WarGuanKaPopView:showTime()
    Functions.printInfo(self.debug,"bidTime")

    local remove = 0
    --倒记时
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local CountdownTime = WarData:getCityInfo().occupyTime
        m_newtime = CountdownTime - m_newtime 

        if m_newtime < 0 then
            m_newtime = 0
            self._Panel_daojishi_t:setVisible(false)
            Functions.removeEventListenerByView(self._Text_tiem_t, GameEventCenter, remove)
        end

        local time = TimerManager:formatOverTime("%02d:%02d:%02d", m_newtime)
        local str = string.format(LanguageConfig.language_war_19, time)
        Functions.initLabelOfString( self._Text_tiem_t, str)
    end
    remove = Functions.bindEventListener(self._Text_tiem_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

return WarGuanKaPopView