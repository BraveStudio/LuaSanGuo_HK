local BaseModel = require("app.baseMVC.BaseModel")

local HeroKillData = class("HeroKillData", BaseModel)

HeroKillData.debug = false

HeroKillData.UPDATE_PRIZE = "UPDATE_PRIZE"

function HeroKillData:init()

    --  diff                大关卡信息
    --  everyFlag           大关卡是否领取的标志(0 不能领 1 可以领 2 领过了) 
    --  starFlag1           关卡获得星星数能否领取的标志（例如6星，得到总星数的半数）
    --  starFlag2           关卡获得星星数能否领取的标志（例如12星，得到总星数）
    --starReward1           达到少量星星时的奖励
    --starReward2           达到大量星星时的奖励 
    --  count               每日小关卡通过的次数  
    --  star                小关卡通过的星数
    --everyReward           大关卡每日奖励
    --name                  大关卡名字
    
    --建筑信息
    local onInfo = function(event)

        self.HeroKillData = event.data

    end
    NetWork:addNetWorkListener({ 2, 28 }, onInfo)

end

function HeroKillData:sendPrize(id, listener)
    --监听服务器数据
    local onServerRequest = function (event)
    
        local prize = event.data
        for k, v in pairs(prize) do
            local data = {id = v[1], type = v[2], count = v[3], slot = v[4] }
            Functions:addItemResources( data )
            --领取状态改变
            HeroKillData:getHeroKillData()[id].everyFlag = 2
            if v[1] == -3 then
                local str = string.format(LanguageConfig.language_cjrenwu_51, v[3])
                PromptManager:openTipPrompt(str)
            end
            
        end
        listener()
    end
    NetWork:addNetWorkListener({29, 1}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {29, 1}, pass = id}
    NetWork:sendToServer(msg)
end

function HeroKillData:sendStarPrize(id, type, listener)
    --监听服务器数据
    local onServerRequest = function (event)

        local prize = event.data
        for k, v in pairs(prize) do
            local data = {id = v[1], type = v[2], count = v[3], slot = v[4] }
            Functions:addItemResources( data )
            --领取状态改变
            if type == 1 then
                HeroKillData:getHeroKillData()[id].starFlag1 = 2
            else
                HeroKillData:getHeroKillData()[id].starFlag2 = 2
            end
            if v[2] == -3 then
                local str = string.format(LanguageConfig.language_cjrenwu_51, v[3])
                PromptManager:openTipPrompt(str)
            end
        end
        listener()
    end
    NetWork:addNetWorkListener({29, 2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {29, 2}, pass = id, index = type }
    NetWork:sendToServer(msg)
end


function HeroKillData:getHeroKillData()
    return self.HeroKillData
end

return HeroKillData