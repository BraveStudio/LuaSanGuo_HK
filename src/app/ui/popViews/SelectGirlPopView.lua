--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SelectGirlPopView = class("SelectGirlPopView", BasePopView)

local Functions = require("app.common.Functions")

SelectGirlPopView.csbResPath = "tyj/csb"
SelectGirlPopView.debug = true
SelectGirlPopView.studioSpriteFrames = {"SelectGirl" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #SelectGirlPopView.studioSpriteFrames > 0 then
    SelectGirlPopView.spriteFrameNames = SelectGirlPopView.spriteFrameNames or {}
    table.insertto(SelectGirlPopView.spriteFrameNames, SelectGirlPopView.studioSpriteFrames)
end
function SelectGirlPopView:onInitUI()

    --output list
    self._activityTimeOut_t = self.csbNode:getChildByName("Panel_140"):getChildByName("activityTimeOut")
	self._inf_t = self.csbNode:getChildByName("Panel_140"):getChildByName("inf")
	self._titleOnePanel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleOnePanel")
	self._selectLevel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleOnePanel"):getChildByName("selectLevel")
	self._needGold_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleOnePanel"):getChildByName("needGold")
	self._gold_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleOnePanel"):getChildByName("gold")
	self._titleTwoPanel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleTwoPanel")
	self._title_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Image_15"):getChildByName("titleTwoPanel"):getChildByName("title")
	self._cardPanel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("cardPanel")
	self._rankPanel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("rankPanel")
	
    --label list
    self._Text_29_t = self.csbNode:getChildByName("Panel_140"):getChildByName("Text_29")
	self._Text_29_t:setString(LanguageConfig.ui_activityHero_1)

	self._activityTime_t = self.csbNode:getChildByName("Panel_140"):getChildByName("activityTime")
	self._activityTime_t:setString(LanguageConfig.ui_activityHero_1)
    --button list
    self._closeBt_t = self.csbNode:getChildByName("Panel_140"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))

	self._resetBt_t = self.csbNode:getChildByName("Panel_140"):getChildByName("resetBt")
	self._resetBt_t:onTouch(Functions.createClickListener(handler(self, self.onResetbtClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Resetbt btFunc
function SelectGirlPopView:onResetbtClick()
    Functions.printInfo(self.debug,"Resetbt button is click!")
    local title = string.format("是否花费%s元宝重置选秀？",ActivityData.selectGirl.sg_resetGold)
    NoticeManager:openTips(GameCtlManager:getCurrentController(), {title = title,handler = function( )
    	ActivityData:requestResetSelectGirl(handler(self,self.updateGirlRes))
    end})
end
--@auto code Resetbt btFunc end

--@auto code Closebt btFunc
function SelectGirlPopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    self:close()
end
--@auto code Closebt btFunc end

--@auto button backcall end


--@auto code output func
function SelectGirlPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
end

function SelectGirlPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
end

function SelectGirlPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
	self:initDisplay()
end
--@auto code output func end
function SelectGirlPopView:initDisplay()
	--活动时间
	self:setActivityTime()
	--活动倒计时
	self:setActivityTimeOut( )
	Functions.bindUiWithModelAttr(self._activityTimeOut_t, ActivityData, "sg_activityTimeout",function(event)
        local sTime = TimerManager:format_time(math.floor(event.data),LanguageConfig.language_activity_2)
	   	self._activityTimeOut_t:setString(sTime)
	end)
	--活动描述
	self._inf_t:setString(ActivityData.selectGirl.sg_inf)
	--活动轮数
	self._selectLevel_t:setString(string.format("當前為第%s輪，本輪選秀需要：",ActivityData.eventAttr.sg_curLevel))
	if ActivityData.eventAttr.sg_curLevel > g_xmcfg.maxCount then 
		self._selectLevel_t:setString("该批秀女投票投票次数已满，换一批试试")
		self._needGold_t:setVisible(false)
		self._gold_t:setVisible(false)
	else
		self._selectLevel_t:setString(string.format("當前為第%s輪，本輪選秀需要：",ActivityData.eventAttr.sg_curLevel ))
		self._needGold_t:setVisible(true)
		self._gold_t:setVisible(true)
	end
	Functions.bindUiWithModelAttr(self._selectLevel_t, ActivityData, "sg_curLevel",function(event)
		if event.data > g_xmcfg.maxCount then 
			self._selectLevel_t:setString("该批秀女投票投票次数已满，换一批试试")
			self._needGold_t:setVisible(false)
			self._gold_t:setVisible(false)
		else
			self._selectLevel_t:setString(string.format("當前為第%s輪，本輪選秀需要：",event.data))
			self._needGold_t:setVisible(true)
			self._gold_t:setVisible(true)
		end
	end)
	--需要元宝
	self._needGold_t:setString(tostring(ActivityData.eventAttr.sg_curNeedGold))
	Functions.bindUiWithModelAttr(self._needGold_t, ActivityData, "sg_curNeedGold")
	self:bindSelectGirlBt()
	self:setShowStyle()
	Functions.bindUiWithModelAttr(self.csbNode, ActivityData, "sg_isOpneSelectGirl",function(event)
		self:setActivityTime()
		self:setActivityTimeOut()
		self:bindSelectGirlBt()
		self:setShowStyle()
	end)
end
function SelectGirlPopView:setActivityTime()
	if ActivityData.eventAttr.sg_isOpneSelectGirl then
		self._activityTime_t:setString(tostring(ActivityData.selectGirl.sg_activityStartTime[1]) .. "." ..
						   tostring(ActivityData.selectGirl.sg_activityStartTime[2]) .. "." ..
						   tostring(ActivityData.selectGirl.sg_activityStartTime[3]) .. "至" ..
						   tostring(ActivityData.selectGirl.sg_activityEndTime[1]) .. "." ..
						   tostring(ActivityData.selectGirl.sg_activityEndTime[2]) .. "." ..
						   tostring(ActivityData.selectGirl.sg_activityEndTime[3])
						  )
	else
		self._activityTime_t:setString("活动已结束")
	end
end
function SelectGirlPopView:setActivityTimeOut( )
	if ActivityData.eventAttr.sg_isOpneSelectGirl then
		local time = TimerManager:format_time(math.floor(ActivityData.eventAttr.sg_activityTimeout),LanguageConfig.language_activity_2)
		self._activityTimeOut_t:setString(time)
	else
		self._activityTimeOut_t:setString("活动已结束")
	end
end
function SelectGirlPopView:bindSelectGirlBt()
	if ActivityData.eventAttr.sg_isOpneSelectGirl then
		for i=1,4 do
			local girlButton = self._cardPanel_t:getChildByName("girlBt_" .. tostring(i))
			self:updateGirlRes()
			girlButton:onTouch(Functions.createClickListener(function()
				ActivityData:RequestSelectGirl(i,function( )
					
				end)
			end, "zoom"))
		end
	else
		for i=1,4 do
			local girlButton = self._cardPanel_t:getChildByName("girlBt_" .. tostring(i))
			self:updateGirlRes()
			girlButton:onTouch(Functions.createClickListener(function()
				GameCtlManager:getCurrentController():openChildView("app.ui.popViews.SelectGirlRankPopView",{isRemove = false,data={girlMark = i}})
			end, "zoom"))
		end
	end
end
function SelectGirlPopView:updateGirlRes()
	for i=1,4 do
		local girlButton = self._cardPanel_t:getChildByName("girlBt_" .. tostring(i))
		local girlImg = girlButton:getChildByName("Image")
		local girlName = girlButton:getChildByName("name")
		girlImg:ignoreContentAdaptWithSize(true)
		Functions.loadImageWithWidget(girlImg, string.format("girl/%s.png",ActivityData.selectGirl.sg_girlIds[i]))
		girlName:setString(g_xmcfg.girlName[ActivityData.selectGirl.sg_girlIds[i]])
	end
end
function SelectGirlPopView:setShowStyle()
	if ActivityData.eventAttr.sg_isOpneSelectGirl then 
		self._titleOnePanel_t:setVisible(true)
		self._titleTwoPanel_t:setVisible(false)
		self._resetBt_t:setVisible(true)
		self._rankPanel_t:setVisible(false)
	else
		self._titleOnePanel_t:setVisible(false)
		self._titleTwoPanel_t:setVisible(true)
		self._resetBt_t:setVisible(false)
		self._rankPanel_t:setVisible(true)
	end
end
return SelectGirlPopView