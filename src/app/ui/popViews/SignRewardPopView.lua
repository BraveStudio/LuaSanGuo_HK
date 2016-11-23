--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SignRewardPopView = class("SignRewardPopView", BasePopView)

local Functions = require("app.common.Functions")

SignRewardPopView.csbResPath = "tyj/csb"
SignRewardPopView.debug = true
SignRewardPopView.studioSpriteFrames = {"SignRewardPopUI","SignRewardPopUI_Text" }
--@auto code head end
SignRewardPopView.spriteFrameNames = 
    {
    }

SignRewardPopView.animaNames = 
    {
    }

--@auto code uiInit
--add spriteFrames
if #SignRewardPopView.studioSpriteFrames > 0 then
    SignRewardPopView.spriteFrameNames = SignRewardPopView.spriteFrameNames or {}
    table.insertto(SignRewardPopView.spriteFrameNames, SignRewardPopView.studioSpriteFrames)
end
function SignRewardPopView:onInitUI()

    --output list
    self._signPrizePanel_t = self.csbNode:getChildByName("signPrizePanel")
	self._ListView_t = self.csbNode:getChildByName("signPrizePanel"):getChildByName("ListView")
	
    --label list
    
    --button list
    self._closeBt_t = self.csbNode:getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Closebt btFunc
function SignRewardPopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    self:close()
end
--@auto code Closebt btFunc end

--@auto button backcall end


--@auto code output func
function SignRewardPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function SignRewardPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
    Functions.setPopupKey("sign_in")
    self:initPrizeList(self._signPrizePanel_t,g_SampleCfg.NewReward,RewardStateData.rewardState)

--    self._prizeBt_t = self._signPrizePanel_t:getChildByTag(1):getChildByName("bg")
end

function SignRewardPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

--custom code start
function SignRewardPopView:initPrizeList(prizePanel,prizeData,prizeStateData)
 
    local listHandler = function(index,widget,data,model)
        for j=1,3 do
            local prizeNode = widget:getChildByName("prize" .. tostring(j))
            local prize = prizeNode:getChildByName("prize")
            local prizeCntLabel = prizeNode:getChildByName("prizeCntLabel")
            prizeCntLabel:setString("x" .. tostring(data[j][3]))
            --  prize:ignoreContentAdaptWithSize(true)
            --  local prizeCnt = widget:getChildByName("prize" .. tostring(j) .. "Cnt")
            --  prizeCnt:setString("x" .. tostring(data[j][3]))

            if data[j][2] == 1 then
                local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[j][1]) 
                -- prize:ignoreContentAdaptWithSize(true)
                Functions.loadImageWithWidget(prize, heroHeadImg)
            elseif data[j][2] == 5 then
                local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[j][1]) 
                -- prize:ignoreContentAdaptWithSize(true)
                prize:setScale(0.85)
                prizeNode:getChildByName("piece"):setVisible(true)
                Functions.loadImageWithWidget(prize, heroHeadImg)
            elseif data[j][2] == 4 and data[j][1] > 0 then
                local propImg = ConfigHandler:getPropImageOfId(data[j][1])  
                prize:ignoreContentAdaptWithSize(true)  
                prize:setScale(0.8)         
                Functions.loadImageWithWidget(prize, propImg)
            elseif data[j][2] == 4 and data[j][1] == -3 then
                Functions.loadImageWithWidget(prize, "property_money.png")
            elseif data[j][2] == 4 and data[j][1] == -2 then
                prize:setScale(0.8)
                Functions.loadImageWithWidget(prize, "property_gold.png")
            elseif data[j][2] == 4 and data[j][1] == -5 then
                Functions.loadImageWithWidget(prize, "property_soul.png")
            elseif data[j][2] == 4 and data[j][1] == -6 then    
                Functions.loadImageWithWidget(prize, "property_soulCrystal.png")
            end

            prize:onTouch(Functions.createClickListener(handler(prize, function()
                PromptManager:openInfPrompt({type = data[j][2],id = data[j][1],target = prize})
            end), ""))
        end

        widget:getChildByName("dayNum"):setString(tostring(index))
        
        local mask = widget:getChildByName("mask")
        local done = widget:getChildByName("done")
        local choose = widget:getChildByName("choose")
        local prize = widget:getChildByName("bg")

        if index == prizeStateData.m_keepLoginDay and  prizeStateData.m_loginReward == 1 then
            mask:setVisible(true)
            done:setVisible(true)
            choose:setVisible(true) 
            prize:setTouchEnabled(false)
        elseif  index < prizeStateData.m_keepLoginDay and  prizeStateData.m_loginReward == 1 then
            mask:setVisible(true)
            done:setVisible(true)
            prize:setTouchEnabled(false)
        elseif index < prizeStateData.m_keepLoginDay then
             mask:setVisible(true) 
             done:setVisible(true)
             prize:setTouchEnabled(false)
        elseif index == prizeStateData.m_keepLoginDay and prizeStateData.m_loginReward ~= 1 then --当前可领取状态
            choose:setVisible(true) 
            prize:setTouchEnabled(true)
        end
        local onPrizeClick = function()
            local handler = function(event)
                Functions.playSound("getrewards.mp3")
                mask:setVisible(true)
                done:setVisible(true)
                prize:setTouchEnabled(false)   
                prizeStateData.m_loginReward = 1    
                Functions:addItemResources({id = data[1][1],type = data[1][2],count = data[1][3],slot = event.rettbl[1]})
                Functions:addItemResources({id = data[2][1],type = data[2][2],count = data[2][3],slot = event.rettbl[2]})
                Functions:addItemResources({id = data[3][1],type = data[3][2],count = data[3][3],slot = event.rettbl[3]})
                RewardStateData.eventAttr.signRewardFlag = 0   --签到领奖：是否有奖可领 1/0
            end
            RewardData:RequestSignReward(handler)
        end
        prize:onTouch(Functions.createClickListener(handler(prize, onPrizeClick), ""))
        if index == 1 then 
            self._prizeBt_t = widget:getChildByName("bg")
        end
    end
    Functions.bindListWithData(self._ListView_t, prizeData, listHandler)
--    self._ListView_t:jumpToItem(10,cc.p(0,1),cc.p(0,0))

    local dayCnt = prizePanel:getChildByName("dayCnt")
    dayCnt:setString(tostring(prizeStateData.m_keepLoginDay))
end
--custom code end
return SignRewardPopView