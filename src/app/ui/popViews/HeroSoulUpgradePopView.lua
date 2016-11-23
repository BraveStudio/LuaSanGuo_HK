--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroSoulUpgradePopView = class("HeroSoulUpgradePopView", BasePopView)

local Functions = require("app.common.Functions")

HeroSoulUpgradePopView.csbResPath = "tyj/csb"
HeroSoulUpgradePopView.debug = true
HeroSoulUpgradePopView.studioSpriteFrames = {"UseExpCardPopUI","ShiLianUI","HeroSoulUI","CBO_infor" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroSoulUpgradePopView.studioSpriteFrames > 0 then
    HeroSoulUpgradePopView.spriteFrameNames = HeroSoulUpgradePopView.spriteFrameNames or {}
    table.insertto(HeroSoulUpgradePopView.spriteFrameNames, HeroSoulUpgradePopView.studioSpriteFrames)
end
function HeroSoulUpgradePopView:onInitUI()

    --output list
    self._Panel_add_crad_t = self.csbNode:getChildByName("Panel_add_crad")
	self._mainHeroSoul_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("Panel_15"):getChildByName("mainHeroSoul")
	self._levelPanel_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel")
	self._LoadingBar_2_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel"):getChildByName("Sprite_bar_bg"):getChildByName("LoadingBar_2")
	self._LoadingBar_1_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel"):getChildByName("Sprite_bar_bg"):getChildByName("LoadingBar_1")
	self._heroSoulName_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel"):getChildByName("heroSoulName")
	self._addPanle_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("addPanle")
	self._Text_get_EXP_num_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("Sprite_get_EXP_1"):getChildByName("Text_get_EXP_num")
	self._Particle_li_zi_guang_t = self.csbNode:getChildByName("Particle_li_zi_guang")
	
    --label list
    self._attr_0_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel"):getChildByName("attr_0")
	self._attr_0_t:setString(LanguageConfig.ui_equip_13)

	self._Text_crad_up_string_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("levelPanel"):getChildByName("Text_crad_up_string")
	self._Text_crad_up_string_t:setString(LanguageConfig.ui_Enhance_2)
    --button list
    self._upBt_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("upBt")
	self._upBt_t:onTouch(Functions.createClickListener(handler(self, self.onUpbtClick), "zoom"))

	self._closeBt_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))

	self._autoAddBt_t = self.csbNode:getChildByName("Panel_add_crad"):getChildByName("autoAddBt")
	self._autoAddBt_t:onTouch(Functions.createClickListener(handler(self, self.onAutoaddbtClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Upbt btFunc
function HeroSoulUpgradePopView:onUpbtClick()
    Functions.printInfo(self.debug,"Upbt button is click!")
    HeroSoulData:requestUpgradeheroSoul(self.mark,HeroSoulData.heroSoulUpgradeData,function(event)
    	local oldLevel = HeroSoulData:getHeroSoulLevel(self.mark)
        local newLevel = event.data.level
        local ids = HeroSoulData:getHeroSoulIdsOfMarks(HeroSoulData.heroSoulUpgradeData)
    	self:playAddHeroSoulAction(ids)    	
    	for k,v in pairs(HeroSoulData.heroSoulUpgradeData) do
            HeroSoulData:miuHeroSoul(v)
        end
        HeroSoulData:setExpAndLevel(self.mark,event.data.level,event.data.exp)
        Functions.getHeroSoulNodeOfMark(self._mainHeroSoul_t,self.mark)
        HeroSoulData:cleanHeroSoulUpgradeData()
        self:displayHeroSoulAtrr(self.mark) 	
    	if oldLevel < newLevel then
	    	self._Particle_li_zi_guang_t:resetSystem()
	    	self._Particle_li_zi_guang_t:setDuration(2)
    	end
    	Functions.playSound("herolevelup.mp3")
    end)
end
--@auto code Upbt btFunc end

--@auto code Closebt btFunc
function HeroSoulUpgradePopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    HeroSoulData:cleanHeroSoulUpgradeData()
    if self.handler ~= nil then
    	self.handler()
    end
    self:close()
end
--@auto code Closebt btFunc end

--@auto code Autoaddbt btFunc
function HeroSoulUpgradePopView:onAutoaddbtClick()
    Functions.printInfo(self.debug,"Autoaddbt button is click!")
    HeroSoulData:autoAddUpgradeHeroSoul(self.mark)
    self:displayHeroSoulAtrr(self.mark)
end
--@auto code Autoaddbt btFunc end

--@auto button backcall end


--@auto code output func
function HeroSoulUpgradePopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
	-- Functions.playSildeToCenterAction(self,MoveDirection.DOWN)
	Functions.playScaleOpenChildViewAction(self)
end

function HeroSoulUpgradePopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	self.mark = data.mark
	self.handler = data.handler
	self:initDisplay(data.mark)
end

function HeroSoulUpgradePopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
	self._Particle_li_zi_guang_t:stopSystem()
end
--@auto code output func end
function HeroSoulUpgradePopView:initDisplay(mark)
	Functions.getHeroSoulNodeOfMark(self._mainHeroSoul_t,mark)
	self:displayHeroSoulAtrr(mark)
end
function HeroSoulUpgradePopView:displayHeroSoulAtrr(mark)

	self:updateAddHeroSoul(mark)
    self:updateAttr(mark)  	
end
function HeroSoulUpgradePopView:updateAddHeroSoul(upgrandMark)
	for i=1,6 do
		local heroSoulNode = self._addPanle_t:getChildByName("heroSoul" .. tostring(i))
		local mark = HeroSoulData.heroSoulUpgradeData[i] 
		if  mark > 0 then
			Functions.getHeroSoulNodeOfMark(heroSoulNode,mark,function()
	                self:getController():openChildView("app.ui.popViews.HeroSoulPopView",{isRemove = false,
	                	name = "HeroSoulPopView2",
	                	data = {jumpType = JumpType.HeroSoulUpgradeToHeroSoulPop,
	                		jumpMark = upgrandMark,
	                		handler = function( )
	                	self:displayHeroSoulAtrr(upgrandMark)
	                end}})
	          end)
		else
			Functions.cleanHeroSoulNodeWithAdd(heroSoulNode,function()
                self:getController():openChildView("app.ui.popViews.HeroSoulPopView",{isRemove = false,
                	name = "HeroSoulPopView2",
                	data = {jumpType = JumpType.HeroSoulUpgradeToHeroSoulPop,
                	jumpMark = upgrandMark,
                	handler = function( )
                		self:displayHeroSoulAtrr(upgrandMark)
                	end}})
          	end)
		end
	end
end
function HeroSoulUpgradePopView:playAddHeroSoulAction(ids)
	for i = 1,#ids do 
		if ids[i] > 0 then 
			local heroSoulNode = self._addPanle_t:getChildByName("heroSoul" .. tostring(i))
			local animationSprite = cc.Sprite:create()
            local img = ConfigHandler:getHeroSoulImageOfId(ids[i])
			Functions.loadImageWithSprite(animationSprite,img)

			heroSoulNode:addChild(animationSprite)
			local endWorldPos = self._mainHeroSoul_t:convertToWorldSpace({{x = self._mainHeroSoul_t:getPositionX(), y = self._mainHeroSoul_t:getPositionY()}})
			local endPos = heroSoulNode:convertToNodeSpaceAR(endWorldPos)
			local tempHandler = nil
			UIActionTool:playMoveActionWithEase({node = animationSprite,
					startPos = cc.p(heroSoulNode:getContentSize().width/2,heroSoulNode:getContentSize().height/2),
					endPos = endPos,
					easeType = EaseActionType.EaseSineIn,
					dur = 0.4,
					handler = function()
						animationSprite:removeFromParent()
					end
				})
		end
	end
end
function HeroSoulUpgradePopView:updateAttr(mark)
	local heroSoulInf = HeroSoulData:getHeroSoulInf(mark)
	local heroSoulName = ConfigHandler:getHeroSoulNameOfId(heroSoulInf.id)
	self._heroSoulName_t:setString(heroSoulName)
    self._levelPanel_t:getChildByName("Text_crad_level"):setString(tostring(heroSoulInf.level))
    self._levelPanel_t:getChildByName("heroSoulType"):setString(LanguageConfig["ui_heroSoul_" .. tostring(ConfigHandler:getHeroSoulTypeOfId(heroSoulInf.id))])
    local attrTypeTable = {LanguageConfig.ui_selectHero_3 .. ":",LanguageConfig.ui_selectHero_2 .. ":",
                            LanguageConfig.ui_selectHero_4 .. ":",LanguageConfig.ui_selectHero_5 ..":"
                            ,LanguageConfig.ui_selectHero_11 .. ":",LanguageConfig.ui_selectHero_12 .. ":"}
  	self._levelPanel_t:getChildByName("attrKey"):setString(attrTypeTable[ConfigHandler:getHeroSoulTypeOfId(heroSoulInf.id)])                           
  	
	
	local addExp = HeroSoulData:getHeroSoulUpgradeExp()
	self._Text_get_EXP_num_t:setString(tostring(addExp))
	local addedLevel = self:getAddedLevelOfAddExp(mark,addExp)
	self._levelPanel_t:getChildByName("Text_crad_up_level"):setString(tostring(addedLevel))
	self:setExpBar(mark,addExp)
	local afterValue = Functions.heroSoulAddAttrHandler(heroSoulInf.id, addedLevel)
	if ConfigHandler:getHeroSoulAtrrAddTypeOfId(heroSoulInf.id) == 2 then
  		self._levelPanel_t:getChildByName("afterValue"):setString("+" .. tostring(afterValue*100) .. "%")
  		self._levelPanel_t:getChildByName("beforeValue"):setString("+" .. tostring(HeroSoulData:getHeroSoulAttr(mark)*100) .. "%")
  	else
  		self._levelPanel_t:getChildByName("afterValue"):setString("+" .. tostring(afterValue*100))
  		self._levelPanel_t:getChildByName("beforeValue"):setString("+" .. tostring(HeroSoulData:getHeroSoulAttr(mark)*100))
  	end
end
function HeroSoulUpgradePopView:getAddedLevelOfAddExp(mark,addExp)
	local heroSoulInf = HeroSoulData:getHeroSoulInf(mark)
	local tatalExp = heroSoulInf.exp + addExp
	local needExp = 0
	if heroSoulInf.level > #g_jhcfg.levelExp then
		return #g_jhcfg.levelExp + 1
	end
	local countExp = 0
	for i = heroSoulInf.level,#g_jhcfg.levelExp + 1 do
		if i > #g_jhcfg.levelExp then 
			return  #g_jhcfg.levelExp + 1
		end
		countExp = countExp + g_jhcfg.levelExp[i]
		if  tatalExp < countExp  then
			return i 
		end
	end
	return heroSoulInf.level
end
function HeroSoulUpgradePopView:setExpBar(mark,addExp)
	local heroSoulInf = HeroSoulData:getHeroSoulInf(mark)
	local tatalExp = heroSoulInf.exp + addExp

	local addedLevel = self:getAddedLevelOfAddExp(mark,addExp)
	if addedLevel > heroSoulInf.level then 
		if addedLevel < #g_jhcfg.levelExp + 1 then 
			self._LoadingBar_2_t:setPercent(100)
			self._LoadingBar_1_t:setPercent(heroSoulInf.exp/g_jhcfg.levelExp[addedLevel]*100)
		else
			self._LoadingBar_2_t:setPercent(100)
			self._LoadingBar_1_t:setPercent(100)
		end
	else
		if addedLevel < #g_jhcfg.levelExp + 1 then 
			self._LoadingBar_2_t:setPercent(tatalExp/g_jhcfg.levelExp[addedLevel]*100)
			self._LoadingBar_1_t:setPercent(heroSoulInf.exp/g_jhcfg.levelExp[addedLevel]*100)
		else
			self._LoadingBar_2_t:setPercent(0)
			self._LoadingBar_1_t:setPercent(0)
		end
	end
	
end
return HeroSoulUpgradePopView