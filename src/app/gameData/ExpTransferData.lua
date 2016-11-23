local BaseModel = require("app.baseMVC.BaseModel")
local sharedScheduler = require("app.common.scheduler")

local ExpTransferData = class("ExpTransferData", BaseModel)

ExpTransferData.debug = false

ExpTransferData.EXP_HERO = "EXP_HERO"
--ExpTransferData.MAIL_GET = "MAIL_GET"

--经验转移武将mark
ExpTransferData.markOne = 0
ExpTransferData.markTwo = 0
ExpTransferData.ExpHero = {}
ExpTransferData.itemID = 0


function ExpTransferData:init()
    self.super.init(self)
    self.ExpTransferDatas = {}
end


--curLevel 转移后的等级  curExp 转移后的经验
--发送转移接口
--data = {makeOne = 1, makeTwo = 2, itemId = 1}
function ExpTransferData:SendExpTransfer(datas, listener)
    --发送转移
    local onExp = function(event)
        self.ExpTransferDatas = event.data
        --减少转移丹的数量
        if event.data.id ~= nil then
            local prop = {m_id = event.data.id, m_count = 1}
            PropData:miuProp( prop )
        end

        --接受转移经验的武将数据改变
        local info = HeroCardData:getHeroInfo(self:getMarkTwo())
        info.m_level = event.data.curLevel
        info.m_exp = event.data.curExp
        HeroCardData:updateHeroBaseAttr(self:getMarkTwo())
        
        --被转移经验的武将数据改变
        local info = HeroCardData:getHeroInfo(self:getMarkOne())
        info.m_level = 1
        info.m_exp = 0
        info.m_class = 1
        HeroCardData:updateHeroBaseAttr(self:getMarkOne())
        listener()
        
        --埋点
        Functions.callAnySdkFuc(function()
            Analytics:logEvent("CS", {level = tostring(PlayerData.eventAttr.m_level), proportion = tostring(self:getMaiDianNum())})
        end)
    end

    NetWork:addNetWorkListener({5,31}, Functions.createNetworkListener(onExp,true,"ret"))
    local msg = {idx = {5, 31},  data = datas}
    NetWork:sendToServer(msg)

end

--埋点（记录经验转换百分比）
function ExpTransferData:getMaiDianNum()
    local MaiDianNum = 0
    if ExpTransferData.itemID == 0 then
    	MaiDianNum = 40
    elseif ExpTransferData.itemID == 70 then
        MaiDianNum = 60
    elseif ExpTransferData.itemID == 71 then
        MaiDianNum = 80
    elseif ExpTransferData.itemID == 72 then
        MaiDianNum = 100
    end
    if MaiDianNum == 0 then
        assert(MaiDianNum == 0, "MaiDianNum number is 0")
    end
    return MaiDianNum
end

function ExpTransferData:setMarkOne(mark)
    ExpTransferData.markOne = mark
    ExpTransferData.ExpHero[1] = mark
    return ExpTransferData.markOne
end

function ExpTransferData:setMarkTwo(mark)
    ExpTransferData.markTwo = mark
    ExpTransferData.ExpHero[2] = mark
    return ExpTransferData.markTwo
end

--获得所有转移武将经验
function ExpTransferData:getExpHero()
    return ExpTransferData.ExpHero
end

function ExpTransferData:getMarkOne()
    return ExpTransferData.markOne
end

function ExpTransferData:getMarkTwo()
    return ExpTransferData.markTwo
end

function ExpTransferData:getExpTransferDatas()
    return self.ExpTransferDatas
end

return ExpTransferData