--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroSoulReplacePopView = class("HeroSoulReplacePopView", BasePopView)

local Functions = require("app.common.Functions")

HeroSoulReplacePopView.csbResPath = "tyj/csb"
HeroSoulReplacePopView.debug = true
HeroSoulReplacePopView.studioSpriteFrames = {"CB_unionTankuang","EquipmentReplacePopUI","HeroSoulUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroSoulReplacePopView.studioSpriteFrames > 0 then
    HeroSoulReplacePopView.spriteFrameNames = HeroSoulReplacePopView.spriteFrameNames or {}
    table.insertto(HeroSoulReplacePopView.spriteFrameNames, HeroSoulReplacePopView.studioSpriteFrames)
end
function HeroSoulReplacePopView:onInitUI()

    --output list
    self._nowPanel_t = self.csbNode:getChildByName("Panel_1"):getChildByName("nowPanel")
	self._selectedPanel_t = self.csbNode:getChildByName("Panel_1"):getChildByName("selectedPanel")
	
    --label list
    
    --button list
    self._closeBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))

	self._bt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("selectedPanel"):getChildByName("bt")
	self._bt_t:onTouch(Functions.createClickListener(handler(self, self.onBtClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Closebt btFunc
function HeroSoulReplacePopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    self:close()
end
--@auto code Closebt btFunc end

--@auto code Bt btFunc
function HeroSoulReplacePopView:onBtClick()
    Functions.printInfo(self.debug,"Bt button is click!")
    if HeroSoulData:isAppareled(self.jumpData.selectedHeroSoulMark) then
        local callBack = function()
            self:replaceHeroSoul()
        end
        NoticeManager:openTips(self:getController(),{title = LanguageConfig.language_equip_2,handler = callBack})
    else
        self:replaceHeroSoul()
    end
end
--@auto code Bt btFunc end

--@auto button backcall end


--@auto code output func
function HeroSoulReplacePopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HeroSoulReplacePopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	self.jumpData = data
    self:initDisplayUI(self.jumpData)
end

function HeroSoulReplacePopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end
function HeroSoulReplacePopView:initDisplayUI(data)
    Functions.displayHeroSoulInf(self._nowPanel_t,{mark = data.nowHeroSoulMark})
    Functions.displayHeroSoulInf(self._selectedPanel_t,{mark = data.selectedHeroSoulMark})
end
function HeroSoulReplacePopView:replaceHeroSoul( )
    local handler = function ()
        if self:getController()._childViews["HeroSoulPopView"] ~= nil then
            self:getController():closeChildView("HeroSoulPopView")
        end
        HeroSoulData:cleanHeroSoulAppraleOfMark(self.jumpData.selectedHeroSoulMark)
        HeroSoulData:cleanApparelFlag(self.jumpData.selectedHeroSoulMark)
        HeroSoulData:setHeroSoulAppareMark(self.jumpData.jumpPos,self.jumpData.jumpIndex,self.jumpData.selectedHeroSoulMark)
        HeroSoulData:setApparelFalg(0,self.jumpData.jumpIndex,self.jumpData.nowHeroSoulMark)
        HeroSoulData:setApparelFalg(self.jumpData.jumpPos,self.jumpData.jumpIndex,self.jumpData.selectedHeroSoulMark)
        self:getController():showHeroSoulUI(self.jumpData.jumpPos)
        self:close()
    end  
    local inf = {cardSlot = self.jumpData.selectedHeroSoulMark ,soldierType = self.jumpData.jumpPos, fightSlot = self.jumpData.jumpIndex}
    
    HeroSoulData:requestReplaceheroSoul(inf,handler)
 
end
return HeroSoulReplacePopView