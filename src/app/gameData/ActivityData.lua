local BaseModel = require("app.baseMVC.BaseModel")

local ActivityData = class("ActivityData", BaseModel)

ActivityData.debug = false
ActivityData.eventAttr = {}
ActivityData.eventAttr.rank = 0 --当前玩家积分排名
ActivityData.eventAttr.score = 0  --当前玩家积分
ActivityData.eventAttr.cdTime = 0  --免费抽卡cd时间
ActivityData.eventAttr.rankPlayer = {}  --所有玩家排名数据
ActivityData.eventAttr.count = 0  --玩家当前抽卡次数
ActivityData.eventAttr.gold = 0  --元宝抽消耗
ActivityData.eventAttr.freeTakeHeroFlag = 0
ActivityData.eventAttr.activityHeroTime = 0   --限时神将活动剩余时间
ActivityData.eventAttr.freeHeroRemainTime = 0  --免费抽剩余时间
ActivityData.eventAttr.isEnableActivityHero = 0 --限时神将获得是否开启 1开启
ActivityData.xsHero = {}
ActivityData.xsHero.rank = 0 --当前玩家积分排名
ActivityData.xsHero.score = 0  --当前玩家积分
ActivityData.xsHero.startTime = {} --活动开始时间
ActivityData.xsHero.endTime = {} --活动结束时间
ActivityData.xsHero.rankPlayer = {}  --所有玩家排名数据
ActivityData.xsHero.cdTime = 0  --免费抽卡cd时间
ActivityData.xsHero.count = 0  --玩家当前抽卡次数
ActivityData.xsHero.rankDescribe = {} --描述配置
ActivityData.xsHero.tips = "" --提示
ActivityData.xsHero.gold = 0  --元宝抽消耗
ActivityData.xsHero.showHero = {} --展示的卡牌
ActivityData.xsHero.CritNum = 10 --必得六星抽卡的次数
ActivityData.xsHero.CD = 0 --免费抽卡的cd时间

--测试数据
ActivityData.xsHero.isEnableHero = {}
ActivityData.xsHero.showHero = {}

--选秀数据
ActivityData.eventAttr.sg_activityTimeout = 0 --剩余活动时间
ActivityData.eventAttr.sg_curLevel = 1--当前轮数
ActivityData.eventAttr.sg_curNeedGold = 200 --当前需要元宝
ActivityData.eventAttr.sg_isOpneSelectGirl = false --是否开启选秀活动
ActivityData.eventAttr.sg_sys_isOpenSelectGirl = true --是否显示选秀入口

ActivityData.selectGirl ={}
ActivityData.selectGirl.sg_activityTimeout = 0 --剩余活动时间
ActivityData.selectGirl.sg_activityStartTime = {year = 2016,month =12,day = 1} --活动开始时间
ActivityData.selectGirl.sg_activityEndTime = {year = 2016,month =12,day = 31}--活动结束时间
ActivityData.selectGirl.sg_inf = "一起来选你心中的女神吧"--活动描述
ActivityData.selectGirl.sg_curLevel = 1--当前轮数
ActivityData.selectGirl.sg_curNeedGold = 0 --当前需要元宝
ActivityData.selectGirl.sg_girlIds = {1,2,5,4} --美女展示id
ActivityData.selectGirl.sg_resetGold =100 --当前重置需要的元宝
ActivityData.selectGirl.sg_isOpneSelectGirl = false --是否开启选秀活动
ActivityData.selectGirl.sg_sys_isOpenSelectGirl = true --是否显示选秀入口


--在线领奖
ActivityData.eventAttr.m_onlineIndex = 0
ActivityData.eventAttr.remainTime = 0
ActivityData.eventAttr.m_onlinePrizeState = 0

ActivityData.onlineReward = {}
ActivityData.onlineReward.m_dailyonlinetime = 0 --刚建号初始数据在线总时间为0
ActivityData.onlineReward.m_onlinePrizeState = 0 --领取状态
ActivityData.onlineReward.m_onlineIndex = 0 --领取的阶段
ActivityData.onlineReward.remainTime = 0 --本次距离上次领奖时
ActivityData.onlineReward.Rewards = {} --奖品配置

ActivityData.VIPBZ = false          --VIP标志
ActivityData.VIPJiHua = {}          --VIP成长基金
ActivityData.VIPJiHuaItem = {}
ActivityData.VIPJiHuaBuy = 0        --VIP成长基金是否购买(0-未购买，1-已购买)

ActivityData.EveryDayBZ = false     --每日充值标志
ActivityData.EveryDay = {}          --每日充值(0不可领取 1 可领取 2 已经领取过了)
ActivityData.EveryDayItem = {}      --每日充值道具
ActivityData.EveryDayGold = 0       --今日已充钱数

ActivityData.MoneyBZ = false        --充值标志
ActivityData.MoneyHuoDong = {}      --充值活动(0不可领取 1 可领取 2 已经领取过了)
ActivityData.MoneyHuoDongItem = {}
ActivityData.MoneyHuoDongNum = 0    --已充钱数

ActivityData.XiaoFeiBZ = false      --消费标志
ActivityData.XiaoFei = {}           --累积消费(0不可领取 1 可领取 2 已经领取过了)
ActivityData.XiaoFeiItem = {}
ActivityData.XiaoFeiNum = 0         --累积消费数

ActivityData.SanCanBZ = false       --三餐标志
ActivityData.SanCan = {}            --豪华三餐(0不可领取 1 可领取 2 已经领取过了)


ActivityData.YueKaBZ = false       --月卡标志
ActivityData.YueKa = {}            --月卡奖励(0不可领取 1 可领取 2 已经领取过了)
ActivityData.YueKaInfo = {}        --月卡信息

ActivityData.ChengJiuBZ = false     --成就标志
ActivityData.ChengJiu = {}          --月卡奖励(0不可领取 1 可领取 2 已经领取过了)

ActivityData.DianZanBZ = false     --点赞标志
ActivityData.DianZan = {}          --点赞奖励(0不可领取 1 可领取 2 已经领取过了)


--ActivityData.TianTiRank = {}        --天梯排名分段
--ActivityData.TianTiStartTime = {}        --天梯开始时间
--ActivityData.TianTiEndTime = {}        --天梯结束时间
--ActivityData.TianTiScore = {}     --天梯积分
--ActivityData.TianTiItem = {}      --天梯道具

--StartTime = {day, hour, min, month, sec，year}
ActivityData.StartTime = {}         --活动开始时间
ActivityData.EndTime = {}           --活动结束时间



--福利标志
ActivityData.eventAttr.fuLiDataBZ = 0

function ActivityData:init()
    self.super.init(self)
    local onActivityInit = function(event)
        local data = event.data
        for k, v in pairs(data) do
            self.xsHero[k] = v
        end 
        --测试数据
--        ActivityData.xsHero.isEnableHero = {true,true,true,true,false}
--        ActivityData.xsHero.showHero={[1]={[0]=120,[1]=121,[2]=122},
--                                      [2]={[0]=123,[1]=124,[2]=125},
--                                      [3]={[0]=124,[1]=121,[2]=122},
--                                      [4]={[0]=125,[1]=121,[2]=122},
--                                      [5]={[0]=127,[1]=121,[2]=122},}  
                                                        


        ActivityData.eventAttr.gold = ActivityData.xsHero.gold
        ActivityData.eventAttr.rank = ActivityData.xsHero.rank 
        ActivityData.eventAttr.score =ActivityData.xsHero.score 
        ActivityData.eventAttr.cdTime = ActivityData.xsHero.cdTime 
        ActivityData.eventAttr.isEnableActivityHero = ActivityData.xsHero.isEnableActivityHero
        if ActivityData.eventAttr.cdTime == 0 then
            ActivityData.eventAttr.freeTakeHeroFlag = 1
        else
            ActivityData.eventAttr.freeTakeHeroFlag = 0
        end
        ActivityData.eventAttr.rankPlayer = ActivityData.xsHero.rankPlayer 
        ActivityData.eventAttr.count = ActivityData.xsHero.CritNum - ActivityData.xsHero.count 
        --活动时间
        -- local isEnableActivityHero = Functions.checkTime(TimerManager:getCurrentSecond(),ActivityData.xsHero.startTime,ActivityData.xsHero.endTime)
        if ActivityData.eventAttr.isEnableActivityHero == 1 then 
            ActivityData.eventAttr.activityHeroTime = ActivityData.xsHero.endTime_s - TimerManager:getCurrentSecond()
            local listener = function( )               
                if ActivityData.eventAttr.cdTime > 0 then
                    ActivityData.eventAttr.freeHeroRemainTime = math.floor(ActivityData.xsHero.CD - (TimerManager:getCurrentSecond() - ActivityData.eventAttr.cdTime))
                    if ActivityData.eventAttr.freeHeroRemainTime > 0 then
                        ActivityData.eventAttr.freeHeroRemainTime = ActivityData.eventAttr.freeHeroRemainTime - 1
                        ActivityData.eventAttr.freeTakeHeroFlag = 0
                    else
                        ActivityData.eventAttr.freeTakeHeroFlag = 1
                        ActivityData.eventAttr.cdTime = 0
                        ActivityData.eventAttr.freeHeroRemainTime = 0
                    end
                else
                    ActivityData.eventAttr.freeTakeHeroFlag = 1
                end
                if ActivityData.eventAttr.activityHeroTime >= 1 then
                    ActivityData.eventAttr.activityHeroTime = ActivityData.eventAttr.activityHeroTime - 1 
                else
                    ActivityData.eventAttr.activityHeroTime = 0
                    ActivityData.eventAttr.freeTakeHeroFlag = 0
                    ActivityData.eventAttr.isEnableActivityHero = 0
                end
                
            end
            GameEventCenter:addEventListener(TimerManager.SECOND_CHANGE_EVENT, listener)
        else
            ActivityData.eventAttr.freeTakeHeroFlag = 0
            ActivityData.eventAttr.activityHeroTime = 0
        end
    end
    NetWork:addNetWorkListener({ 2, 24 }, onActivityInit)

    local onActivityInit2 = function(event)
        local data = event.data
        for k, v in pairs(data) do
            self.onlineReward[k] = v
        end  
        ActivityData.eventAttr.m_onlineIndex = ActivityData.onlineReward.m_onlineIndex
        ActivityData.eventAttr.remainTime = ActivityData.onlineReward.remainTime
        ActivityData.eventAttr.m_onlinePrizeState = ActivityData.onlineReward.m_onlinePrizeState
        --在线领奖时间
        local listener = function( )
            if ActivityData.eventAttr.remainTime >= 0 and ActivityData.eventAttr.m_onlinePrizeState == 0 then
                ActivityData.eventAttr.remainTime = ActivityData.eventAttr.remainTime - 1 
                if ActivityData.eventAttr.remainTime < 0 then
                    ActivityData.eventAttr.m_onlinePrizeState = 1
                    ActivityData.eventAttr.remainTime = 0
                end     
            else
                ActivityData.eventAttr.remainTime = 0    
            end
        end
        GameEventCenter:addEventListener(TimerManager.SECOND_CHANGE_EVENT, listener)
    end
    NetWork:addNetWorkListener({ 2, 23 }, onActivityInit2)
    --选美数据同步
    local onSelectGirlInit = function(event)
        local data = event.data
        for k, v in pairs(data) do
            self.selectGirl[k] = v
        end  
        self.eventAttr.sg_activityTimeout = self.selectGirl.sg_activityTimeout
        self.eventAttr.sg_curLevel = self.selectGirl.sg_curLevel
        self.eventAttr.sg_curNeedGold = self.selectGirl.sg_curNeedGold
        self.eventAttr.sg_isOpneSelectGirl = self.selectGirl.sg_isOpneSelectGirl 
        local listener = function( )
            if self.eventAttr.sg_activityTimeout >= 1 then
                self.eventAttr.sg_activityTimeout = self.eventAttr.sg_activityTimeout - 1    
            else
                self.eventAttr.sg_activityTimeout = 0  
                self.eventAttr.sg_isOpneSelectGirl = false  
            end
        end
        GameEventCenter:addEventListener(TimerManager.SECOND_CHANGE_EVENT, listener)
    end
    NetWork:addNetWorkListener({ 36, 1 }, onSelectGirlInit)



    NetWork:addNetWorkListener({ 36, 5 }, function(event)
        ActivityData.selectGirl.sg_girlIds = event.sg_girlIds
        ActivityData.selectGirl.sg_isOpneSelectGirl = false
    end)

    local onBZ = function(event)
    
        --每日充值
        if event.active == "everyPay" and event.isHave then
        	self.EveryDayBZ = true
        elseif event.active == "everyPay" and not event.isHave then 
            self.EveryDayBZ = false
        end
        --充值活动 
        if event.active == "totalPay" and event.isHave then
            self.MoneyBZ = true
        elseif event.active == "totalPay" and not event.isHave then 
            self.MoneyBZ = false
        end
        --总消费 
        if event.active == "allConsume" and event.isHave then
            self.XiaoFeiBZ = true
        elseif event.active == "allConsume" and not event.isHave then
            self.XiaoFeiBZ = false
        end
        --成长计划
        if event.active == "growUp" and event.isHave then
            self.VIPBZ = true
        elseif event.active == "growUp" and not event.isHave then 
            self.VIPBZ = false
        end 
       --月卡标志
        if event.active == "monthCard" and event.isHave then
            self.YueKaBZ = true
        elseif event.active == "monthCard" and not event.isHave then 
            self.YueKaBZ = false
        end 
        --点赞标志
        if event.active == "DZ" and event.isHave then
            self.DianZanBZ = true
        elseif event.active == "DZ" and not event.isHave then 
            self.DianZanBZ = false
        end 
        --成就标志
        if event.active == "CJ" and event.isHave then
            self.ChengJiuBZ = true
        elseif event.active == "CJ" and not event.isHave then 
            self.ChengJiuBZ = false
        end 
    end
    NetWork:addNetWorkListener({ 20, 30 }, onBZ)
    
    --获取豪华三餐数据
    --st        开始时间
    --et        结束时间
    --flag      标志(0不可领取 1 可领取 2 已经领取过了)
    --energy    获得的体力值
    local onSanCan = function(event)
        ActivityData.SanCan = event.data
    end
    NetWork:addNetWorkListener({ 2, 32 }, onSanCan)
    
    --同步成就
    local onChengJiu = function(event)
        for k, v in pairs(ActivityData.ChengJiu) do
            for m,y in ipairs(event.tb) do
            	if y == v.id then
                    ActivityData.ChengJiu[k].bz = 1
                end
            end
        end
        ActivityData.ChengJiuBZ = true
    end
    NetWork:addNetWorkListener({ 34, 4 }, onChengJiu)
    
    --获取豪华三餐标志并维护领取标志
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local data = ActivityData:getSanCan()
        if next(data) ~= nil then
            if m_newtime < data[1].st or m_newtime > data[3].et  then
                ActivityData.SanCanBZ = false
                return
            end
            for k,v in ipairs(data) do
                if m_newtime >= v.st and m_newtime <= v.et and v.flag == 1 then
                    ActivityData.SanCanBZ = true
                    break
                else
                    ActivityData.SanCanBZ = false
                end
            end
            for k,v in ipairs(data) do
                if m_newtime >= v.st and m_newtime <= v.et then
                    if data[k].flag == 0 then
                        data[k].flag = 1
                    end
                else
                    if data[k].flag == 1 then
                        data[k].flag = 0
                    end
                end
            end
            self:updateBz()
        end

    end
    GameEventCenter:addEventListener(TimerManager.SECOND_CHANGE_EVENT, onTime)
end

function ActivityData:updateBz()
    if self.EveryDayBZ or self.MoneyBZ or self.XiaoFeiBZ or self.VIPBZ or self.SanCanBZ or self.ChengJiuBZ or self.DianZanBZ or self.YueKaBZ then
        ActivityData.eventAttr.fuLiDataBZ = 1
    else
        ActivityData.eventAttr.fuLiDataBZ = 0
    end
end

--获取豪华三餐
function ActivityData:getSanCan()
    return ActivityData.SanCan
end

--领取三餐
function ActivityData:sendGetSanCan(idx,listener)
    --监听服务器数据
    local onServerRequest = function (event)
        local data = ActivityData:getSanCan()
        data[idx].flag = 2
        PlayerData.eventAttr.m_energy = PlayerData.eventAttr.m_energy + event.energy
        ActivityData.SanCanBZ = false
        listener()
    end
    NetWork:addNetWorkListener({34,1}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 1},index = idx}
    NetWork:sendToServer(msg)
end

--查看成就
function ActivityData:sendChengJiu()
    --监听服务器数据
    local onServerRequest = function (event)
        ActivityData.ChengJiu = {}
        local data = {}
        for k,v in pairs(g_cjconfig) do
        	data[#data+1] = v
        end
        ActivityData.ChengJiu = data
        for k,v in pairs(event.data) do
            for m,n in ipairs(ActivityData.ChengJiu) do
                if ActivityData.ChengJiu[m].id == k then
                    ActivityData.ChengJiu[m].bz = v
                    break
                end
            end
        end
        for k,v in pairs(event.data) do
            if v == 1 then
                ActivityData.ChengJiuBZ = true
                break
            end
        end
        
       ActivityData.ChengJiu = self:getChengJiuSort(clone(ActivityData.ChengJiu))
    end
    NetWork:addNetWorkListener({34,2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 2}}
    NetWork:sendToServer(msg)
end

--领取成就
function ActivityData:sendGetChengJiu(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in ipairs(event.data) do
            Functions:addItemResources( {id = v[1], type = v[2], count = v[3], slot = v[4]} )
        end

        for k,v in ipairs(ActivityData.ChengJiu) do
            if v.id == idx then
                ActivityData.ChengJiu[k].bz = 2
                break
            end
        end
        --默认领取后为false,遍历后会得到真实标志数据
        ActivityData.ChengJiuBZ = false
        for k,v in ipairs(ActivityData.ChengJiu) do
            if v == 1 then
                ActivityData.ChengJiuBZ = true
                break
            end
        end
        ActivityData.ChengJiu = self:getChengJiuSort(clone(ActivityData.ChengJiu))
        --self:getChengJiuSort(ActivityData.ChengJiu)
        listener()
    end
    NetWork:addNetWorkListener({34,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 3}, index = idx}
    NetWork:sendToServer(msg)
end


--领取每日奖励
function ActivityData:sendGetYueKa(idx,listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in ipairs(event.data) do
            Functions:addItemResources( {id = v[1], type = v[2], count = v[3], slot = v[4]} )
        end

        for k,v in pairs(ActivityData.YueKa) do
        	ActivityData.YueKa[idx].bz = 2
        end
        self.YueKaBZ = false
        for k,v in pairs(ActivityData.YueKa) do
            if ActivityData.YueKa[k].bz == 1 then
                self.YueKaBZ = true
            end
        end
        listener()  
    end
    NetWork:addNetWorkListener({34,6}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 6}, index = idx}
    NetWork:sendToServer(msg)
end


--查询月卡奖励
function ActivityData:sendYueKa()
--monthTime     剩余天数
--monthCount    月卡奖励次数
    --监听服务器数据
    local onServerRequest = function (event)
        ActivityData.YueKa = {}
        ActivityData.YueKaInfo = event.data.monthInfo
        g_monthVip.reward.bz = event.data.bz.rewardbz
        g_monthVip.everyReward.bz = event.data.bz.everybz 
        ActivityData.YueKa[#ActivityData.YueKa + 1] = g_monthVip.reward
        ActivityData.YueKa[#ActivityData.YueKa + 1] = g_monthVip.everyReward
        if event.data.bz.rewardbz == 1 or event.data.bz.everybz == 1 then
            self.YueKaBZ = true
        end
    end
    NetWork:addNetWorkListener({34,5}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 5}}
    NetWork:sendToServer(msg)
end

--获取月卡数据
function ActivityData:getYueKa()
    return ActivityData.YueKa
end

--获取月卡详细信息
function ActivityData:getYueKaInfo()
    return ActivityData.YueKaInfo
end

--查询点赞奖励
function ActivityData:sendDianZan()
    --dzBZ        是否点赞
    --rewardBZ    是否领取点赞 

    --监听服务器数据
    local onServerRequest = function (event)
        ActivityData.DianZan = {}
        ActivityData.DianZan = event.data
        if event.data.rewardbz == 1 then
            self.DianZanBZ = true
        end
    end
    NetWork:addNetWorkListener({34,10}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 10}}
    NetWork:sendToServer(msg)
end

--接受点赞
function ActivityData:sendAcceptDianZan(listener)
    local onServerRequest = function (event)
        ActivityData:getDianZan().dzBZ = 1
        if ActivityData:getDianZan().rewardBZ == 0 then
            ActivityData:getDianZan().rewardBZ = 1
        end

        listener()
    end
    NetWork:addNetWorkListener({34,11}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 11}}
    NetWork:sendToServer(msg)
end

--领取点赞奖励
function ActivityData:sendGetDianZan(listener)
    local onServerRequest = function (event)
        for k,v in ipairs(event.data) do
            Functions:addItemResources( {id = v[1], type = v[2], count = v[3], slot = v[4]} )
        end
        ActivityData:getDianZan().rewardBZ = 2
        self.DianZanBZ = false
        listener()
    end
    NetWork:addNetWorkListener({34,12}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {34, 12}}
    NetWork:sendToServer(msg)
end

--获取点赞数据
function ActivityData:getDianZan()
    return ActivityData.DianZan
end
--发送获取选美排行接口
function ActivityData:requestSelectGirlRank(girlMark,_handler)
    local onServerRequest = function(event)
        local allVoteNum = event.data.num
        local rankData = {}
        for k,v in pairs(event.data.playerinfo) do
            local tempData = {}
            tempData.playerName = v.name
            tempData.voteNum = v.count
            tempData.percent = math.floor(v.count/allVoteNum*100)
            rankData[#rankData+1] = tempData
        end
        if #rankData >1 then 
            table.sort(rankData,function(a,b) 
            return a.voteNum > b.voteNum end)
        end
        if _handler then 
            _handler(rankData)
        end
    end
    NetWork:addNetWorkListener({36,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {36, 4},index = girlMark}
    NetWork:sendToServer(msg)
end
--发送选美领奖接口
function ActivityData:RequestSelectGirl(girlMark,handler)
--    event={}
--    event.gtype = 4
--    event.gcount = 1
--    event.gid = 42
    local onServerRequest = function(event)
        self.eventAttr.sg_curLevel = event.data.sg_curLevel
        self.eventAttr.sg_curNeedGold = event.data.sg_curNeedGold        
        PlayerData.eventAttr.m_gold  = event.data.curgold
        local gtype = event.data.goods[1][2]
        local goodNum = event.data.goods[1][3] * event.data.rate
        local goodId = event.data.goods[1][1]
        local goodMark = event.data.goods[1][4]
        if gtype == 1 then    --抽卡                  
            HeroCardData:addCard({slot = goodMark,id = goodId}) 
            GameCtlManager:getCurrentController():openChildView("app.ui.popViews.EnlistThreePopView", {isRemove = true,data = {slot = goodMark,id = goodId,type = 2} })   
        elseif gtype == 2 then--抽装备/将魂
            EquipmentData:addEquip({m_id = goodId,mark = goodMark,rdAttrType = event.gPlusPropType,rdAttrPercent = event.gPropValueTil })
                NoticeManager:openRewardTips(GameCtlManager:getCurrentController(), {type = NoticeManager.REWARD_EQUIP_TIPS,data = {equipMark = goodMark}})
        elseif gtype == 10 then--抽装备/将魂
            HeroSoulData:addheroSoul({id = goodId,mark = goodMark,
                level = 1,
                atkFormFlag = 0,
                exp = 0})
                NoticeManager:openRewardTips(GameCtlManager:getCurrentController(), {type = NoticeManager.REWARD_HERO_SOUL_TIPS,data = {heroSoulMark = goodMark}})
        elseif gtype == 3 then --开武将卡包
            for k,v in pairs(goodMark) do
                HeroCardData:addCard({slot = v.slot,id = v.id})
            end
            NoticeManager:openRewardTips(GameCtlManager:getCurrentController(), {type = NoticeManager.REWARD_HERO_CARD_TIPS,data = {heroId = goodId, heroNum = #goodMark }}) 
        elseif gtype == 4 then --抽道具
            PropData:addProp({m_id=goodId,m_count=goodNum})
            local propImg = ""
            if  goodId == -2 then
                propImg = "property_gold.png"
            elseif  goodId == -3 then
                propImg = "property_money.png"
            elseif goodId == -5 then
                propImg = "soul80.png"
            elseif goodId == -6 then
                propImg = "property_soulCrystal.png"
            else
                propImg = ConfigHandler:getPropImageOfId(goodId)
            end
            NoticeManager:openRewardTips(GameCtlManager:getCurrentController(), {type = NoticeManager.REWARD_PROP_TIPS,data = {{img = propImg, num = goodNum}}})
        elseif gtype == 5 then --抽碎片
            local img = ConfigHandler:getHeroHeadImageOfId(goodId)                   
            Functions:addItemResources({id = goodId,type = event.gtype,count = num,slot = goodMark})   
            NoticeManager:openRewardTips(GameCtlManager:getCurrentController(), {type = NoticeManager.REWARD_CARD_FRAGMENT_TIPS,data = {{img = img, num = goodNum}}}) 
        end
    end

    NetWork:addNetWorkListener({36,2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {36, 2},index = girlMark}
    NetWork:sendToServer(msg)
end
--发送重置接口
function ActivityData:requestResetSelectGirl(_handler)
    local onServerRequest = function(event)
        ActivityData.selectGirl.sg_girlIds = event.data.sg_girlIds
        self.eventAttr.sg_curLevel = event.data.sg_curLevel
        self.eventAttr.sg_curNeedGold = event.data.sg_curNeedGold        
        PlayerData.eventAttr.m_gold  = event.data.curgold
        self.selectGirl.sg_resetGold = event.data.sg_resetGold
        if _handler then 
            _handler()
        end
    end
    NetWork:addNetWorkListener({36,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {36, 3}}
    NetWork:sendToServer(msg)
end
--发送抽抽卡请求
function ActivityData:RequestTakeCard(type,xsHeroType,handler)
    --监听服务器数据
    local onServerRequest = function (event)
        for k, v in pairs(event.tmp) do
            HeroCardData:addCard({slot = v.slot,id = v.id}) 
        end        
        if type == 2 then
            Functions.callAnySdkFuc(function( )
                Analytics:onPurchase({-105,1,1},PlayerData.eventAttr.m_gold - event.gold)
            end)  
        end
        PlayerData.eventAttr.m_gold = event.gold
        ActivityData.eventAttr.score = event.score
        ActivityData.eventAttr.rank = event.rank         
        ActivityData.eventAttr.rankPlayer = event.rankPlayer
        ActivityData.eventAttr.count = ActivityData.xsHero.CritNum - event.count 
        TimerManager:setCurrentSecond(event.currentTime)
        if type == 1 then 
            ActivityData.eventAttr.cdTime = event.initTime
            ActivityData.eventAttr.freeHeroRemainTime = math.floor(ActivityData.xsHero.CD - (TimerManager:getCurrentSecond() - ActivityData.eventAttr.cdTime))
        end

        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({26,1}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {26, 1}, stype = type,xsHeroType = xsHeroType}
    NetWork:sendToServer(msg)
end

--同步在线领奖接口
function ActivityData:requireOnline(handler)
    --监听服务器数据
    local onServerRequest = function (event)
        local data = event.data
        for k, v in pairs(data) do
            self.onlineReward[k] = v
        end  
        ActivityData.eventAttr.m_onlineIndex = ActivityData.onlineReward.m_onlineIndex
        ActivityData.eventAttr.remainTime = ActivityData.onlineReward.remainTime
        ActivityData.eventAttr.m_onlinePrizeState = ActivityData.onlineReward.m_onlinePrizeState
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({20,5}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 5}}
    NetWork:sendToServer(msg)
end
--发送首充领奖请求
function ActivityData:RequestFirstPayReward(handler)
    --监听服务器数据
    local onServerRequest = function (event)
        PlayerData.eventAttr.m_money = event.data.money
        PlayerData.eventAttr.m_gold = event.data.gold
        PlayerData.eventAttr.m_soul = event.data.soul
        PlayerData.eventAttr.m_hunjing = event.data.hunjing
        PlayerData.eventAttr.m_vipFirstFlag = 0   --vip首充标示：是否有奖可领 1/0
        for k,v in pairs(event.data.items) do
            Functions:addItemResources(v)
        end

        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({25,6}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 6}}
    NetWork:sendToServer(msg)
end
--发送在线领奖请求
function ActivityData:RequestOnlineReward(handler)
    --监听服务器数据
    local onServerRequest = function (event)
        PlayerData.eventAttr.m_money = event.data.money
        PlayerData.eventAttr.m_gold = event.data.gold
        PlayerData.eventAttr.m_soul = event.data.soul
        PlayerData.eventAttr.m_hunjing = event.data.hunjing
        ActivityData.eventAttr.remainTime = event.remainTime
        ActivityData.eventAttr.m_onlinePrizeState = event.m_onlinePrizeState
        for k,v in pairs(event.data.items) do
            Functions:addItemResources(v)
        end
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({20,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 4}}
    NetWork:sendToServer(msg)
end


--发送VIP成长基金
function ActivityData:sendJiHua()
    --监听服务器数据
    local onServerRequest = function (event)
    
        local group = event.data
        ActivityData.VIPJiHuaItem = {}
        for k, v in pairs(group) do
            ActivityData.VIPJiHuaItem[#ActivityData.VIPJiHuaItem + 1] = v
        end
        
        local data = event.state
        ActivityData.VIPJiHua = {}
        for k, v in pairs(data) do
            ActivityData.VIPJiHua[#ActivityData.VIPJiHua + 1] = v
        end
        self.VIPJiHuaBuy = event.growUpFlag
    end
    NetWork:addNetWorkListener({25,5}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 5}}
    NetWork:sendToServer(msg)
end

--发送每日充值
function ActivityData:sendEveryDay(onData)
    --监听服务器数据
    local onServerRequest = function (event)
        local data = event.state
        local group = event.data.group
        
--        ActivityData.StartTime[#ActivityData.StartTime + 1] = event.data.startTime       --活动开始时间
--        ActivityData.EndTime[#ActivityData.EndTime + 1] = event.data.endTime       --活动结束时间

        ActivityData.EveryDayItem = {}
        for k, v in pairs(group) do
            ActivityData.EveryDayItem[#ActivityData.EveryDayItem + 1] = v
        end
        
        ActivityData.EveryDay = {}
        for k, v in pairs(data) do
            ActivityData.EveryDay[#ActivityData.EveryDay + 1] = v
        end
        ActivityData.EveryDayGold = event.everyAllPay
        onData()
    end
    NetWork:addNetWorkListener({20,15}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 15}}
    NetWork:sendToServer(msg)
end

--发送充值活动
function ActivityData:sendNumHuoDong()
    --监听服务器数据
    local onServerRequest = function (event)
    
        local group = event.data.group

        ActivityData.MoneyHuoDongItem = {}
        for k, v in pairs(group) do
            ActivityData.MoneyHuoDongItem[#ActivityData.MoneyHuoDongItem + 1] = v
        end
        
        local data = event.state
        ActivityData.StartTime[#ActivityData.StartTime + 1] = event.data.startTime       --活动开始时间
        ActivityData.EndTime[#ActivityData.EndTime + 1] = event.data.endTime       --活动结束时间
        
        ActivityData.MoneyHuoDong = {}
        for k, v in pairs(data) do
            ActivityData.MoneyHuoDong[#ActivityData.MoneyHuoDong + 1] = v
        end
        ActivityData.MoneyHuoDongNum = event.ljccRecharge
    end
    NetWork:addNetWorkListener({20,8}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 8}}
    NetWork:sendToServer(msg)
end

--发送累积消费
function ActivityData:sendXiaoFei()
    --监听服务器数据
    local onServerRequest = function (event)
    
        local group = event.data.group

        ActivityData.XiaoFeiItem = {}
        for k, v in pairs(group) do
            ActivityData.XiaoFeiItem[#ActivityData.XiaoFeiItem + 1] = v
        end
        
        local data = event.state
--        ActivityData.StartTime[#ActivityData.StartTime + 1] = event.data.startTime      --活动开始时间
--        ActivityData.EndTime[#ActivityData.EndTime + 1] = event.data.endTime            --活动结束时间
        
        ActivityData.XiaoFei = {}
        for k, v in pairs(data) do
            ActivityData.XiaoFei[#ActivityData.XiaoFei + 1] = v
        end
        ActivityData.XiaoFeiNum = event.allConsume
    end
    NetWork:addNetWorkListener({20,20}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 20}}
    NetWork:sendToServer(msg)
end

----发送天梯数据
--function ActivityData:sendTianTi()
--    --监听服务器数据
--    local onServerRequest = function (event)
--        local data = event.data
----        ActivityData.StartTime[#ActivityData.StartTime + 1] = event.data.startTime      --活动开始时间
----        ActivityData.EndTime[#ActivityData.EndTime + 1] = event.data.endTime            --活动结束时间
--        
--        ActivityData.TianTiRank = {}
--        for k, v in pairs(data.group) do
--            ActivityData.TianTiRank[#ActivityData.TianTiRank + 1] = v
--            
--        end
--
--    end
--    NetWork:addNetWorkListener({20,25}, Functions.createNetworkListener(onServerRequest,true,"ret"))
--    local msg = {idx = {20, 25}}
--    NetWork:sendToServer(msg)
--end


----VIP成长基金标志
--function ActivityData:getVIPBZ()
--    local data = ActivityData.VIPJiHua
--    local BZ = true
--    for k, v in pairs(data) do
--        if v == 1 then
--        	ActivityData.VIPBZ = true
--            BZ = false
--        	break
--        end
--    end
--    if BZ then
--        ActivityData.VIPBZ = false
--    end
--    return  ActivityData.VIPBZ
--end
--
----每日充值标志
--function ActivityData:getEveryDayBZ()
--    local data = ActivityData.EveryDay
--    local BZ = true
--    for k, v in pairs(data) do
--        if v == 1 then
--            ActivityData.EveryDayBZ = true
--            BZ = false
--            break
--        end
--    end
--    if BZ then
--        ActivityData.EveryDayBZ = false
--    end
--    return  ActivityData.EveryDayBZ
--end
--
----累积充值标志
--function ActivityData:getMoneyBZ()
--    local data = ActivityData.MoneyHuoDong
--    local BZ = true
--    for k, v in pairs(data) do
--        if v == 1 then
--            ActivityData.MoneyBZ = true
--            BZ = false
--            break
--        end
--    end
--    if BZ then
--        ActivityData.MoneyBZ = false
--    end
--    return  ActivityData.MoneyBZ
--end
--
----消费标志
--function ActivityData:getXiaoFeiBZ()
--    local data = ActivityData.XiaoFei
--    local BZ = true
--    for k, v in pairs(data) do
--        if v == 1 then
--            ActivityData.XiaoFeiBZ = true
--            BZ = false
--            break
--        end
--    end
--    if BZ then
--        ActivityData.XiaoFeiBZ = false
--    end
--    return  ActivityData.XiaoFeiBZ
--end

--成就排序
function ActivityData:getChengJiuSort(data)

    -- 分解
    local temp = {}
    for k, v in ipairs(data) do
        if not temp[v.bz] then
            temp[v.bz] = {}
        end
        temp[v.bz][#temp[v.bz]+1] = v
    end

    for k , v in pairs(temp) do
        table.sort(v, function(a, b)
            return a.tjnum < b.tjnum
        end)

        for k1, v1 in ipairs(v) do
            if not v["data"] then 
                v["data"] = {}
            end
            if not v["data"][v1.tj] then
                v["data"][v1.tj] = {}
            end
            v["data"][v1.tj][#v["data"][v1.tj] + 1] = v1
        end
    end

    -- 合并
    for k, v in pairs(temp) do
        v.list = {}
        for k1, v1 in pairs(v["data"]) do
            table.insertto(v.list, v1)
        end
    end

    local result = {}
    local bzs = { 1, 0, 2}
    for k, v in ipairs(bzs) do
        if temp[v] then
            table.insertto(result, temp[v].list)
        end  
    end
    return result

    -- local comp = function(left,right)
    --     local old = ActivityData.ChengJiu
    --         --标志
    --     if left.bz > right.bz and right.bz ~= 0 then
    --         return true
    --     elseif left.bz < right.bz and left.bz ~= 0 then
    --         return false
    --     elseif left.bz == 0 then
    --         if right.bz == 1 then
    --             return false
    --         elseif right.bz == 2 then
    --             return true
    --         end
    --     elseif right.bz == 0 then
    --         if left.bz == 1 then
    --             return true
    --         elseif left.bz == 2 then
    --             return false
    --         end
    --     elseif left.bz == 1 then
    --         if right.bz == 0 then
    --             return true
    --         elseif right.bz == 2 then
    --             return false
    --         end
    --     elseif right.bz == 1 then
    --         if left.bz == 0 then
    --             return false
    --         elseif left.bz == 2 then
    --             return true
    --         end
    --     end
        
    --     --tj
    --     if left.tj < right.tj then
    --         return true
    --     elseif left.tj > right.tj then
    --         return false
    --     end
    --     --完成条件需要的数量
    --     if right.tjnum > left.tjnum then
    --         return true
    --     elseif right.tjnum < left.tjnum then
    --         return false
    --     end
        
    --     --id
    --     if left.id < right.id then
    --         return true
    --     elseif left.id > right.id then
    --         return false
    --     end

    -- end
    -- table.sort(data, comp)
    -- local new = ActivityData.ChengJiu
--    local pppppp = {1,6,4}
--    local ccc = function(left,right)
--    	if left < right then
--            return true
--        elseif left > right then
--            return false
--        end
--    end
--    table.sort(pppppp, ccc)
--    
    -- local ppp = 122
end

--获取成就奖励
function ActivityData:getChengJiu()
--    local data = {}
--    for k,v in pairs(ActivityData.ChengJiu) do
--    	data[#data+1] = v
--    end
--    return data
    return ActivityData.ChengJiu
end

--获取每日充值
function ActivityData:getEveryDay()
    return self.EveryDay
end

--获取每日充值道具
function ActivityData:getEveryDayItem()
    return self.EveryDayItem
end

--获取累积消费
function ActivityData:getXiaoFei()
    return self.XiaoFei
end

--获取累积消费道具
function ActivityData:getXiaoFeiItem()
    return self.XiaoFeiItem
end

--获取充值活动
function ActivityData:getMoneyHuoDong()
    return self.MoneyHuoDong
end

--获取充值活动道具
function ActivityData:getMoneyHuoDongItem()
    return self.MoneyHuoDongItem
end

----获取天梯数据
--function ActivityData:getTianTiRank()
--    return self.TianTiRank
--end

--获取VIP成长基金
function ActivityData:getJiHua()
    return self.VIPJiHua
end

--获取VIP成长基金道具
function ActivityData:getJiHuaItem()
    return self.VIPJiHuaItem
end

--获取活动开始时间
function ActivityData:getStartTime()
    return self.StartTime
end

--获取活动结束时间
function ActivityData:getEndTime()
    return self.EndTime
end

--累积消费
function ActivityData:getXiaoFeiNum()
    return self.XiaoFeiNum
end
--累积充值
function ActivityData:getMoneyHuoDongNum()
    return self.MoneyHuoDongNum
end
--今日已充值
function ActivityData:getEveryDayGold()
    return self.EveryDayGold
end


return ActivityData