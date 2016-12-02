local BaseModel = require("app.baseMVC.BaseModel")

local CarnivalData = class("CarnivalData", BaseModel)


CarnivalData.debug = false

--狂欢标志
CarnivalData.eventAttr.kuangHuanDataBZ = 0

--查看英雄之旅
CarnivalData.lvCheng = {}
CarnivalData.lvChengBZ = false
--查看活跃达人
CarnivalData.HuoYue = {}
CarnivalData.HuoYueBZ = false
--查看今日特价 
CarnivalData.TeJia = {}
--查看今日消费
CarnivalData.XiaoFei = {}
CarnivalData.XiaoFeiBZ = false
CarnivalData.XiaoFeiNum = 0

CarnivalData.TianTiRank = {}        --天梯排名分段
CarnivalData.TianTiStartTime = {}        --天梯开始时间
CarnivalData.TianTiEndTime = {}        --天梯结束时间

function CarnivalData:init()
    self.super.init(self)
end

function CarnivalData:updateBz()
    if CarnivalData.lvChengBZ or CarnivalData.HuoYueBZ or CarnivalData.XiaoFeiBZ then
        CarnivalData.eventAttr.kuangHuanDataBZ = 1
    else
        CarnivalData.eventAttr.kuangHuanDataBZ = 0
    end
end

--所有标志
local onAllBZ = function(event)
    if event.data[1] == "heroTravel" then
    	CarnivalData.lvChengBZ = true
    end
    if event.data[2] == "hydr"then
        CarnivalData.HuoYueBZ = true
    end
    if event.data[3] == "everyConsume" then
        CarnivalData.XiaoFeiBZ = true
    end
    CarnivalData:updateBz()
end
NetWork:addNetWorkListener({ 2, 33 }, onAllBZ)

--英雄之旅标志
local onLvCheng = function(event)
    CarnivalData.lvCheng = g_heroTravelconfig
    for i, v in pairs(event.tb) do
        if CarnivalData.lvCheng[v].day <= PlayerData.eventAttr.day then
            CarnivalData.lvChengBZ = true
            CarnivalData:updateBz()
        end
    end
end
NetWork:addNetWorkListener({ 33, 3 }, onLvCheng)

--活跃达人标志
local onLvCheng = function(event)
    CarnivalData.HuoYueBZ = true
    CarnivalData:updateBz()
end
NetWork:addNetWorkListener({ 33, 7 }, onLvCheng)

--今日消费标志
local onLvCheng = function(event)
    CarnivalData.XiaoFeiBZ = true
    CarnivalData:updateBz()
end
NetWork:addNetWorkListener({ 33, 17 }, onLvCheng)


--发送天梯数据
function CarnivalData:sendTianTi()
    --监听服务器数据
    local onServerRequest = function (event)
        local data = event.data

        CarnivalData.TianTiStartTime = event.data.startTime  --活动开始时间
        CarnivalData.TianTiEndTime = event.data.endTime        --活动结束时间

        CarnivalData.TianTiRank = {}
        for k, v in pairs(data.group) do
            local prop = {id = -7, type = 4, count = v.score}
            v.goods[#v.goods + 1] = prop
            CarnivalData.TianTiRank[#CarnivalData.TianTiRank + 1] = v
        end
    end
    NetWork:addNetWorkListener({20,25}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 25}}
    NetWork:sendToServer(msg)
end

--查看英雄之旅
function CarnivalData:sendLvCheng(listener)
    --监听服务器数据
    local onServerRequest = function (event)
        CarnivalData.lvCheng = g_heroTravelconfig
        for k,v in pairs(event.data) do
            print("kkkkkkkkkkkkkk",k)
            assert(CarnivalData.lvCheng[k].bz,"CarnivalData.lvCheng[k].bz————无数据")
            CarnivalData.lvCheng[k].bz = v
        end
        listener()
    end
    NetWork:addNetWorkListener({33,1}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 1}}
    NetWork:sendToServer(msg)
end

--领取英雄之旅
function CarnivalData:sendGetLvCheng(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
    
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end

        CarnivalData.lvCheng[idx].bz = 2
        CarnivalData.lvChengBZ = false
        for n,m in pairs(CarnivalData.lvCheng) do
            if m.bz == 1 and m.day <= PlayerData.eventAttr.day then
                CarnivalData.lvChengBZ = true
            end
        end
        self:updateBz()
        listener()
    end
    NetWork:addNetWorkListener({33,2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 2},index = idx}
    NetWork:sendToServer(msg)    
end


--查看活跃达人
function CarnivalData:sendHuoYue()
    --监听服务器数据
    local onServerRequest = function (event)
        CarnivalData.HuoYue = g_hydrconfig
        for k,v in pairs(event.data) do
            assert(CarnivalData.HuoYue[k].bz,"CarnivalData.HuoYue[k].bz————无数据")
            CarnivalData.HuoYue[k].bz = v
        end
    end
    NetWork:addNetWorkListener({33,5}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 5}}
    NetWork:sendToServer(msg)
end

--领取活跃达人
function CarnivalData:sendGetHuoYue(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end

        CarnivalData.HuoYue[idx].bz = 2
        CarnivalData.HuoYueBZ = false
        for n,m in pairs(CarnivalData.HuoYue) do
            if m.bz == 1 and m.day == PlayerData.eventAttr.day then
                CarnivalData.HuoYueBZ = true
            end
        end
        self:updateBz()
        listener()
    end
    NetWork:addNetWorkListener({33,6}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 6},index = idx}
    NetWork:sendToServer(msg)
end

--查看今日特价
function CarnivalData:sendTeJia()
    --监听服务器数据
    local onServerRequest = function (event)
        CarnivalData.TeJia = g_todayPrice
        for k,v in ipairs(event.data) do
            for n,m in ipairs(CarnivalData.TeJia) do
                if n == k then
                    CarnivalData.TeJia[n].bz = v
                    break
                end
            end
        end
    end
    NetWork:addNetWorkListener({33,10}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 10}}
    NetWork:sendToServer(msg)
end

--领取今日特价
function CarnivalData:sendGetTeJia(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
    
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end
        PlayerData.eventAttr.m_money = event.money
        PlayerData.eventAttr.m_gold = event.gold
        PlayerData.eventAttr.m_hunjing = event.hunjing
        
        for n,m in ipairs(CarnivalData.TeJia) do
            if idx == n then
                CarnivalData.TeJia[idx].bz = 2
                break
            end
        end
        --弹出提示信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
        listener()
    end
    NetWork:addNetWorkListener({33,11}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 11},index = idx}
    NetWork:sendToServer(msg)
end

--查看今日消费
function CarnivalData:sendXiaoFei()
    --监听服务器数据
    local onServerRequest = function (event)
        CarnivalData.XiaoFei = g_everyConsume
        CarnivalData.XiaoFeiNum = event.data.num
        for k,v in ipairs(event.data) do
            for n,m in ipairs(CarnivalData.XiaoFei) do
                if n == k then
                    CarnivalData.XiaoFei[n].bz = v
                    break
                end
            end
        end
    end
    NetWork:addNetWorkListener({33,15}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 15}}
    NetWork:sendToServer(msg)
end

--领取今日消费
function CarnivalData:sendGetXiaoFei(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end

        for n,m in ipairs(CarnivalData.XiaoFei) do
            if idx == n then
                CarnivalData.XiaoFei[idx].bz = 2
                break
            end
        end
        CarnivalData.XiaoFeiBZ = false
        for n,m in ipairs(CarnivalData.XiaoFei) do
            if m.bz == 1 then
                CarnivalData.XiaoFeiBZ = true
            end
        end
        self:updateBz()
        listener()
    end
    NetWork:addNetWorkListener({33,16}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {33, 16},index = idx}
    NetWork:sendToServer(msg)
end


--获取英雄之旅数据
function CarnivalData:getlvCheng(day)
        local data = {} 
        local ppp = CarnivalData.lvCheng
    for k,v in pairs(CarnivalData.lvCheng) do
        if v.day == day then
            data[#data + 1] = v
        end
    end
    
    local comp = function(left , right)
        --id
        if right.id > left.id then
            return true
        elseif right.id < left.id then
            return false
        end
    end
    table.sort(data,comp)
    return data
end
--获取活跃达人数据
function CarnivalData:getHuoYue(day)
    local data = {} 
    for k,v in pairs(CarnivalData.HuoYue) do
        if v.day == day then
            data[#data + 1] = v
    	end
    end
    return data
end

--获取今日特价数据
function CarnivalData:getTeJia(day)
    local data = {} 
    local ppppp = CarnivalData.TeJia
    for k,v in ipairs(CarnivalData.TeJia) do
        if k == day then
            data = v
        end
    end
    return data
end

--获取今日消费数据
function CarnivalData:getXiaoFei()
    return CarnivalData.XiaoFei
end
--获取今日消费元宝数
function CarnivalData:getXiaoFeiNum()
    return CarnivalData.XiaoFeiNum
end

--获取天梯数据
function CarnivalData:getTianTiRank()
    return self.TianTiRank
end


return CarnivalData