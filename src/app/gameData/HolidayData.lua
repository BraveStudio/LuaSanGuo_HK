local BaseModel = require("app.baseMVC.BaseModel")

local HolidayData = class("HolidayData", BaseModel)


HolidayData.debug = false

HolidayData.TeJia = {}
HolidayData.XiaoFei = {}
HolidayData.ZhengBa = {}
HolidayData.eventAttr.XiaoFeiBZ = 0
--各项活动是否开启
HolidayData.jrth_BZ = false
HolidayData.xffl_BZ = false
HolidayData.zhzb_BZ = false


function HolidayData:init()
    self.super.init(self)
end

--开启各个功能的标志
function HolidayData:openBZ(listener)

    if TimerManager:getCurrentSecond() > PlayerData.eventAttr.jrth_st and TimerManager:getCurrentSecond() < PlayerData.eventAttr.jrth_et then
        HolidayData.jrth_BZ = true
    else
        HolidayData.jrth_BZ = false
    end
    if TimerManager:getCurrentSecond() > PlayerData.eventAttr.xffl_st and TimerManager:getCurrentSecond() < PlayerData.eventAttr.xffl_et then
        HolidayData.xffl_BZ = true
    else
        HolidayData.xffl_BZ = false
    end
    if TimerManager:getCurrentSecond() > PlayerData.eventAttr.zhzb_st and TimerManager:getCurrentSecond() < PlayerData.eventAttr.zhzb_et then
        HolidayData.zhzb_BZ = true
    else
        HolidayData.zhzb_BZ = false
    end
    listener()
end

--同步消费标志
local onXiaoFeiBZ = function(event)
    HolidayData.eventAttr.XiaoFeiBZ = 1
end
NetWork:addNetWorkListener({ 35, 7 }, onXiaoFeiBZ)

--同步消费数据
local onXiaoFei = function(event)
    HolidayData.XiaoFei = event.data
    for n,m in ipairs(HolidayData.XiaoFei.goods) do
        if m.bz == 1 then
            HolidayData.eventAttr.XiaoFeiBZ = 1
            break
        end
    end
end
NetWork:addNetWorkListener({ 35, 6 }, onXiaoFei)

--查看节日特价
function HolidayData:sendTeJia(listener)
    --监听服务器数据
    local onServerRequest = function (event)
        HolidayData.TeJia = event.data
        self:openBZ(listener)
    end
    NetWork:addNetWorkListener({35,1}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {35, 1}}
    NetWork:sendToServer(msg)
end

--购买节日特价
function HolidayData:sendGetTeJia(listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end
        PlayerData.eventAttr.m_money = event.money
        PlayerData.eventAttr.m_gold = event.gold
        PlayerData.eventAttr.m_hunjing = event.hunjing
        local datas = HolidayData:getTeJia()
        datas.curNum = datas.curNum + 1

        --弹出提示信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
        listener()
    end
    NetWork:addNetWorkListener({35,2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {35, 2}}
    NetWork:sendToServer(msg)
end

--查看今日消费
function HolidayData:sendXiaoFei()
    --监听服务器数据
    local onServerRequest = function (event)
        HolidayData.XiaoFei = event.data
        for n,m in ipairs(HolidayData.XiaoFei.goods) do
            if m.bz == 1 then
                HolidayData.eventAttr.XiaoFeiBZ = 1
                break
            end
        end
    end
    NetWork:addNetWorkListener({35,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {35, 3}}
    NetWork:sendToServer(msg)
end

--领取今日消费
function HolidayData:sendGetXiaoFei(idx, listener)
    --监听服务器数据
    local onServerRequest = function (event)
        for k,v in pairs(event.data) do
            local item = {id = v[1], type = v[2], count = v[3], slot = v[4]}
            Functions:addItemResources(item)
        end

        local bbb = HolidayData.XiaoFei
        for n,m in ipairs(HolidayData.XiaoFei.goods) do
            if idx == n then
                HolidayData.XiaoFei.goods[idx].bz = 2
                break
            end
        end
        HolidayData.eventAttr.XiaoFeiBZ = 0
        for n,m in ipairs(HolidayData.XiaoFei.goods) do
            if m.bz == 1 then
                HolidayData.eventAttr.XiaoFeiBZ = 1
                break
            end
        end
        listener()
    end
    NetWork:addNetWorkListener({35,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {35, 4},index = idx}
    NetWork:sendToServer(msg)
end

--查看今日消费
function HolidayData:sendZhengBa()
    --监听服务器数据
    local onServerRequest = function (event)
        HolidayData.ZhengBa = event.data
    end
    NetWork:addNetWorkListener({35,5}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {35, 5}}
    NetWork:sendToServer(msg)
end

--获取节日特惠数据
function HolidayData:getTeJia()
    return HolidayData.TeJia
end

--获取消费返利数据
function HolidayData:getXiaoFei()
    return HolidayData.XiaoFei
end

--获取消费标志
function HolidayData:getXiaoFeiBZ()
    return HolidayData.eventAttr.XiaoFeiBZ
end

--获取争霸数据
function HolidayData:getZhengBa()
    return HolidayData.ZhengBa
end


--获取活动是否开启数据
function HolidayData:get_jrth_BZ()
    return HolidayData.jrth_BZ
end
function HolidayData:get_xffl_BZ()
    return HolidayData.xffl_BZ
end
function HolidayData:get_zhzb_BZ()
    return HolidayData.zhzb_BZ
end

return HolidayData