local SoulShopData = {}

SoulShopData.debug = false


function SoulShopData:init()

    --魂晶商城主数据
    self.soulShopDatas = {}
    --活动开始时间
    self.timeOpen = {}
    --活动结束时间
    self.timeEnd = {}
end

--清空魂晶商店数据
function SoulShopData:clearSoulShopDatas()
    self.soulShopDatas = {}
end

--index           物品idx
--id            物品id
--type          物品类型
--num           物品数量
--coldtype      购买所用货币的类型
--needlevel     需要等级
--price         价格
--flag          标志（0 不能购买 1 可以购买）

--查看魂晶商城物品
function SoulShopData:sendShop(listener)
    Functions.printInfo(self.debug,"sendShop")
    local onSendShop = function (event)
        local data = event.data.goods
        self.timeOpen = event.data.st
        self.timeEnd = event.data.et
        self.soulShopDatas = data
        listener()
    end
    NetWork:addNetWorkListener({ 32, 1 }, Functions.createNetworkListener(onSendShop,true,"ret"))
    NetWork:sendToServer({ idx = { 32, 1 }})
end

--获取商品数据
function SoulShopData:getSoulShopDatas()
    return self.soulShopDatas
end

--获取结束时间
function SoulShopData:getTimeEnd()
    return self.timeEnd
end

--获取开始时间
function SoulShopData:getTimeOpen()
    return self.timeOpen
end

return SoulShopData