local BaseModel = require("app.baseMVC.BaseModel")

local HeroSoulData = class("HeroSoulData", BaseModel)

HeroSoulData.debug = false

HeroSoulData.heroSoulInf = {}
HeroSoulData.HeroSoulData = {}
HeroSoulData.heroSoulApparel = {}
HeroSoulData.heroSoulApparel = {}
HeroSoulData.heroSoulApparel[1] = {0,0,0,0,0,0}
HeroSoulData.heroSoulApparel[2] = {0,0,0,0,0,0}
HeroSoulData.heroSoulApparel[3] = {0,0,0,0,0,0}
HeroSoulData.heroSoulUpgradeData = {0,0,0,0,0,0}
HeroSoulData.heroSoulBook = {}
HeroSoulData.heroSoulAttrType= 
{
    attack = 1,
    hp = 2,
    faf = 3,
    fas = 4,
    jm = 5,
    dk = 6
}
function HeroSoulData:init()
    self.super.init(self)

   local heroSoulInfHandler = function(event)
       local data = event.heroSoulData
      
      if data == nil then
       return false
      end
      HeroSoulData.heroSoulInf = {}
      for k, v in pairs(data) do
           local heroSoulInf = {id = v.m_id,mark = k,level = v.m_level,atkFormFlag = v.m_sign,exp = v.m_exp}
           self:addheroSoul(heroSoulInf)
      end
   end
   NetWork:addNetWorkListener({ 2, 6 }, heroSoulInfHandler)                                     
    local heroSoulApparelHandler = function(event)
        local data = event.data
        self.heroSoulBook = event.data.jhBook
        for i=1,3 do
            for j=1,6 do 
                HeroSoulData.heroSoulApparel[i][j] = data.m_heroSoulList[i][j]
            end
        end
    end
    NetWork:addNetWorkListener({ 2, 31 }, heroSoulApparelHandler)


    --  GameEventCenter:addEventListener(PlayerData.PLAYER_LOGOUT_EVENT, function ( )
    --     HeroSoulData.heroSoulInf = {}       
    -- end)
end
function HeroSoulData:packageApparelHeroSoul()
    local packageData = {}
    for k,v in pairs(self.heroSoulApparel) do
        local tempData = {}
        for i , j in pairs(v) do 
            local heroSoulInf = self:getHeroSoulInf(j)
            if heroSoulInf ~= nil then 
                tempData[#tempData + 1] = {m_id = heroSoulInf.id , m_level = heroSoulInf.level}
            end
        end
        if tempData ~= {} then
            packageData[#packageData + 1] = tempData
        end
    end
    return packageData
end
--判断一个将魂是否在图鉴中
function HeroSoulData:isInHeroSoulBook(id)
    for k,v in pairs(self.heroSoulBook) do 
        if v == id then 
            return true
        end
    end
    return false
end
--发送升级将魂接口
function HeroSoulData:requestUpgradeheroSoul(mark,addMarks,handler)
    local onServerRequest = function (event)
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({31,2}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    
    local msg = {idx = {31, 2}, slots = self:markHandler(addMarks), target = mark}
    NetWork:sendToServer(msg)
end
function HeroSoulData:markHandler(marks)
    local handlerMarks = {}
    for k,v in pairs(marks) do
        if v > 0 then
            handlerMarks[#handlerMarks + 1] = v
        end
    end
    return handlerMarks
end
--设置将魂经验和等级
function HeroSoulData:setExpAndLevel(mark,level,exp)
    local heroSoulInf = self:getHeroSoulInf(mark)
    heroSoulInf.level = level
    heroSoulInf.exp = exp
end
--自动添加升级材料
function HeroSoulData:autoAddUpgradeHeroSoul(mark)
    self:cleanHeroSoulUpgradeData()
    local unAppareledHeroSoulData =  self:getHeroSoulWithoutAppareled(self.heroSoulInf)
    local needData = self:filterHeroSoulOfQuality(unAppareledHeroSoulData,3)
    needData = self:filterHeroSoulDataOfMark(needData,mark)
    for i = 1,#needData do
        if i <= 6 then 
            self.heroSoulUpgradeData[i] = needData[i].mark
        end
    end
end
function HeroSoulData:cleanHeroSoulUpgradeData()
    for i=1,#self.heroSoulUpgradeData do
        self.heroSoulUpgradeData[i] = 0
    end
end
--获取升级材料的exp
function HeroSoulData:getHeroSoulUpgradeExp()
    local exp = 0
    for i=1,#self.heroSoulUpgradeData do 
        if self.heroSoulUpgradeData[i] > 0 then 
            local heroSoulInf = self:getHeroSoulInf(self.heroSoulUpgradeData[i])
            local quality = ConfigHandler:getHeroSoulQualityOfId(heroSoulInf.id)
            exp = exp + g_jhcfg.cardExp[quality][heroSoulInf.level]
        end
    end
    return exp
end
--过滤掉品质指定品质以上的将魂
function HeroSoulData:filterHeroSoulOfQuality(heroSoulData,quality)
    local filterData = {}
    for k,v in pairs(heroSoulData) do
        if ConfigHandler:getHeroSoulQualityOfId(v.id) <= quality then 
            filterData[#filterData+1] = v
        end
    end
    return filterData
end
--过滤已经添加到升级材料的将魂
function HeroSoulData:filterHeroSoulOfUpgrade(heroSoulData)
    local filterData = {}
    for k,v in pairs(heroSoulData) do
        if not self:isInUpgradeHeroSoul(v.mark) then
            filterData[#filterData+1] = v
        end
    end
    return filterData
end
function HeroSoulData:isInUpgradeHeroSoul(mark)
    for k,v in pairs(self.heroSoulUpgradeData) do
        if mark == v then 
            return true
        end
    end
    return false
end
--发送替换装备
function HeroSoulData:requestReplaceheroSoul(inf,handler)
    --监听服务器数据
    -- handler()
    local onServerRequest = function (event)
        if handler ~= nil then
            handler()
        end
    end
    NetWork:addNetWorkListener({31,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    
    local msg = {idx = {31, 3}, cardSlot = inf.cardSlot,soldierType = inf.soldierType, fightSlot = inf.fightSlot}
    NetWork:sendToServer(msg)
end
--发送出售将魂命令
function HeroSoulData:requestSellHeroSoul(marks,handler)
    --监听服务器数据
    local onServerRequest = function (event)
        if handler ~= nil then
            handler(event)
        end
    end
    NetWork:addNetWorkListener({31,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {31, 4},slots = marks}
    NetWork:sendToServer(msg)
end

--添加将魂
function HeroSoulData:addheroSoul(heroSoulInf)
    assert(heroSoulInf and heroSoulInf.id > 0 and heroSoulInf.mark > 0,"prama is error")
    self.heroSoulInf[#self.heroSoulInf+1] = require("app.ui.heroSoulSystem.HeroSoulModel").new(heroSoulInf)
end
--移除将魂
function HeroSoulData:miuHeroSoul( mark )
    if mark > 0 then
        local pos = self:getHeroSoulPositoon(mark)
        table.remove(self.heroSoulInf,pos)
    end
end
function HeroSoulData:getHeroSoulIdsOfMarks(marks)
    local ids = {}
    for k, v in pairs(marks) do
        if v > 0 then
            ids[#ids +1] = self:getHeroSoulInf(v).id
        else
            ids[#ids +1] = 0
        end
    end
    return ids
end
--根据mark获得装备在表中位置
function HeroSoulData:getHeroSoulPositoon(mark)
    for i = 1,#self.heroSoulInf do 
        if mark == self.heroSoulInf[i].mark then
            return i
        end
    end
end

--根据指定颜色的筛选装备
function HeroSoulData:getColorNumUpEquip(quality)
    local filterData = {}

    for k,v in pairs(HeroSoulData.heroSoulInf) do 
        if ConfigHandler:getHeroSoulQualityOfId(v.id) <= quality  and v.atkFormFlag == 0 then
            filterData[#filterData+1] = v
        end
    end
    return filterData
end

function HeroSoulData:getHeroSoulPrice(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    local quality = ConfigHandler:getHeroSoulQualityOfId(heroSoulInf.id)
    return g_jhcfg.sellPrice[quality][heroSoulInf.level]
end
function HeroSoulData:getHeroSoulAttr(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    local value = Functions.heroSoulAddAttrHandler(heroSoulInf.id, heroSoulInf.level)
    return value
end
function HeroSoulData:getHeroSoulBaseValue(mark)
   local heroSoulInf = self:getHeroSoulInf(mark)

end
function HeroSoulData:getHeroSoulLevel(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    return heroSoulInf.level
end
function HeroSoulData:isUpgradeAvailable(mark)
    local level = self:getHeroSoulLevel(mark)
    if level < g_jhcfg.maxLevel then 
        return true
    else 
        return false
    end
end
--筛选未穿戴的将魂
function HeroSoulData:getHeroSoulWithoutAppareled(heroSoulData)
    local filterData = {}
    for k,v in pairs(heroSoulData) do 
        if v.atkFormFlag == 0  then
            filterData[#filterData+1] = v
        end
    end
    return filterData
end
--判断一个将魂是否被穿戴上士兵身上
function HeroSoulData:isAppareledOfId(heroSoulId,showType)
    for k,v in pairs(HeroSoulData.heroSoulApparel[showType]) do 
        if v > 0 then 
            if self:getHeroSoulInf(v).id == heroSoulId then 
                return true
            end
        end
    end
    return false
end
--判断将魂是否已被穿戴
function HeroSoulData:isAppareled(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    if heroSoulInf.atkFormFlag > 0 then
        return true 
    else
        return false
    end
end
--对将魂排序处理
function HeroSoulData:sortHeroSoul(heroSoulData)
    local sortTable = {}
    if #heroSoulData > 0 then
        local tempTable1 = Functions.filterDatas(heroSoulData, function(element)
                if element.atkFormFlag > 0 then
                    return false
                else
                    return true 
                end
            end)
        
        local tempTable2 = Functions.filterDatas(heroSoulData, function(element)
            if element.atkFormFlag > 0 then
                return true
            else
                return false 
            end
        end) 
        --根据穿戴标示排序
        table.sort(tempTable2,function(a,b) 
            -- if a.atkFormFlag == b.atkFormFlag then
            --     if a.defFormFlag == b.defFormFlag then
            local a_level = a.level
            local b_level = b.level
            if a_level == b_level then
                local a_stag = ConfigHandler:getHeroSoulQualityOfId(a.id)
                local b_stag = ConfigHandler:getHeroSoulQualityOfId(b.id)
                if a_stag == b_stag then
                    local a_type = ConfigHandler:getHeroSoulTypeOfId(a.id)
                    local b_type = ConfigHandler:getHeroSoulTypeOfId(b.id)
                    if a_type == b_type then                            
                        return a_type > b_type  
                    else
                        return a_type < b_type  
                    end
                else
                    return a_stag > b_stag                            
                end    
            else                        
                return a_level > b_level
            end
               
        end)        
        for i=1,#tempTable1 do
            sortTable[#sortTable+1] = tempTable1[i]
        end
        for i=1,#tempTable2 do
            sortTable[#sortTable+1] = tempTable2[i]
        end
    end
    return sortTable 
end
--根据装备mark清空相应装备位置的装备
function HeroSoulData:cleanHeroSoulAppraleOfMark(mark)
     local atkFormFlag = self:getApparelFlag(mark)
     if atkFormFlag > 0 then
        for i = 1,3 do
            self:setTableElement(HeroSoulData.heroSoulApparel[i],mark,0)
        end
    end 
end
function HeroSoulData:setTableElement(tableObj,element,newValue)
    for i = 1,#tableObj do
        if tableObj[i] == element then
            tableObj[i] = newValue
        end
    end
end
--获取将魂穿戴标示
function HeroSoulData:getApparelFlag(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    return heroSoulInf.atkFormFlag

end
--根据位置设置将魂
function HeroSoulData:setHeroSoulAppareMark(pos,index,mark)
    HeroSoulData.heroSoulApparel[pos][index] = mark
end
--设置穿戴标示
function HeroSoulData:setApparelFalg(pos,index,mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    heroSoulInf.atkFormFlag = pos
end
--过滤指定mark的将魂
function HeroSoulData:filterHeroSoulDataOfMark(heroSoulData,mark)
    local filterData = {}
    for k,v in pairs(heroSoulData) do
        if v.mark ~= mark then 
            filterData[#filterData+1] = v
        end
    end
    return filterData
end
--根据mark查找某个装备信息
function HeroSoulData:getHeroSoulInf(mark)
     for i=1,#self.heroSoulInf do
        if self.heroSoulInf[i].mark == mark then
            return self.heroSoulInf[i]
        end
    end
end
--清空装备所有穿戴标志
function HeroSoulData:cleanApparelFlag(mark)
    local heroSoulInf = self:getHeroSoulInf(mark)
    heroSoulInf.atkFormFlag = 0 
end
return HeroSoulData