--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SweepCompletePopView = class("SweepCompletePopView", BasePopView)

local Functions = require("app.common.Functions")

SweepCompletePopView.csbResPath = "tyj/csb"
SweepCompletePopView.debug = true
SweepCompletePopView.studioSpriteFrames = {"SweepCompletePopUI","CBO_sweepResults" }
--@auto code head end

SweepCompletePopView.spriteFrameNames = 
    {
    }
--@auto code uiInit
--add spriteFrames
if #SweepCompletePopView.studioSpriteFrames > 0 then
    SweepCompletePopView.spriteFrameNames = SweepCompletePopView.spriteFrameNames or {}
    table.insertto(SweepCompletePopView.spriteFrameNames, SweepCompletePopView.studioSpriteFrames)
end
function SweepCompletePopView:onInitUI()

    --output list
    self._title_t = self.csbNode:getChildByName("Panel_1"):getChildByName("bg"):getChildByName("title")
	self._listView_t = self.csbNode:getChildByName("Panel_1"):getChildByName("listView")
	
    --label list
    
    --button list
    self._okBt_t = self.csbNode:getChildByName("Panel_1"):getChildByName("okBt")
	self._okBt_t:onTouch(Functions.createClickListener(handler(self, self.onOkbtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Okbt btFunc
function SweepCompletePopView:onOkbtClick()
    Functions.printInfo(self.debug,"Okbt button is click!")

    local controller = self:getController()
    if self.lvlCh ~= nil then
        if self.lvlCh.old < self.lvlCh.new  then
            controller:openChildView("app.ui.popViews.LevelUpPopView", { isRemove = false, data = { oldLevel = self.lvlCh.old,
             newLevel =  self.lvlCh.new, upLevelAward = self.upLevelAward } })
        end
    end

    if self.handler ~=  nil then 
        self.handler()
    else
        controller:closeChildView("SweepPopView")
    end    
    controller:closeChildView(self)

end
--@auto code Okbt btFunc end

--@auto button backcall end


--@auto code output func
function SweepCompletePopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
	-- Functions.playScaleOpenChildViewAction(self)
end

function SweepCompletePopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	--local data = {{coin = 100,exp = 200,soul = 300},{coin = 101,exp = 201,soul = 301},{coin = 102,exp = 202,soul = 302}}
	
    self.handler = data.handler
    self._sweepSucOkBt_t = self._okBt_t
    self.lvlCh = data.lvlCh 
    self.upLevelAward = data.upLevelAward
    data = data.prizeTabel
    table.insert(data, {})
    if self.handler ~= nil then 
        Functions.loadImageWithWidget(self._title_t,"tyj/uiFonts_res/xzjs.png")
        -- local prizePanel = self._listView_t:getChildByName("model"):getChildByName("rewardPanel")
        -- prizePanel:getChildByName("expLabel"):setVisible(false)
        -- prizePanel:getChildByName("expIcon"):setVisible(false)
        -- prizePanel:getChildByName("coinLabel"):setPositionX(120)
    else
        Functions.loadImageWithWidget(self._title_t,"tyj/uiFonts_res/sdjs.png")
        self._title_t:ignoreContentAdaptWithSize(true)
    end
    local handler = function(index,widget,data,model )
        if not table.empty(data) then
            local coin = widget:getChildByName("rewardPanel"):getChildByName("coinLabel")
            Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("coinLabel"),widget:getChildByName("rewardPanel"):getChildByName("coinLabel"))
            coin:setString(tostring(data.coin))
            if data.exp ~= nil then 
                local exp = widget:getChildByName("rewardPanel"):getChildByName("expLabel")
                Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("expLabel"),widget:getChildByName("rewardPanel"):getChildByName("expLabel"))
                exp:setString(tostring(data.exp))
            else
                 widget:getChildByName("rewardPanel"):getChildByName("expLabel"):setVisible(false)
                 widget:getChildByName("rewardPanel"):getChildByName("expIcon"):setVisible(false)
                 coin:setPositionX(160)
                 widget:getChildByName("rewardPanel"):getChildByName("coinIcon"):setPositionX(120)
            end
            -- self._expLoadingBar_t:setPercent(oldExp/g_roleUplevelExp[PlayerData.eventAttr.m_level]*100)
            -- exp:setString(tostring(oldExp) .. "/" .. tostring(g_roleUplevelExp[PlayerData.eventAttr.m_level]))
            if data.soul ~= nil then 
                local soul = widget:getChildByName("rewardPanel"):getChildByName("soulLabel")
                Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("soulLabel"),widget:getChildByName("rewardPanel"):getChildByName("soulLabel"))
                soul:setString(tostring(data.soul))
            elseif data.hunjing ~= nil then
                local hunjing = widget:getChildByName("rewardPanel"):getChildByName("soulLabel")
                Functions.loadImageWithWidget(widget:getChildByName("rewardPanel"):getChildByName("soulIcon"),"commonUI/res/image/hunjin.png")
                widget:getChildByName("rewardPanel"):getChildByName("soulIcon"):ignoreContentAdaptWithSize(true)
                Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("soulLabel"),widget:getChildByName("rewardPanel"):getChildByName("soulLabel"))
                hunjing:setString(tostring(data.hunjing))
            else
                widget:getChildByName("rewardPanel"):getChildByName("soulLabel"):setVisible(false)
                widget:getChildByName("rewardPanel"):getChildByName("soulIcon"):setVisible(false)
            end


            local indexLabel = widget:getChildByName("rewardPanel"):getChildByName("indexLabel")
            indexLabel:setString(tostring(index))
            Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("indexLabel"),widget:getChildByName("rewardPanel"):getChildByName("indexLabel"))
            local tipsLabel = widget:getChildByName("rewardPanel"):getChildByName("prizePanel"):getChildByName("tipsLabel")
            tipsLabel:setString(LanguageConfig.language_4_17)
            Functions.initTextColor(model:getChildByName("rewardPanel"):getChildByName("prizePanel"):getChildByName("tipsLabel"),widget:getChildByName("rewardPanel"):getChildByName("prizePanel"):getChildByName("tipsLabel"))
            if not table.empty(data.prize) then
                local tips = widget:getChildByName("rewardPanel"):getChildByName("prizePanel"):getChildByName("tipsLabel"):setVisible(false)
                local prizePanel = widget:getChildByName("rewardPanel"):getChildByName("prizePanel")  

                local itmes = Functions.rewardDataHandler(data.prize)              
                for i=1, #itmes do                  
                       --初始化掉落物显示相关参数
                    local prizeNode = prizePanel:getChildByName("prizeNode")
                    local prizeNode1 = prizePanel:getChildByName("prizeNode1")
                    local awardItemDistance = prizeNode1:getPositionX() - prizeNode:getPositionX()
                    local awardFirstPos = { x = prizeNode:getPositionX(), y = prizeNode:getPositionY() }
                    local awardItemScale = prizeNode:getScale()
                    local disNode = Functions.createPartNode({ nodeId = itmes[i].id, nodeType = itmes[i].type,count = itmes[i].count })
                    disNode:setTag(i)  
                    disNode:setVisible(false)
                    if disNode ~= nil then                      
                        local pos = { x = awardFirstPos.x + awardItemDistance*(i-1), y = awardFirstPos.y }
                        disNode:setScale(awardItemScale)
                        disNode:setPosition(pos)
                        prizePanel:addChild(disNode)
                    end
                end
            end
        else
            widget:getChildByName("completePanel"):setVisible(true)
            --widget:getChildByName("rewardPanel"):setVisible(false)
        end
    end
	Functions.bindListWithData( self._listView_t, data, handler)
	local innerContainer = self._listView_t:getInnerContainer()

    local playPrizeAction  --播放掉落物动画
    playPrizeAction = function(prizeTable,prizeNum)
        if prizeNum == 0 then
            return 
        end
        prizeTable[#prizeTable - prizeNum + 1]:setVisible(true) 
        prizeTable[#prizeTable - prizeNum + 1]:setScale(4)
        local scaleTo = cc.ScaleTo:create(0.3, 0.6)
        local easeAction = cc.EaseBackOut:create(scaleTo) 
        local play = cc.Sequence:create({easeAction, cc.CallFunc:create(function() playPrizeAction(prizeTable,prizeNum-1)end)})
        transition.execute(prizeTable[#prizeTable - prizeNum + 1],play)
    end


    local totalNum = #data --总共扫荡多少次
    local playItemAction
    playItemAction = function(itemTable,prizeNumTable,itemNum)
	    if itemNum == 0 then 
	       return
	    end 
        itemTable[#itemTable - itemNum + 1]:setVisible(true)
        local rewardPanel = itemTable[#itemTable - itemNum + 1]:getChildByName("rewardPanel")
        rewardPanel:setVisible(true) 
        --面板向左滑动动作
        local x = rewardPanel:getPositionX()
        rewardPanel:setPositionX(x+275)
        local moveBy = cc.MoveBy:create(0.3,cc.p(-275,0))
        local play = cc.Sequence:create({moveBy}) 
        local easeAction = cc.EaseBackOut:create(moveBy) 
        --物品掉落动作
        local prizeTable = {}
        if prizeNumTable[#itemTable - itemNum + 1] > 0  then
            for i = 1, prizeNumTable[#itemTable - itemNum + 1] do             
                prizeTable[#prizeTable+1] = rewardPanel:getChildByName("prizePanel"):getChildByTag(i)
            end 
        else
            prizeTable[#prizeTable+1] = rewardPanel:getChildByName("prizePanel"):getChildByName("tipsLabel")
        end
        
        play = cc.Sequence:create({easeAction,cc.CallFunc:create(function() playPrizeAction(prizeTable,#prizeTable) end)})
        if totalNum > 2 then 
            local moveContainer = cc.MoveBy:create(0.3,cc.p(0,160))
            local easeActionContainer = cc.EaseBackOut:create(moveContainer) 
            local play2 = cc.Sequence:create({cc.DelayTime:create(0.3*(#prizeTable+2)),easeActionContainer})  
            transition.execute(innerContainer,play2)  
        end
        
        local play2= cc.Sequence:create({play,cc.DelayTime:create(0.3*(#prizeTable+2)),cc.CallFunc:create(function() playItemAction(itemTable,prizeNumTable,itemNum - 1) end)})
        transition.execute(rewardPanel,play2)
	end

    local itemTable = {}
    local prizeNumTable = {}
	for i = 1,#data-1 do 
        itemTable[#itemTable + 1] = self._listView_t:getItem(i-1)
        prizeNumTable[#prizeNumTable + 1] = #data[i].prize
	end
	-- if #itemTable > 2 then
        playItemAction(itemTable,prizeNumTable,#itemTable)
    -- end
end

function SweepCompletePopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

return SweepCompletePopView