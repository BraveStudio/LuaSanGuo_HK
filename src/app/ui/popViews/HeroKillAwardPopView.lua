--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroKillAwardPopView = class("HeroKillAwardPopView", BasePopView)

local Functions = require("app.common.Functions")

HeroKillAwardPopView.csbResPath = "cs/csb"
HeroKillAwardPopView.debug = true
HeroKillAwardPopView.studioSpriteFrames = {"CombatAwardPopUI_Text" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroKillAwardPopView.studioSpriteFrames > 0 then
    HeroKillAwardPopView.spriteFrameNames = HeroKillAwardPopView.spriteFrameNames or {}
    table.insertto(HeroKillAwardPopView.spriteFrameNames, HeroKillAwardPopView.studioSpriteFrames)
end
function HeroKillAwardPopView:onInitUI()

    --output list
    self._award_panel_t = self.csbNode:getChildByName("award_panel")
	self._isReceive_t = self.csbNode:getChildByName("award_panel"):getChildByName("isReceive")
	self._need_star_num_t = self.csbNode:getChildByName("award_panel"):getChildByName("need_star_num")
	self._star_num_t = self.csbNode:getChildByName("award_panel"):getChildByName("star_num")
	
    --label list
    
    --button list
    self._receiveBt_t = self.csbNode:getChildByName("award_panel"):getChildByName("receiveBt")
	self._receiveBt_t:onTouch(Functions.createClickListener(handler(self, self.onReceivebtClick), ""))

	self._close_t = self.csbNode:getChildByName("award_panel"):getChildByName("close")
	self._close_t:onTouch(Functions.createClickListener(handler(self, self.onCloseClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Receivebt btFunc
function HeroKillAwardPopView:onReceivebtClick()
    Functions.printInfo(self.debug,"Receivebt button is click!")
    
    --算出总共获得多少星
    local data = self.AwardItem.diff
    local num = 0
    for k,v in pairs(data) do
        num = v.star + num
    end
    
    local open = false
    if self.AwardStarType == 1 then
        if num >= 6 then
            open = true
        end
    else
        if num == 12 then
            open = true
        end
    end
    if open then
        HeroKillData:sendStarPrize(self.bigID, self.AwardStarType, handler(self, self.lingQu))
    else
        PromptManager:openTipPrompt(LanguageConfig.language_HeroKill_1)
    end

end
--@auto code Receivebt btFunc end

--@auto code Close btFunc
function HeroKillAwardPopView:onCloseClick()
    Functions.printInfo(self.debug,"Close button is click!")
    self.close(self)
end
--@auto code Close btFunc end

--@auto button backcall end


--@auto code output func
function HeroKillAwardPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HeroKillAwardPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
    self.AwardItem = data.awardData
    self.AwardStarType = data.awardStarType
    self.bigID = data.id
    self.handler = data.handler
    self:Show()
end

function HeroKillAwardPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function HeroKillAwardPopView:lingQu()
    Functions.printInfo(self.debug,"lingQu ")
    --Functions.setEnabledBt(self._receiveBt_t,false)
    self._receiveBt_t:setVisible(false)
    self._isReceive_t:setVisible(true)
    self.handler()
end


function HeroKillAwardPopView:Show()
    Functions.printInfo(self.debug,"Show ")
    --根据类型显示打开奖励类型的星星数量
    local Item = {}
    if self.AwardStarType == 1 then
    	self._need_star_num_t:setText("6")
        Item = self.AwardItem.starReward1
        if self.AwardItem.starFlag1 == 2 then
            self._receiveBt_t:setVisible(false)
            self._isReceive_t:setVisible(true)
        elseif self.AwardItem.starFlag1 == 0 then
            Functions.setEnabledBt(self._receiveBt_t,false)
        end
    else
        self._need_star_num_t:setText("12")
        Item = self.AwardItem.starReward2
        if self.AwardItem.starFlag2 == 2 then
            self._receiveBt_t:setVisible(false)
            self._isReceive_t:setVisible(true)
        elseif self.AwardItem.starFlag2 == 0 then
            Functions.setEnabledBt(self._receiveBt_t,false)
        end
    end

    
    --算出总共获得多少星
    local data = self.AwardItem.diff
    local num = 0
    for k,v in pairs(data) do
        num = v.star + num
    end
    self._star_num_t:setText(num)
    
    local size = self._award_panel_t:getContentSize()
    local pX = 0
    for k,v in pairs(Item) do
        local hero = Functions.createPartNode({ nodeType = v[2], nodeId = v[1], count = v[3] })
        hero:setScale(0.7)
        pX = Functions.getPosOfIndex(k, #Item, 90, size.width/2)
        hero:setPosition(pX , size.height/2-10)
        self._award_panel_t:addChild(hero)
        --self.itemArray[#self.itemArray + 1] = hero
    	
    end
end

return HeroKillAwardPopView