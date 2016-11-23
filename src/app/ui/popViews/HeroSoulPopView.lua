--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroSoulPopView = class("HeroSoulPopView", BasePopView)

local Functions = require("app.common.Functions")

HeroSoulPopView.csbResPath = "tyj/csb"
HeroSoulPopView.debug = true
HeroSoulPopView.studioSpriteFrames = {"CB_unionTankuang","EquipmentUI","HeroSoulUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroSoulPopView.studioSpriteFrames > 0 then
    HeroSoulPopView.spriteFrameNames = HeroSoulPopView.spriteFrameNames or {}
    table.insertto(HeroSoulPopView.spriteFrameNames, HeroSoulPopView.studioSpriteFrames)
end
function HeroSoulPopView:onInitUI()

    --output list
    self._heroSoulContainer_t = self.csbNode:getChildByName("Panel_1"):getChildByName("heroSoulContainer")
	
    --label list
    
    --button list
    self._closeBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))

	self._affirmBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("affirmBt")
	self._affirmBt_t:onTouch(Functions.createClickListener(handler(self, self.onAffirmbtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Closebt btFunc
function HeroSoulPopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    self:close()
end
--@auto code Closebt btFunc end

--@auto code Affirmbt btFunc
function HeroSoulPopView:onAffirmbtClick()
    Functions.printInfo(self.debug,"Affirmbt button is click!")
    HeroSoulData.heroSoulUpgradeData = self.selectedHeroSoul
    if  self.jumpData.handler ~= nil then 
        self.jumpData.handler()
    end
    self:close()
end
--@auto code Affirmbt btFunc end

--@auto button backcall end


--@auto code output func
function HeroSoulPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HeroSoulPopView:onDisplayView(inf)
	Functions.printInfo(self.debug,"pop action finish ")
    self.jumpData = inf
    self:initDisplayUI(inf)
    if self.jumpData.jumpType == JumpType.HeroSoulUpgradeToHeroSoulPop then --将魂升级 
        self.selectedHeroSoul = clone(HeroSoulData.heroSoulUpgradeData)
        self._affirmBt_t:setVisible(true)
    else
        self._affirmBt_t:setVisible(false)
    end
end

function HeroSoulPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end
function HeroSoulPopView:initDisplayUI(inf)
    local jumpData = inf
    local listHandler = function(index, widget, model, data)
        widget:setSwallowTouches(false)
        local checkBox = widget:getChildByName("heroSoulPanel"):getChildByName("CheckBox_Mark") 
        checkBox:setSwallowTouches(false)
      
        if jumpData.jumpType == JumpType.HeroSoulUpgradeToHeroSoulPop then --将魂升级 
            checkBox:setVisible(true)
            if HeroSoulData:isInUpgradeHeroSoul(data.mark) then
                checkBox:setSelectedState(true)
            else
                checkBox:setSelectedState(false)
            end
        else
           checkBox:setVisible(false)
        end
        Functions.initTextColor(model:getChildByName("heroSoulPanel"):getChildByName("level"), 
            widget:getChildByName("heroSoulPanel"):getChildByName("level"))
        Functions.getHeroSoulNodeOfMark(widget,data.mark) 

        local clickHandler = function()
            if jumpData.jumpType == JumpType.HeroSoulUpgradeToHeroSoulPop then --将魂升级           
                if not checkBox:isSelected() then 
                    if self:addHeroSoulToTable(data.mark) then
                        checkBox:setSelectedState(true)
                    else
                        PromptManager:openTipPrompt("最多选择6个将魂！")
                    end
                else
                    self:cleanSelectedHeroSoulOfMark(data.mark)
                    checkBox:setSelectedState(false)
                end
            else
                if jumpData.jumpMark ~= nil and  jumpData.jumpMark > 0 then
                    -- local HeroSoulReplaceView = require("app.ui.popViews.HeroSoulReplacePopView"):new()--cs
                    self:getController():openChildView("app.ui.popViews.HeroSoulReplacePopView",{isRemove = false,name = "HeroSoulReplaceView",
                                                        data={nowHeroSoulMark = jumpData.jumpMark,                                          
                                                        selectedHeroSoulMark = data.mark,
                                                        jumpPos = jumpData.jumpPos,
                                                        jumpIndex = jumpData.jumpIndex,
                                                        handler = function()
                                                            self:initDisplayUI(self.jumpData)
                                                        end
                                                        }})  
                else
                    -- local HeroSoulInfView = require("app.ui.popViews.HeroSoulInfPopView"):new()--cs
                    self:getController():openChildView("app.ui.popViews.HeroSoulInfPopView",{isRemove = false,name = "HeroSoulInfView",
                                                        data={jumpPos = jumpData.jumpPos,
                                                        jumpIndex = jumpData.jumpIndex,
                                                        selectedHeroSoulMark = data.mark,
                                                        jumpType = JumpType.HeroSoulPopToHeroSoulInf,
                                                        handler = function()
                                                            self:initDisplayUI(self.jumpData)
                                                        end
                                                      }}) 

                end
            end
        end
        if index == 1 then 
            self._firstHeroSoulBt_t = widget
        end
        widget:setTouchEnabled(true)
        widget:onTouch(Functions.createTableViewClickListener(self._heroSoulContainer_t,clickHandler, "movedis"))
    end
    
    local heroSoulData = HeroSoulData:filterHeroSoulDataOfMark(HeroSoulData.heroSoulInf,jumpData.jumpMark) 
    if jumpData.jumpType == JumpType.HeroSoulUpgradeToHeroSoulPop then --将魂升级 
        heroSoulData = HeroSoulData:getHeroSoulWithoutAppareled(heroSoulData) 
    end  
    local sortHeroSoulData = HeroSoulData:sortHeroSoul(heroSoulData)

    local cleanNodeHandler = function(widget)
        Functions.cleanHeroSoulNode(widget)
        widget:setTouchEnabled(false)
        Functions.setHeroSoulSelected(widget,false) 
        widget:getChildByName("heroSoulPanel"):getChildByName("CheckBox_Mark"):setVisible(false)
    end
    
    Functions.bindTableViewWithData(self._heroSoulContainer_t,{firstData = sortHeroSoulData,
                                                         secondData = PlayerData.eventAttr.m_curEquipmentBagSize},
                                                         {handler = listHandler,handler2 = cleanNodeHandler},
                                                         {direction = true,col = 6,firstSegment = 20,segment = 10,segmentY = 20})
end
function HeroSoulPopView:addHeroSoulToTable(mark)
    for i = 1,#self.selectedHeroSoul do 
        if self.selectedHeroSoul[i] == 0 then 
            self.selectedHeroSoul[i] = mark
            return true
        end
    end
    return false
end
function HeroSoulPopView:cleanSelectedHeroSoulOfMark(mark)
    for i = 1,#self.selectedHeroSoul do 
        if self.selectedHeroSoul[i] == mark then 
            self.selectedHeroSoul[i] = 0
        end
    end
end
return HeroSoulPopView