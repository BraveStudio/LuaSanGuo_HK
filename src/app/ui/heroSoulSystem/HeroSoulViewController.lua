--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local HeroSoulViewController = class("HeroSoulViewController", BaseViewController)

local Functions = require("app.common.Functions")

HeroSoulViewController.debug = true
HeroSoulViewController.modulePath = ...
HeroSoulViewController.studioSpriteFrames = {"CB_blackbg","HeroSoulUI","CBO_herosoul_bg" }
--@auto code head end

--@Pre loading
HeroSoulViewController.spriteFrameNames = 
    {
        "EquipmentUI","heroSoulRes","sodiersRes","equipmentRes"
    }

HeroSoulViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #HeroSoulViewController.studioSpriteFrames > 0 then
    HeroSoulViewController.spriteFrameNames = HeroSoulViewController.spriteFrameNames or {}
    table.insertto(HeroSoulViewController.spriteFrameNames, HeroSoulViewController.studioSpriteFrames)
end
function HeroSoulViewController:onDidLoadView()

    --output list
    self._soldierPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("soldierPanel")
	self._table_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("table")
	self._propertyPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel")
	self._topNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("topBarPanel"):getChildByName("topbarBg"):getChildByName("topNode")
	self._btPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("topBarPanel"):getChildByName("topbarBg"):getChildByName("btPanel")
	
    --label list
    self._title1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("title1")
	self._title1_t:setString(LanguageConfig.ui_equip_12)

	self._title2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("title2")
	self._title2_t:setString(LanguageConfig.ui_equip_11)

	self._hp_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("hp_t")
	self._hp_t_t:setString(LanguageConfig.language_9_46)

	self._at_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("at_t")
	self._at_t_t:setString(LanguageConfig.ui_equip_2)

	self._fs_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("fs_t")
	self._fs_t_t:setString(LanguageConfig.ui_equip_7)

	self._ff_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("ff_t")
	self._ff_t_t:setString(LanguageConfig.ui_equip_8)

	self._jm_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("jm_t")
	self._jm_t_t:setString(LanguageConfig.ui_equip_9)

	self._dk_t_t = self.view_t.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("dk_t")
	self._dk_t_t:setString(LanguageConfig.ui_equip_10)

	self._huisouLabel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("topBarPanel"):getChildByName("topbarBg"):getChildByName("Panel_3"):getChildByName("huisouLabel")
	self._huisouLabel_t:setString(LanguageConfig.language_Teach36)
    --button list
    self._backBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("topBarPanel"):getChildByName("topbarBg"):getChildByName("Panel_3"):getChildByName("backBt")
	self._backBt_t:onTouch(Functions.createClickListener(handler(self, self.onBackbtClick), ""))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Backbt btFunc
function HeroSoulViewController:onBackbtClick()
    Functions.printInfo(self.debug,"Backbt button is click!")
    GameCtlManager:pop(self)
end
--@auto code Backbt btFunc end

--@auto button backcall end


--@auto code view display func
function HeroSoulViewController:onCreate()
    Functions.printInfo(self.debug_b," HeroSoulViewController controller create!")
end

function HeroSoulViewController:onDisplayView()
	Functions.printInfo(self.debug_b," HeroSoulViewController view enter display!")
    self:initDisplay()
end
--@auto code view display func end
function HeroSoulViewController:initDisplay( )
    Functions.initResNodeUI(self._topNode_t,{"jinbi","yuanbao","soul"})
    local selectTableListener = function(target)
        if target == "tb1" then
            self:showHeroSoulUI(1)
        elseif target ==  "tb2" then
            self:showHeroSoulUI(2)
        elseif target == "tb3" then
            self:showHeroSoulUI(3)
        end
    end
    Functions.initTabComWithSimple({widget = self._table_t ,listener = selectTableListener, firstName = "tb1"})
end
function HeroSoulViewController:showHeroSoulUI(soidlerType)
    self:showSoidlerHeroSoul(soidlerType)
    self:setSoldierImg(self._soldierPanel_t:getChildByName("soldier"),soidlerType)
    self:showKindAtrr( soidlerType )
    self:showHeroSoulAttr(soidlerType)
end
function HeroSoulViewController:setSoldierImg(target,soidlerType)
    local soldierImg = ConfigHandler:getSoldierCardImageOfId(self:getSoldierIdOfShowType(soidlerType))
    target:ignoreContentAdaptWithSize(true)
    Functions.loadImageWithWidget(target, soldierImg)
end
function HeroSoulViewController:showSoidlerHeroSoul(soidlerType)
    for i=1,6 do 
        local heroSoulNode = self._soldierPanel_t:getChildByName("heroSoul" .. tostring(i))
        local mark = HeroSoulData.heroSoulApparel[soidlerType][i]
        if PlayerData.eventAttr.m_level < g_jhcfg.limitLevel[i] then 
            self:setLockHeroSoul(heroSoulNode,g_jhcfg.limitLevel[i])
        elseif mark > 0 then 
            Functions.getHeroSoulNodeOfMark(heroSoulNode,mark,function( )
                self:openChildView("app.ui.popViews.HeroSoulInfPopView",{isRemove = false,name = "HeroSoulInfPopView",
                    data = {jumpPos = soidlerType,jumpIndex = i,selectedHeroSoulMark = mark,jumpMark = mark,
                    jumpType = JumpType.HeroSoulCtrToHeroSoulInf,
                    handler = function()
                       self:showHeroSoulUI(soidlerType)
                    end
                    }})
            end)
        else
           Functions.cleanHeroSoulNodeWithAdd(heroSoulNode,function()
                self:openChildView("app.ui.popViews.HeroSoulPopView",{isRemove = false,name = "HeroSoulPopView",
                    data = {jumpPos = soidlerType,jumpIndex = i,
                    jumpType = JumpType.HeroSoulCtrToHeroSoulPop,
                    handler = function()
                       self:showHeroSoulUI(soidlerType)
                    end
                    }})
            end)
        end
    end
end

function HeroSoulViewController:showKindAtrr( soidlerType )
    -- local soldierId = self:getSoldierIdOfShowType(soidlerType)
    local kindHeroSoul = ConfigHandler:getKindHeroSoul(soidlerType)
    Functions.bindListWithData(self._propertyPanel_t:getChildByName("listView"), kindHeroSoul, function(index,widget,data,model)
        local keyNode = widget:getChildByName("key")
        local valueNode = widget:getChildByName("value")
        local isEnableNode = widget:getChildByName("isEnable")
        local heroSoulName = ConfigHandler:getHeroSoulNameOfId(data)
        keyNode:setString(string.format(LanguageConfig.language_Teach43,heroSoulName))
        keyNode:setVisible(true)
        valueNode:setVisible(true)
        isEnableNode:setVisible(true)
        local strTable = {"%s%%" .. LanguageConfig.language_sevenStar_6,
            "%s%%" .. LanguageConfig.ui_selectHero_2,
            "%s%%" .. LanguageConfig.language_sevenStar_7,
            "%s%%" .. LanguageConfig.language_sevenStar_4,
            "%s%%" .. LanguageConfig.language_sevenStar_8,
            "%s%%" .. LanguageConfig.language_sevenStar_9}
            local kindType = ConfigHandler:getHeroSoulKindTypeOfId(data)
            local kindRate = ConfigHandler:getHeroSoulKindRateOfId(data)
            valueNode:setString(string.format(strTable[kindType],kindRate*100))
            -- local colorValue = {
            --     cc.c3b(0,255,0),     --绿
            --     cc.c3b(255,0,0),     --红
            --     cc.c3b(0,0,255),     --蓝                
            --     cc.c3b(128,0,128),   --紫
            --     cc.c3b(156,42,42),             
            --     cc.c3b(255,165,0), 
            -- }
            valueNode:setColor(cc.c3b(255,0,0))
        if HeroSoulData:isInHeroSoulBook(data) then
            keyNode:setColor(cc.c3b(255,165,0))
            isEnableNode:setVisible(false)
        else
            keyNode:setColor(cc.c3b(107,77,22))
            valueNode:setColor(cc.c3b(107,77,22))
            isEnableNode:setColor(cc.c3b(30,202,30))
            isEnableNode:setString(LanguageConfig.language_5_15)
        end
    end) 
end

function HeroSoulViewController:showHeroSoulAttr(soidlerType)
    local soldierData = SoldiersData:getSoldiersDatas()
    local packageHeroSoul = HeroSoulData:packageApparelHeroSoul()
    local soldierId = soldierData[soidlerType].m_id
    local soldierLevel = soldierData[soidlerType].m_level


    local hp = Functions:getSoldierhHp(soldierId, soldierLevel, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("hp_down"):setString(tostring(math.floor(hp)))
    local at = Functions:getSoldierhAtk( soldierId, soldierLevel, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("at_down"):setString(tostring(math.floor(at)))
    local fs = Functions:getSoldierhFas( soldierId, soldierLevel, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("fs_down"):setString(tostring(math.floor(fs)))
    local ff = Functions:getSoldierhFaf( soldierId, soldierLevel, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("ff_down"):setString(tostring(math.floor(ff)))
    local bj = Functions:getSoldierhBaoj( soldierId, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("jm_down"):setString(tostring(bj*100))
    local bs = Functions:getSoldierhBaos( soldierId, packageHeroSoul,HeroSoulData.heroSoulBook)
    self._propertyPanel_t:getChildByName("dk_down"):setString(tostring(bs*100))

end
function HeroSoulViewController:getSoldierIdOfShowType(soidlerType)
   local soldierData = SoldiersData:getSoldiersDatas()
   return soldierData[soidlerType].m_id
end
function HeroSoulViewController:setLockHeroSoul(target,limitLevel)
    local lockView = target:getChildByName("heroSoulPanel"):getChildByName("lock")
    lockView:setVisible(true)
    lockView:getChildByName("text"):setString(tostring(limitLevel))
end

return HeroSoulViewController