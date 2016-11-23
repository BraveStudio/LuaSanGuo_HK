--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local WarWorldMapViewController = class("WarWorldMapViewController", BaseViewController)

local Functions = require("app.common.Functions")

WarWorldMapViewController.debug = true
WarWorldMapViewController.modulePath = ...
WarWorldMapViewController.studioSpriteFrames = {"WarUI_Text" }
--@auto code head end

--@Pre loading
WarWorldMapViewController.spriteFrameNames = 
    {
    }

WarWorldMapViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #WarWorldMapViewController.studioSpriteFrames > 0 then
    WarWorldMapViewController.spriteFrameNames = WarWorldMapViewController.spriteFrameNames or {}
    table.insertto(WarWorldMapViewController.spriteFrameNames, WarWorldMapViewController.studioSpriteFrames)
end
function WarWorldMapViewController:onDidLoadView()

    --output list
    self._ScrollView_guild_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild")
	self._Panel_city_bg_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Panel_city_bg")
	self._Image_guild_map_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Panel_city_bg"):getChildByName("Image_guild_map")
	self._ProjectNode_100_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("ProjectNode_100")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_rank_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("Button_rank")
	self._Button_rank_t:onTouch(Functions.createClickListener(handler(self, self.onButton_rankClick), "zoom"))

	self._Button_rank_day_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("Button_rank_day")
	self._Button_rank_day_t:onTouch(Functions.createClickListener(handler(self, self.onButton_rank_dayClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_city_1 btFunc
function WarWorldMapViewController:onButton_city_1Click()
    Functions.printInfo(self.debug,"Button_city_1 button is click!")
end
--@auto code Button_city_1 btFunc end

--@auto code Panel_prize_1 btFunc
function WarWorldMapViewController:onPanel_prize_1Click()
    Functions.printInfo(self.debug,"Panel_prize_1 button is click!")
end
--@auto code Panel_prize_1 btFunc end

--@auto code Button_back btFunc
function WarWorldMapViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    WarData:sendCityLeave()
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_help btFunc
function WarWorldMapViewController:onButton_helpClick()
    Functions.printInfo(self.debug,"Button_help button is click!")
end
--@auto code Button_help btFunc end

--@auto code Button_rank btFunc
function WarWorldMapViewController:onButton_rankClick()
    Functions.printInfo(self.debug,"Button_rank button is click!")
    WarData:sendWarRank(handler(self, self.listRank))
end
--@auto code Button_rank btFunc end

--@auto code Button_rank_day btFunc
function WarWorldMapViewController:onButton_rank_dayClick()
    Functions.printInfo(self.debug,"Button_rank_day button is click!")
    WarData:sendWarRank_Day(handler(self, self.listRankDay))
end
--@auto code Button_rank_day btFunc end

--@auto button backcall end


--@auto code view display func
function WarWorldMapViewController:onCreate()
    Functions.printInfo(self.debug_b," WarWorldMapViewController controller create!")
end

function WarWorldMapViewController:onDisplayView()
	Functions.printInfo(self.debug_b," WarWorldMapViewController view enter display!")
    Functions.loadImageWithWidget(self._Image_guild_map_t,"map/worldMap.jpg")
    Functions.initResNodeUI(self._ProjectNode_100_t,{ "fenglu" })
    
    if PlayerData.eventAttr.m_camp == 1 then
        self:moveBtCenter(self._Panel_city_bg_t:getChildByName("ProjectNode_21"):getChildByName("model"))
    elseif PlayerData.eventAttr.m_camp == 2 then
        self:moveBtCenter(self._Panel_city_bg_t:getChildByName("ProjectNode_4"):getChildByName("model"))
    elseif PlayerData.eventAttr.m_camp == 3 then
        self:moveBtCenter(self._Panel_city_bg_t:getChildByName("ProjectNode_26"):getChildByName("model"))
    end
     --:getChildByName("Image_city")
	local mapInfo = WarData:getMapInfo()
    for k,v in pairs(mapInfo) do
        local nodeStr = string.format("ProjectNode_%d", v.id)
        local node = self._Panel_city_bg_t:getChildByName(nodeStr)
        self:showNode(node, v)
    end
    
        --战斗状态改变
    local onCityChange = function(event)
        local mapInfo = WarData:getMapInfo()
        for k,v in pairs(mapInfo) do
            local nodeStr = string.format("ProjectNode_%d", v.id)
            local node = self._Panel_city_bg_t:getChildByName(nodeStr)
            self:showNode(node, v)
        end
        
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.CITYC_HANGE, onCityChange)
end
--@auto code view display func end

--城池节点公共函数
function WarWorldMapViewController:showNode(node, data)
    Functions.printInfo(self.debug_b," showNode")
    
    local type = data.camp
    local typePic = data.camp
    if type == 100 then
        typePic = 4
    end
    local pic = string.format("lk/ui_res/%d_%d.png", data.pic, typePic)
    local flag = ""
    if data.camp == 100 then
        flag = "commonUI/res/lk/WarUI/qunxiong_qizi.png"
    elseif data.camp == 1 then
        flag = "commonUI/res/lk/WarUI/wei_qizi.png"
    elseif data.camp == 2 then
        flag = "commonUI/res/lk/WarUI/shu_qizi.png"
    elseif data.camp == 3 then
        flag = "commonUI/res/lk/WarUI/wu_qizi.png"
    end
    
    if data.pic == 2 then
        local widget = node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_flag")
        widget:setPositionX(widget:getPositionX() + 10)
        -- widget:setPositionY(widget:getPositionY() - 10)
    end
    
    local bz = ""
    if data.state == 1 then
        bz = "commonUI/res/icons/gongchengzhanzhong.png"
        node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_BZ"):setVisible(true)
    elseif data.state == 0 then
        bz = "commonUI/res/icons/fangyu.png"
        node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_BZ"):setVisible(true)
    else
        node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_BZ"):setVisible(false)
    end
    Functions.loadImageWithWidget(node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_BZ"), bz)
    Functions.loadImageWithWidget(node:getChildByName("model"):getChildByName("Image_city"):getChildByName("Image_flag"), flag)
    Functions.loadImageWithWidget(node:getChildByName("model"):getChildByName("Image_city"), pic)
    Functions.initLabelOfString(node:getChildByName("model"):getChildByName("Text_name"), data.cityname)
    
    --node:getChildByName("model"):getChildByName("Image_city"):setSwallowTouches(false)
    
    local onImageCity = function(event)
        print("button click")
        --打开城池争夺界面
        WarData:setCityInfo(data.id, handler(self,self.jumpZhengDuo))
    end
    node:getChildByName("model"):getChildByName("Image_city"):onTouch(Functions.createClickListener(onImageCity, "zoom"))
    
end
--跳转到城池争夺界面
function WarWorldMapViewController:jumpZhengDuo(bigId)
    self:openChildView("app.ui.popViews.WarGuanKaPopView",{data={bigId = bigId}})
end

--国家总伤害榜
function WarWorldMapViewController:listRank()
    self:openChildView("app.ui.popViews.WarDamagePopView", {data = {type = 2}})
end

--国家每日伤害榜
function WarWorldMapViewController:listRankDay()
    self:openChildView("app.ui.popViews.WarDamageDayPopView")
end


function WarWorldMapViewController:moveBtCenter(node)
    local pos = node:getWorldPos()
    local size = node:getSize()

    local movePanel= self._ScrollView_guild_t:getInnerContainer()
--    local oooo = movePanel:getPositionX()
--    local fff = self._Panel_city_bg_t:getContentSize().height
--    
--    local hhhh = movePanel:getPositionY()
--    
--    local Xwidth  = (movePanel:getPositionX() + (display.width/2 - pos.x))
--    local Xnum = -self._Panel_city_bg_t:getContentSize().width + display.width
    
    movePanel:setPositionX(self:limitValue(display.width - movePanel:getSize().width, 0, movePanel:getPositionX() + (display.width/2 - pos.x)))
    movePanel:setPositionY(self:limitValue(display.height - movePanel:getSize().height, 0, movePanel:getPositionY() + (display.height/2 - pos.y)))
    
--    movePanel:setPositionX(movePanel:getPositionX() + (display.width/2 - pos.x))
--    movePanel:setPositionY(movePanel:getPositionY() + (display.height/2 - pos.y))
--    if (movePanel:getPositionX() + (display.width/2 - pos.x)) < (-self._Panel_city_bg_t:getContentSize().width + display.width) then
--         movePanel:setPositionX(-(self._Panel_city_bg_t:getContentSize().width - display.width))
--     end
--    
--     if (movePanel:getPositionY() + (display.height/2 - pos.y)) < (-self._Panel_city_bg_t:getContentSize().height + display.height) then
--         movePanel:setPositionY(-(self._Panel_city_bg_t:getContentSize().height - display.height))
--     end
    

end

function WarWorldMapViewController:limitValue(min, max, value)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end

return WarWorldMapViewController