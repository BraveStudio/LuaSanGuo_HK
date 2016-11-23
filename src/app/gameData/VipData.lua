local BaseModel = require("app.baseMVC.BaseModel")

local VipData = class("VipData", BaseModel)

VipData.debug = false
VipData.eventAttr = {}
VipData.eventAttr.m_vipLevel = 0 --当前玩家Vip等级
VipData.eventAttr.m_recharge = 0 --当前玩家Vip累计充值金额
VipData.eventAttr.m_vipReward = {} --当前玩家Vip等级礼包领取状态 0--未领取，1--已领取
VipData.eventAttr.m_monthday = 0  --当前月卡剩余天数
VipData.eventAttr.vipRewardFlag = 0   --vip领奖：是否有奖可领 1/0
VipData.eventAttr.m_vipFirstFlag = 0   --vip首充标示：是否有奖可领 1/0
VipData.eventAttr.firstRaward = {}   --vip首充奖品配置
VipData.eventAttr.payMoney = 0   --vip首充奖品价值

--测试数据 千万记得各平台同步
VipData.eventAttr.payActivity = nil


function VipData:init()
    self.super.init(self)
    local onVipInit = function(event)
        local data = event.data
        for k, v in pairs(data) do
            self.eventAttr[k] = v
        end 
        self:updateVipRewardFlag()   
    end
    NetWork:addNetWorkListener({ 2, 16 }, onVipInit)

    Functions.callAnySdkFuc(function( )
        local onServerRequest = function (event)
            PlayerData.eventAttr.firstbl = event.firstbl
            GameEventCenter:dispatchEvent({ name = "PAY_ACTIVITY"})
            for i = VipData.eventAttr.m_vipLevel+1, event.vipLevel do
                VipData.eventAttr.m_vipReward[i+1] = true
            end
            VipData.eventAttr.m_vipLevel = event.vipLevel
            VipData.eventAttr.m_recharge = event.recharge
            PlayerData.eventAttr.m_gold = event.gold    
            PlayerData.eventAttr.m_vipFirstFlag = event.firstFlag
            self:updateVipRewardFlag()    
            Analytics:onChargeSuccess()
            GameState.storeAttr.curNonce_s = ""
            GameState.storeAttr.paymentSeq_s = ""
            GameState.storeAttr.curProductCode_s = ""
            
            local tipsStr = string.format(LanguageConfig.language_task_speaker_12,event.curPayGold)
            PromptManager:openSpeakerPrompt(tipsStr,nil,LanguageConfig.language_task_15)
        end
        NetWork:addNetWorkListener({25,2}, Functions.createNetworkListener(onServerRequest, false, "ret")) 
    end)
end
--发送是否可购买月卡接口
function VipData:requestIsBuyMonthCard(handler)
   --监听服务器数据
    local onServerRequest = function (event)
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({25,7}, Functions.createNetworkListener(onServerRequest, true, "ret"))
    local msg = {idx = {25, 7}}
    NetWork:sendToServer(msg)
end
--发送vip等级领奖请求
function VipData:RequestVipLevelReward(curVipLevel,handler)
    --监听服务器数据
    local onServerRequest = function (event)
        VipData.eventAttr.m_vipReward[curVipLevel+1] = false
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({25,1}, Functions.createNetworkListener(onServerRequest, true, "ret"))
    local msg = {idx = {25, 1},curVipLevel = curVipLevel}
    NetWork:sendToServer(msg)
end
function VipData:buyMonthCard()
    self:requestIsBuyMonthCard(function( )
          local data = g_payProductConfig_Anysdk[5]
          Functions.setAdbrixTag("retension","gold_recharging_inter")  
          Functions.callJavaFuc(function()
              PromptManager:openHttpLinkPrompt() 
              NativeUtil:javaCallHanler({command = "pay",productCode = data.productCode,productName = data.productName})
           end)
          Functions.callAnySdkFuc(function( )
                PromptManager:openHttpLinkPrompt()
                PluginChannel:pay(5,data)
           end)                
     end) 
end
--发送充值请求
function VipData:RequestVipPay(nonce,paymentSeq,productCode,handler,isResend)
    --监听服务器数据
    local onServerRequest = function (event)
        PlayerData.eventAttr.firstbl = event.firstbl
        for i = VipData.eventAttr.m_vipLevel+1, event.vipLevel do
            VipData.eventAttr.m_vipReward[i+1] = true
        end
        VipData.eventAttr.m_vipLevel = event.vipLevel
        VipData.eventAttr.m_recharge = event.recharge
        PlayerData.eventAttr.m_gold = event.gold    
        PlayerData.eventAttr.m_vipFirstFlag = event.firstFlag
        VipData:updateVipRewardFlag()     


        for i = 1,#g_payProductConfig_Nstore do 
            if event.productCode == g_payProductConfig_Nstore[i].productCode then
                Functions.setAdbrixTag("buy",tostring(g_payProductConfig_Nstore[i].money),tostring(PlayerData.eventAttr.m_level))  
            end
        end 
        GameState.storeAttr.curNonce_s = ""
        GameState.storeAttr.paymentSeq_s = ""
        GameState.storeAttr.curProductCode_s = ""
        
        local tipsStr = string.format(LanguageConfig.language_task_speaker_12,event.curPayGold)
        PromptManager:openSpeakerPrompt(tipsStr,nil,LanguageConfig.language_task_15)

        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({25,2}, Functions.createNetworkListener(onServerRequest, true, "ret")) 

    local msg = {idx = {25, 2},payType = G_SDKType,nonce = nonce,paymentSeq = paymentSeq,productCode = productCode,isResend = isResend}
    NetWork:sendToServer(msg)
  
end

function VipData:needToConsumProduct()
    Functions.callJavaFuc(function( )
        if GameState.storeAttr.curProductCode_s ~= "" then 
            VipData:RequestVipPay(GameState.storeAttr.curNonce_s ,GameState.storeAttr.paymentSeq_s ,GameState.storeAttr.curProductCode_s,nil,true)
        end 
    end)    
end


--更新可领取礼包状态
function VipData:updateVipRewardFlag()
    for i = 0,VipData.eventAttr.m_vipLevel do
        if VipData.eventAttr.m_vipReward[i+1] then
            VipData.eventAttr.vipRewardFlag = 1
            return
        end 
    end
    VipData.eventAttr.vipRewardFlag = 0
end
return VipData