local BaseModel = require("app.baseMVC.BaseModel")

local WarData = class("WarData", BaseModel)

WarData.debug = false

WarData.NOTICE_EVENT = "NOTICE_EVENT"
WarData.CITYC_HANGE = "CITYC_HANGE"
WarData.THE_WAR = "THE_WAR"
WarData.STRONGHOLD_CHANGE = "STRONGHOLD_CHANGE"
WarData.SHUI_JIN = "SHUI_JIN"

WarData.STRONGHOLD_ALL = "STRONGHOLD_ALL"

WarData.OK_YUAN_JUN = "OK_YUAN_JUN"

--CurLv         建筑等级
--sloting       正在任务的武将
--InitTime      开始任务的时间
--NeedExp       建筑升级经验
--oldslot1      已经做完任务的武将
--oldslot2      已经做完任务的武将
--state         建筑目前状态(0代表没做任务，1代表正在做任务，2代表可以领奖励)
--count         任务剩余次数            


function WarData:init()
    self.super.init(self)

	--国家入口
    self.ruKou = {}
    --国家信息
    self.campInfo = {}
    --国家公告
    self.notice = 0
    --皇帝名字
    self.HDname = 0
    --国战复活次数
    self.warCount = {}
    --所有城池信息
    self.mapInfo = {}
    --每个城池信息
    self.cityInfo = {}
    --所有据点信息
    self.strongholdInfo = {}
    --单个据点信息
    self.oneStrongholdInfo = {}
    --单个据点所属国家
    self.oneStrongholdCamp = 0
    --国家库房
    self.WarShop = {}
    --国家总伤害
    self.warHurt = {}
    --国家每日伤害
    self.warHurtDay = {}
    --城池伤害
    self.cityHurt = {}
    --查看援军
    self.checkFriend = {}
    --任免官职本轮排序
    self.AppointmentInfo = {}
    --任免官职上轮排序
    self.AppointmentOldInfo = {}
    --任免官职时自己的信息
    self.AppointmentMyInfo = {}
    --城池改变信息同步
    self.cityChange = {}
    --国战结算时间
    self.endTime = 0
    
    --水晶信息
    self.Resources = {}

    --城池改变信息同步
    local onCityChange = function(event)
        self.mapInfo = event.data
        GameEventCenter:dispatchEvent({ name = WarData.CITYC_HANGE, data = {} })
    end
    NetWork:addNetWorkListener({ 30, 40 }, onCityChange)

    --战斗状态改变
    local onTheWar = function(event)
        self.Resources = event.index
        local datas = self:getStrongholdInfo()
        datas[event.index].state = event.state
        GameEventCenter:dispatchEvent({ name = WarData.THE_WAR, data = {id = event.index} })
    end
    NetWork:addNetWorkListener({ 30, 41 }, onTheWar)

    --小据点攻破
    local onStrongholdChange = function(event)
        local datas = self:getStrongholdInfo()
        datas[event.index] = event.data
        local changeInfo = event.data
        GameEventCenter:dispatchEvent({ name = WarData.STRONGHOLD_CHANGE, data = {id = event.index} })
    end
    NetWork:addNetWorkListener({ 30, 42 }, onStrongholdChange)

    --（［1］，［2］，［3］分别对应魏蜀吴）
    --同步水晶
    local onShuiJin = function(event)
        self.Resources = event.data
        GameEventCenter:dispatchEvent({ name = WarData.SHUI_JIN, data = {}})
    end
    NetWork:addNetWorkListener({ 30, 43 }, onShuiJin)
    
    --同步所有据点信息
    local onShuiJin = function(event)
        self.strongholdInfo = event.data
        GameEventCenter:dispatchEvent({ name = WarData.STRONGHOLD_ALL, data = {}})
    end
    NetWork:addNetWorkListener({ 30, 44 }, onShuiJin)
    
end


--发送先择国家接口
function WarData:setSelectWar(typeId, listener)
    --建筑信息
    local onInfo = function(event)
        PlayerData.eventAttr.m_gold = event.gold
        PlayerData.eventAttr.m_camp = event.camp
        self:setWarRuKou(listener)
    end
    NetWork:addNetWorkListener({30,1}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 1}, type = typeId}
    NetWork:sendToServer(msg)
    
end

--发送先择国家入口（data表里索引为玩家名次）
function WarData:setWarRuKou(listener)
    --建筑信息
    local onInfo = function(event)
        self.ruKou = event.data
        self.endTime = event.endTime
        listener()
    end
    NetWork:addNetWorkListener({30,2}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 2}}
    NetWork:sendToServer(msg)
end


--发送先择国家信息
function WarData:setWarInfo(listener)
    --建筑信息
    local onInfo = function(event)
        local datas = event.data
        --清空
        self.campInfo = {}
        for k, v in pairs(datas.members) do
        	local info = {}
        	info.uid = v.uid                         --玩家id
        	info.name = v.name     				     --玩家名
			info.level = v.level     			     --等级
			info.fight = v.fight     			     --战斗力
			info.freTribute = v.freTribute		     --上轮贡献
			info.curTribute = v.curTribute		     --当前贡献
			info.offer = v.offer			         --官职
            info.offerlv = v.offerlv                 --官职等级
            info.power = v.power                     --权限(-1 代表没权限 1~5 有相应的权限)
			self.campInfo[#self.campInfo + 1] = info
        end
       	self.notice = datas.notice				--国家公告
        self.HDname = datas.hd					--皇帝名字
        --国家信息排序
        self:campInfo_sort(self.campInfo)
        
        listener()
    end
    NetWork:addNetWorkListener({30,3}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 3}}
    NetWork:sendToServer(msg)
end

--国家库房
function WarData:setWarShop(listener)
    
    local onInfo = function(event)
        self.WarShop = {}
        for k,v in pairs(event.data) do
            local info = {}
            info.m_Idx = k                      --道具索引
            info.m_ItemID = v.goodid            --道具ID
            info.m_ItemType = v.goodtype        --道具类型(1为卡片，4为道具,5-武将碎片)                    
            info.m_ItemPrice = v.price          --道具价格
            info.m_ItemNum = v.goodnum          --道具数量
            info.m_state = v.state              --状态（1 表示可以买 0 表示不能买）
            info.m_place = v.place              --产地
            self.WarShop[#self.WarShop + 1] = info
        end
        listener()
    end
    NetWork:addNetWorkListener({30,4}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 4}}
    NetWork:sendToServer(msg)
end

--id        城池ID就是数据索引
--ownname   城池拥用者的名字
--ownId     城池拥用者的ID
--pic       城池外型索引
--state     城池状态(2 不可攻击  1 可攻击 0 保护)
--camp      所属国家
--cityname  城池名
--发送世界地图城池信息
function WarData:setMapInfo(listener)
    --建筑信息
    local onInfo = function(event)
        self.mapInfo = event.data
        listener()
    end
    NetWork:addNetWorkListener({30,5}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 5}}
    NetWork:sendToServer(msg)
end


--name      城池名
--camp      所属国家
--boost     城池援军  （name 名字  offer  职位  pic 头像）
--hurt      城池伤害榜
--某个城池的详细信息
function WarData:setCityInfo(cityId,listener)
    --建筑信息
    local onInfo = function(event)
        self.cityInfo = event.data
        listener(cityId)
    end
    NetWork:addNetWorkListener({30, 6}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 6}, id = cityId}
    NetWork:sendToServer(msg)
end

--state      	状态（0 代表没打仗， 1 代表正在打仗）
--teamid      	据点城主ID
--teamname      据点守卫名
--camp   		所属国家
--name          据点名

--plusCount     当前剩余次数
--allCount      当前总次数

--所有据点信息
function WarData:setStrongholdInfo(strongholdId,listener)
    local onInfo = function(event)
        self.strongholdInfo = event.data
        self.warCount = event.numinfo
        listener(strongholdId)
    end
    NetWork:addNetWorkListener({30, 7}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 7}, id = strongholdId}
    NetWork:sendToServer(msg)
end

-- state 状态（0 代表没有 1代表存在 2代表死亡）
-- ratio 血量百分比
-- pic 玩家头像
-- name 玩家名
-- camp          所属国家
    --每个据点信息
function WarData:setOneStrongholdInfo(bigId, smallId, listener)
    local onInfo = function(event)
        self.oneStrongholdCamp = event.camp
        self.oneStrongholdInfo = event.data
        listener()
    end
    NetWork:addNetWorkListener({30, 8}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 8}, big = bigId, small = smallId}
    NetWork:sendToServer(msg)
end

--战争请求
function WarData:sendWar(bigId, smallId, listener)
    local onInfo = function(event)
        local playerInfo = event.playerData
        listener(playerInfo)
    end
    NetWork:addNetWorkListener({30, 9}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 9}, big = bigId, small = smallId}
    NetWork:sendToServer(msg)
end

--name    玩家姓名
--hurt    伤害
--offer   职位
--offerlv 职位等级
--level   等级
--国家总伤害排行
function WarData:sendWarRank(listener)
    local onInfo = function(event)
        self.warHurt = event.data
        self:Hurt_sort(self.warHurt)
        listener()
    end
    NetWork:addNetWorkListener({30, 13}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 13}}
    NetWork:sendToServer(msg)
end

--国家每日伤害排行
function WarData:sendWarRank_Day(listener)
    local onInfo = function(event)
        self.warHurtDay = event.data
        self:Hurt_sort(self.warHurtDay)
        listener()
    end
    NetWork:addNetWorkListener({30, 25}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 25}}
    NetWork:sendToServer(msg)
end

--城池伤害排行
function WarData:sendCityRank(bigId, listener)
    local onInfo = function(event)
        self.cityHurt = event.data
        self:CityHurt_sort(self.cityHurt)
        listener()
    end
    NetWork:addNetWorkListener({30, 14}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 14}, big = bigId}
    NetWork:sendToServer(msg)
end

--申请援军
function WarData:sendApplyFriend (bigId, listener)
    local onInfo = function(event)
        if event.id ~= 0 then
            --弹出提示信息
            local str = string.format(LanguageConfig.language_war_10, g_gzCfg.xlcfg[event.id].name)
            PromptManager:openTipPrompt(str)
        end
        listener()
    end
    NetWork:addNetWorkListener({30, 15}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 15}, big = bigId}
    NetWork:sendToServer(msg)
end

-- fight    战斗力
-- level    玩家等级
-- name     玩家名字
-- offer    玩家职位
-- uid      玩家id
--查看援军
function WarData:sendCheckFriend(bigId, listener)
    local onInfo = function(event)
        self.checkFriend = event.data
        listener()
    end
    NetWork:addNetWorkListener({30, 16}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 16}, big = bigId}
    NetWork:sendToServer(msg)
end

--同意援军
function WarData:sendApplyOk (bigId, uid, listener)
    local onInfo = function(event)
        local data = WarData:getCheckFriend()
        for k,v in pairs(data) do
            if v.uid == uid then
                table.remove(data,k)
                break
            end
        end
        WarData:getCityInfo().boost[event.data.idx] = event.data.info
        listener()
        GameEventCenter:dispatchEvent({ name = WarData.OK_YUAN_JUN, data = {id = event.index} })
    end
    NetWork:addNetWorkListener({30, 17}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 17}, big = bigId, uid = uid}
    NetWork:sendToServer(msg)
end

--拒绝援军
function WarData:sendApplyNo (bigId, uid, listener)
    local onInfo = function(event)
        local data = WarData:getCheckFriend()
        for k,v in pairs(data) do
        	if v.uid == uid then
                table.remove(data,k)
                break
        	end
        end
        listener()
    end
    NetWork:addNetWorkListener({30, 18}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 18}, big = bigId, uid = uid}
    NetWork:sendToServer(msg)
end

--name          玩家名字
--freTribute    上次贡献
--curTribute    本次贡献
--offer         职位
--offerlv       职位等级 1 2
--power         权力 1
--level         等级
--pic           头像
--uid           玩家uid

--spoffer       任命时职位上的uid
--Power         任免人的权力
--获取任免官职
function WarData:sendAppointmentInfo( listener)
    local onInfo = function(event)
        local data = event.data
        self.AppointmentInfo = event.data.members
        self.AppointmentOldInfo = event.data.members
        self.AppointmentMyInfo = event.data.selfinfo
        listener()
        self:AppointmentInfo_sort(self.AppointmentInfo)
        self:AppointmentOldInfo_sort(self.AppointmentOldInfo)  
    end
    NetWork:addNetWorkListener({30, 19}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 19}}
    NetWork:sendToServer(msg)
end

--任命官职
function WarData:sendAppointment(uid, type, Handler,listener)
    local onInfo = function(event)
    
        local data = WarData:getAppointmentInfo()
        local myPower = WarData:getAppointmentMyInfo()
        for k, v in pairs(data) do
            if uid == v.uid then
                v.offerlv = event.offerlv
                v.offer = g_gzCfg.power[myPower.power][type]
                for n, m in pairs(myPower.spoffer) do
                --清除被任命人在任命人所在的职位里以前占用的职位
                    if m == uid then
                        myPower.spoffer[n] = 0
                        break
                    end
                end
                myPower.spoffer[type] = uid
                break
        	end
        end
        self:AppointmentInfo_sort(self.AppointmentInfo)
        self:AppointmentOldInfo_sort(self.AppointmentOldInfo)  
        Handler()
        listener(type)
        --弹出信息
        PromptManager:openTipPrompt(LanguageConfig.language_war_12)
    end
    NetWork:addNetWorkListener({30, 20}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 20}, uid = uid, type = type}
    NetWork:sendToServer(msg)
end

--撤消官职
function WarData:sendUndo(uid, type, Handler,listener)
    local onInfo = function(event)

        local data = WarData:getAppointmentInfo()
        local myPower = WarData:getAppointmentMyInfo()
        for k, v in pairs(data) do
            if uid == v.uid then
                v.offerlv = event.data.offerlv
                v.offer = event.data.offer
                for n, m in pairs(myPower.spoffer) do
                    --清除被任命人在任命人所在的职位里以前占用的职位
                    if m == uid then
                        myPower.spoffer[n] = 0
                        break
                    end
                end
                break
            end
        end
        self:AppointmentInfo_sort(self.AppointmentInfo)
        self:AppointmentOldInfo_sort(self.AppointmentOldInfo)  
        Handler()
        listener(type)
        --弹出信息
        PromptManager:openTipPrompt(LanguageConfig.language_war_13)
    end
    NetWork:addNetWorkListener({30, 21}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 21}, uid = uid}
    NetWork:sendToServer(msg)
end

--离开据点界面
function WarData:sendStrongholdLeave(cityID)
    local onInfo = function(event)
    end
    NetWork:addNetWorkListener({30, 22}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 22}, bigID = cityID}
    NetWork:sendToServer(msg)
end

--离开城池界面
function WarData:sendCityLeave()
    local onInfo = function(event)
    end
    NetWork:addNetWorkListener({30, 23}, Functions.createNetworkListener(onInfo,true,"ret"))
    local msg = {idx = {30, 23}}
    NetWork:sendToServer(msg)
end

--退出国家
function WarData:sendExit(listener)
    local onExit = function(event)
        PlayerData.eventAttr.m_camp = 0 --国家id
        if listener then
            listener()
        end
    end
    NetWork:addNetWorkListener({30, 24}, Functions.createNetworkListener(onExit,true,"ret"))
    local msg = {idx = {30, 24}}
    NetWork:sendToServer(msg)
end


--单个据点所属国家
function WarData:getOneStrongholdCamp()
    return self.oneStrongholdCamp
end

--国战结算时间
function WarData:getEndTime()
    return self.endTime
end

-- 获取复活次数
function WarData:getWarCount()
    return self.warCount
end

--获取水晶数
function WarData:getResources()
    return self.Resources
end

--获取某个小据点的信息
function WarData:getJuDian(id)
    local datas = WarData:getStrongholdInfo()
    local data = {}
    for k,v in pairs(datas) do
    	if k == id then
    		data = v
    	end
    end
    return data
end

--获取任免官职本轮排名信息
function WarData:getAppointmentInfo()
    return self.AppointmentInfo
end
--获取任免官职上轮排名信息
function WarData:getAppointmentOldInfo()
    return self.AppointmentOldInfo
end
--获取任免官职自己信息
function WarData:getAppointmentMyInfo()
    return self.AppointmentMyInfo
end

--获取任免官职本轮排名信息排序
function WarData:AppointmentInfo_sort(data)
    local comp = function(left , right)
        if left.curTribute > right.curTribute then
            return true
        elseif left.curTribute < right.curTribute then
            return false
        end

        if left.offer < right.offer then
            return true
        elseif left.offer > right.offer then
            return false
        end

        if left.offerlv < right.offerlv then
            return true
        elseif left.offerlv > right.offerlv then
            return false
        end
        if left.level > right.level then
            return true
        elseif left.level < right.level then
            return false
        end
    end
    table.sort(data, comp)
end

--获取任免官职上轮排名信息
function WarData:AppointmentOldInfo_sort(data)
    local comp = function(left , right)
        if left.freTribute > right.freTribute then
            return true
        elseif left.freTribute < right.freTribute then
            return false
        end

        if left.offer < right.offer then
            return true
        elseif left.offer > right.offer then
            return false
        end
            
        if left.offerlv < right.offerlv then
            return true
        elseif left.offerlv > right.offerlv then
            return false
        end
        if left.level > right.level then
            return true
        elseif left.level < right.level then
            return false
        end
    end
    table.sort(data, comp)
end

--国家信息排序
function WarData:campInfo_sort(data)
    local comp = function(left , right)
        if left.offerlv < right.offerlv then
            return true
        elseif left.offerlv > right.offerlv then
            return false
        end
        if left.curTribute > right.curTribute then
            return true
        elseif left.curTribute < right.curTribute then
            return false
        end
        if left.freTribute > right.freTribute then
            return true
        elseif left.freTribute < right.freTribute then
            return false
        end
        if left.fight > right.fight then
            return true
        elseif left.fight < right.fight then
            return false
        end
        if left.level > right.level then
            return true
        elseif left.level < right.level then
            return false
        end
    end
    table.sort(data, comp)
end

--国家伤害排序
function WarData:Hurt_sort(data)
    local comp = function(left , right)
        if left.hurt > right.hurt then
            return true
        elseif left.hurt < right.hurt then
            return false
        end

    end
    table.sort(data, comp)
end

--城池伤害排序
function WarData:CityHurt_sort(data)
    local comp = function(left , right)
        if left.hurt > right.hurt then
            return true
        elseif left.hurt < right.hurt then
            return false
        end
    end
    table.sort(data, comp)
end

--获取查看援军
function WarData:getCheckFriend()
    return self.checkFriend
end

--获取国家总伤害信息
function WarData:getWarHurt()
    return self.warHurt
end

--获取国家每日伤害信息
function WarData:getWarHurtDay()
    return self.warHurtDay
end

--获取城池伤害信息
function WarData:getCityHurt()
    return self.cityHurt
end

--获取国家入口信息
function WarData:getRuKou()
    return self.ruKou
end

--获取国家信息
function WarData:getCampInfo()
    return self.campInfo
end

--设置国家公告
function WarData:setNotice(string)
    self.notice = string
end

--获取国家公告
function WarData:getNotice()
    return self.notice 
end

--获取皇帝名字
function WarData:getHDname()
    return self.HDname 
end

--获取世界地图城池信息
function WarData:getMapInfo()
    return self.mapInfo 
end

--每个城池信息
function WarData:getCityInfo()
    return self.cityInfo 
end

-- --获取世界地图城池信息
-- function WarData:getStrongholdInfo()
--     return self.strongholdInfo 
-- end

--获取所有据点信息
function WarData:getStrongholdInfo()
    return self.strongholdInfo 
end

--获取单个据点信息
function WarData:getOneStronghold()
    return self.oneStrongholdInfo 
end

--国家库房
function WarData:getWarShop()
    return self.WarShop 
end



return WarData