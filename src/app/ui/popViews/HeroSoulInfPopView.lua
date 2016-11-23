--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroSoulInfPopView = class("HeroSoulInfPopView", BasePopView)

local Functions = require("app.common.Functions")

HeroSoulInfPopView.csbResPath = "tyj/csb"
HeroSoulInfPopView.debug = true
HeroSoulInfPopView.studioSpriteFrames = {"CC_commZbxq","HeroSoulUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroSoulInfPopView.studioSpriteFrames > 0 then
    HeroSoulInfPopView.spriteFrameNames = HeroSoulInfPopView.spriteFrameNames or {}
    table.insertto(HeroSoulInfPopView.spriteFrameNames, HeroSoulInfPopView.studioSpriteFrames)
end
function HeroSoulInfPopView:onInitUI()

    --output list
    self._heroSoulInfPanel_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Image_1"):getChildByName("heroSoulInfPanel")
	
    --label list
    
    --button list
    self._bt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Image_1"):getChildByName("heroSoulInfPanel"):getChildByName("bt")
	self._bt_t:onTouch(Functions.createClickListener(handler(self, self.onBtClick), "zoom"))

	self._upBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Image_1"):getChildByName("heroSoulInfPanel"):getChildByName("upBt")
	self._upBt_t:onTouch(Functions.createClickListener(handler(self, self.onUpbtClick), "zoom"))

	self._closeBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Bt btFunc
function HeroSoulInfPopView:onBtClick()
    Functions.printInfo(self.debug,"Bt button is click!")
    if self.jumpData.jumpType == JumpType.HeroSoulCtrToHeroSoulInf then
        self:getController():openChildView("app.ui.popViews.HeroSoulPopView",{isRemove = false,name = "HeroSoulPopView",data = {jumpPos = self.jumpData.jumpPos,
            jumpIndex = self.jumpData.jumpIndex,jumpMark = self.jumpData.jumpMark,jumpType = JumpType.HeroSoulInfToHeroSoulPop}})
        self:close()
    else
        if HeroSoulData:isAppareled(self.jumpData.selectedHeroSoulMark) then
            local callBack = function()
                self:apparelHeroSoul()
            end
            NoticeManager:openTips(self:getController(),{title = LanguageConfig.language_equip_2,handler = callBack})
        else
            self:apparelHeroSoul()
        end
    end

end
--@auto code Bt btFunc end

--@auto code Upbt btFunc
function HeroSoulInfPopView:onUpbtClick()
    Functions.printInfo(self.debug,"Upbt button is click!")
    self:getController():openChildView("app.ui.popViews.HeroSoulUpgradePopView",{isRemove = false,
        name = "HeroSoulUpgradePopView",data = {mark = self.jumpData.selectedHeroSoulMark,
        handler = function()
            self:initDisplayUI(self.jumpData)      
    end}})
  
end
--@auto code Upbt btFunc end

--@auto code Closebt btFunc
function HeroSoulInfPopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    if self.jumpData.handler ~= nil then 
        self.jumpData.handler()
    end
    self:close()   
end
--@auto code Closebt btFunc end

--@auto button backcall end


--@auto code output func
function HeroSoulInfPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HeroSoulInfPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
    self.jumpData = data
    self:initDisplayUI(data)
end

function HeroSoulInfPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end
function HeroSoulInfPopView:initDisplayUI(data)
    if data.jumpMark ~= nil then  --替换
        Functions.displayHeroSoulInf(self._heroSoulInfPanel_t,{mark = data.selectedHeroSoulMark},2)
    else
        Functions.displayHeroSoulInf(self._heroSoulInfPanel_t,{mark = data.selectedHeroSoulMark},3) 
    end       
    self:setHeroSoulBtStyle(data.selectedHeroSoulMark)  
end

function HeroSoulInfPopView:setHeroSoulBtStyle(mark)
    if HeroSoulData:isUpgradeAvailable(mark) then 
        self:setHerosoulInfBtPos(2)   
    else
        self:setHerosoulInfBtPos(1) 
    end  
end
function HeroSoulInfPopView:setHerosoulInfBtPos(btNum)
    if btNum == 2 then 
        self._upBt_t:setVisible(true)
        self._bt_t:setPositionX(151)
    else
        self._upBt_t:setVisible(false)
        self._bt_t:setPositionX(200)
    end
end
function HeroSoulInfPopView:apparelHeroSoul()
    local handler = function ()
        if self:getController()._childViews["HeroSoulPopView"] ~= nil then
            self:getController():closeChildView("HeroSoulPopView")
        end
        HeroSoulData:cleanHeroSoulAppraleOfMark(self.jumpData.selectedHeroSoulMark)
        HeroSoulData:cleanApparelFlag(self.jumpData.selectedHeroSoulMark)
        HeroSoulData:setHeroSoulAppareMark(self.jumpData.jumpPos,self.jumpData.jumpIndex,self.jumpData.selectedHeroSoulMark)
        HeroSoulData:setApparelFalg(self.jumpData.jumpPos,self.jumpData.jumpIndex,self.jumpData.selectedHeroSoulMark)
        self:getController():showHeroSoulUI(self.jumpData.jumpPos)
        self:close()
    end  
    local inf = {cardSlot = self.jumpData.selectedHeroSoulMark ,soldierType = self.jumpData.jumpPos, fightSlot= self.jumpData.jumpIndex}
    
    HeroSoulData:requestReplaceheroSoul(inf,handler)
end
return HeroSoulInfPopView