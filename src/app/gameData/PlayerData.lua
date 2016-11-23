local BaseModel = require("app.baseMVC.BaseModel")

local PlayerData = class("PlayerData", BaseModel)

PlayerData.debug = false

--事件属性
PlayerData.eventAttr = {}

PlayerData.eventAttr.m_uid = 0 
PlayerData.eventAttr.m_name = 0
PlayerData.eventAttr.m_imgID = 0
PlayerData.eventAttr.m_sex = 0
PlayerData.eventAttr.m_introMain = 0 --新手教程步数
PlayerData.eventAttr.m_introSec = 0
PlayerData.eventAttr.m_guideStageId = 0 --新手引导状态
PlayerData.eventAttr.m_newGuildIndex = 0   --新手引导id
PlayerData.eventAttr.m_level = 0
PlayerData.eventAttr.m_exp = 0
PlayerData.eventAttr.m_gold = 0
PlayerData.eventAttr.m_money = 0
PlayerData.eventAttr.m_energy = 0  --剩余体力
PlayerData.eventAttr.m_buyEnergyCount = 0 --体力购买次数
PlayerData.eventAttr.m_passResetCount = 0 --精英关卡重置次数
PlayerData.eventAttr.m_energyEx = 0 --额外体力值上限
PlayerData.eventAttr.m_energyTime = 0 --上次体力值维护时间
PlayerData.eventAttr.m_fightStrength = 0 --战斗力
PlayerData.eventAttr.m_recharge = 0 --充值金额
PlayerData.eventAttr.m_soul = 0 --武魂
PlayerData.eventAttr.m_hunjing = 0 --魂晶
PlayerData.eventAttr.m_tongID = 0 --工会id
PlayerData.eventAttr.energyPrice = 0 --当前体力购买价格
PlayerData.eventAttr.m_actRechargeFlag = {}
PlayerData.eventAttr.m_buyMoneyCount = 0 --钱币购买次数
PlayerData.eventAttr.m_serverTime = 0 
PlayerData.eventAttr.m_curBagSize = 40 --当前玩家道具背包数量
PlayerData.eventAttr.m_curEquipmentBagSize = 100 --当前玩家装备背包数量
PlayerData.eventAttr.m_freeChatCnt = 0 --世界聊天免费次数
PlayerData.eventAttr.m_vipFirstFlag = 0   --vip首充标示：是否有奖可领 1/0
PlayerData.eventAttr.firstbl = {}   --是否显示首次奖励 0 显示 1 不显示
PlayerData.eventAttr.m_nengliang = 0 --玩家能量
PlayerData.eventAttr.m_actif = 0 --玩家贡献
PlayerData.eventAttr.m_camp = 0 --国家id
PlayerData.eventAttr.m_fenglu = 0 --俸禄
PlayerData.eventAttr.day = 0 --当前狂欢的xx天
PlayerData.eventAttr.et = 0 --七日狂欢活动的结束时间

PlayerData.eventAttr.jrth_st = 0 --节日狂欢活动的开始时间（节日特惠）
PlayerData.eventAttr.jrth_et = 0 --节日狂欢活动的结束时间
PlayerData.eventAttr.xffl_st = 0 --节日狂欢活动的开始时间（消费返利）
PlayerData.eventAttr.xffl_et = 0 --节日狂欢活动的结束时间
PlayerData.eventAttr.zhzb_st = 0 --节日狂欢活动的开始时间（诸候争霸）
PlayerData.eventAttr.zhzb_et = 0 --节日狂欢活动的结束时间

function PlayerData:init()
    self.super.init(self)
    
    self.dataInitFinish = false
    --玩家数据初始化
    --注册网络监听，游戏开始初始化数据
    --游戏玩家数据初始化命令：idx ＝ { 2, 2 }
    local onPlayerInit = function(event)
        -- if not self.dataInitFinish then
            print("onPlayerInit---")
            local data = event.data
            
            --临时标记，具体含义请收索，最大7个(1-体力 2-七星坛 3-积分商城刷新 4-抽卡返现 5-每日一冲)
            PlayerData.eventAttr.m_buyEnergyCount = data.m_actRechargeFlag[1]
            
            for k, v in pairs(data) do
                self.eventAttr[k] = v
            end

            GuideManager.guideLevel = PlayerData.eventAttr.m_level 
            
            PlayerData.eventAttr.m_guideStageId = data.m_guideStageId
            PlayerData.eventAttr.m_guideIndex = data.m_newGuildIndex
            
            if G_IsOpenGuide then
                if g_guideConfig.guideStage[PlayerData.eventAttr.m_guideStageId] then
                    PlayerData.eventAttr.m_guideId = g_guideConfig.guideStage[PlayerData.eventAttr.m_guideStageId][data.m_newGuildIndex] or 0
                else
                    PlayerData.eventAttr.m_guideId = 0
                end
            else
                PlayerData.eventAttr.m_guideId = 0
            end
            
        --     self.dataInitFinish = true
        -- end
    end
    NetWork:addNetWorkListener({ 2, 2 }, onPlayerInit)

    --注册体力恢复监听
    local onPlayerPowerhf = function(event)
        self.eventAttr.m_energy = event.m_energy
        self.eventAttr.m_energyTime = event.ttime
    end
    NetWork:addNetWorkListener({ 2, 20 }, onPlayerPowerhf)

    --精英副本倍率
    local onEliteRate = function(event)
        GameState.eliteRate = event.data.eliteRate
    end
    NetWork:addNetWorkListener({ 2, 27 }, onEliteRate)
    
end

function PlayerData:RequestBuyMoneyInf(handler)
    --监听服务器数据
    local onServerRequest = function (event)
        Functions.callAnySdkFuc(function( )
            Analytics:onPurchase({-3,4,1},PlayerData.eventAttr.m_gold - event.data.gold)
        end)
        local money = PlayerData.eventAttr.m_money
        PlayerData.eventAttr.m_money = event.data.money
        PlayerData.eventAttr.m_gold = event.data.gold
        PlayerData.eventAttr.m_buyMoneyCount = PlayerData.eventAttr.m_buyMoneyCount + 1
        local burst = 1
        if event.data.rbj > 1 then  --购买钱币时是否暴击
            burst = event.data.rbj
        end
        money = PlayerData.eventAttr.m_money - money
        if handler ~= nil then
            handler(money,burst)
        end
    end
    NetWork:addNetWorkListener({5,17}, Functions.createNetworkListener(onServerRequest, true, "ret"))
    local msg = { idx = {5, 17} }
    NetWork:sendToServer(msg)
end
function PlayerData:RequestBuyPowerInf(handler)
    --监听服务器数据
    local onServerRequest = function (event)  
        Functions.callAnySdkFuc(function( )
            Analytics:onPurchase({-4,4,1},PlayerData.eventAttr.m_gold - event.m_gold)
        end)
        PlayerData.eventAttr.m_gold = event.m_gold
        PlayerData:setPlayerPower(event.m_energy)
        PlayerData.eventAttr.energyPrice = event.price
        PlayerData.eventAttr.m_buyEnergyCount = event.actRechargeFlag
        if handler ~= nil then
            handler()
        end
    end
    NetWork:addNetWorkListener({5,13},  Functions.createNetworkListener(onServerRequest, true, "ret"))
    local msg = {idx = {5, 13} }
    NetWork:sendToServer(msg)
end

--增加player的属性
--@param : { soul = , money = , gold = , exps = , }
function PlayerData:addPlayerAtrs(param)

    local addSoul = param.soul or 0
    local addMoney = param.money or 0
    local addGlod = param.gold or 0
    local addExps = param.exps or 0

    PlayerData.eventAttr.m_soul = PlayerData.eventAttr.m_soul + addSoul
    PlayerData.eventAttr.m_money = PlayerData.eventAttr.m_money + addMoney
    PlayerData.eventAttr.m_gold = PlayerData.eventAttr.m_gold + addGlod
    PlayerData.eventAttr.m_exp = PlayerData.eventAttr.m_exp + addExps

end

--体力设置函数
function PlayerData:setPlayerPower(value)
    if value > 2000 then
        value = 2000
    end
    PlayerData.eventAttr.m_energy = value
end

function PlayerData:setNengLiang(value)
    PlayerData.eventAttr.m_nengliang = value
end



return PlayerData