--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SquadPopView = class("SquadPopView", BasePopView)

local Functions = require("app.common.Functions")

SquadPopView.csbResPath = "lk/csb"
SquadPopView.debug = true
SquadPopView.studioSpriteFrames = {"SquadPopUI","CC_comHead","SquadPopUI_Text" }
--@auto code head end


--@Pre loading
SquadPopView.spriteFrameNames = 
    {
        "headPilistRes", "CC_comHead"
    }

SquadPopView.animaNames = 
    {
    }

--@auto code uiInit
--add spriteFrames
if #SquadPopView.studioSpriteFrames > 0 then
    SquadPopView.spriteFrameNames = SquadPopView.spriteFrameNames or {}
    table.insertto(SquadPopView.spriteFrameNames, SquadPopView.studioSpriteFrames)
end
function SquadPopView:onInitUI()

    --output list
    self._Panel_1_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_1")
	self._Panel_2_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_2")
	self._Panel_3_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_3")
	self._Panel_4_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_4")
	self._Panel_5_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_5")
	self._Panel_6_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Panel_6")
	self._ListView_squad_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("ListView_squad")
	
    --label list
    
    --button list
    self._Button_set_close_t = self.csbNode:getChildByName("Panel_squad"):getChildByName("Button_set_close")
	self._Button_set_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_set_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_set_close btFunc
function SquadPopView:onButton_set_closeClick()
    Functions.printInfo(self.debug,"Button_set_close button is click!")
    self.close(self)
end
--@auto code Button_set_close btFunc end

--@auto button backcall end


--@auto code output func
function SquadPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function SquadPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
	--初使化阵型类型为1
    self.SquadType = 1
    self:show()
    local onPanel1 = function()
        print("panel 1 click")
        if self.SquadType ~= 1 then
            self.SquadType = 1
        end
        self:show()
    end
    local onPanel2 = function()
        print("panel 1 click")
        if self.SquadType ~= 2 then
            self.SquadType = 2
        end
        self:show()
    end
    local onPanel3 = function()
        print("panel 1 click")
        if self.SquadType ~= 3 then
            self.SquadType = 3
        end
        self:show()
    end
    local onPanel4 = function()
        print("panel 1 click")
        if self.SquadType ~= 4 then
            self.SquadType = 4
        end
        self:show()
    end
    local onPanel5 = function()
        print("panel 1 click")
        if self.SquadType ~= 5 then
            self.SquadType = 5
        end
        self:show()
    end
    local onPanel6 = function()
        print("panel 1 click")
        if self.SquadType ~= 6 then
            self.SquadType = 6
        end
        self:show()
    end
    Functions.initTabCom({ { self._Panel_1_t, onPanel1, true }, { self._Panel_2_t, onPanel2}, { self._Panel_3_t, onPanel3}, 
        { self._Panel_4_t, onPanel4}, { self._Panel_5_t, onPanel5},{ self._Panel_6_t, onPanel6}})
end

function SquadPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function SquadPopView:showList(SquadData)
    Functions.printInfo(self.debug,"showList ")


--    for m,data in ipairs(SquadData) do
--        local nodeStr = string.format("ProjectNode_%d",m)
--        local ban = self._ScrollView_squad_t:getChildByName(nodeStr):getChildByName("model_1"):getChildByName("Image_ban")
--        local text = string.format(LanguageConfig.language_squad_1, m)
--        ban:getChildByName("Text_cargo_name"):setText(text)
--
--        for k,v in pairs(data) do
--               local str = string.format("Image_%d", k)
--               local node = ban:getChildByName(str):getChildByName("model")
--
--               --武将头像
--               Functions.initHeroHeadWidget(node:getChildByName("heroView"), v)
--               --武将类型
--               Functions.initHeroType(node, v)
--               --武将名字
--               Functions.initHeroName(node:getChildByName("name"),v)
--               --国家
--               local countryResTable = {"card_shu.png","card_wu.png","card_wei.png","card_qun.png"}
--               local countryId = ConfigHandler:getHeroCountryOfId(v)  
--               Functions.loadImageWithWidget(node:getChildByName("Camp"), "tyj/uiFonts_res/" .. countryResTable[countryId])
--               
--               
--               local onShopBut = function(event)
--                   self._controller_t:openChildView("app.ui.popViews.CardInfoPopView", { data = {v, 3}, isRemove = false })
--               end
--               ban:getChildByName(str):onTouch(Functions.createClickListener(onShopBut, "zoom"))
--        end
--    end

    
    
    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        
        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        local text = string.format(LanguageConfig.language_squad_1, index)
        ban:getChildByName("Text_cargo_name"):setText(text)
        
        --显示武将头像信息
        local heroData ={ m_id = data[1]}
        for k,v in pairs(data) do
            local node = Functions.createHead(v)
            local str = string.format("Image_%d", k)
            -- local size = ban:getChildByName(str):getContentSize()
            -- node:setPosition(size.width/2, size.height/2)
            -- ban:getChildByName(str):addChild(node)
            local node = ban:getChildByName(str):getChildByName("model")

            --武将头像
            Functions.initHeroHeadWidget(node:getChildByName("heroView"), v)
            --武将类型
            Functions.initHeroType(node, v)
            --武将名字
            Functions.initHeroName(node:getChildByName("name"),v)
            --国家
            local countryResTable = {"card_shu.png","card_wu.png","card_wei.png","card_qun.png"}
            local countryId = ConfigHandler:getHeroCountryOfId(v)  
            Functions.loadImageWithWidget(node:getChildByName("Camp"), "tyj/uiFonts_res/" .. countryResTable[countryId])
            
            
            local onShopBut = function(event)
                self._controller_t:openChildView("app.ui.popViews.CardInfoPopView", { data = {v, 3}, isRemove = false })
            end
            ban:getChildByName(str):onTouch(Functions.createClickListener(onShopBut, "zoom"))
        end
    end
    --绑定响应事件函数
    Functions.bindArryListWithData(self._ListView_squad_t,{ firstData = SquadData }, listHandler,{direction = true,col = 1,firstSegment = 3,segment = 10})
    
end

function SquadPopView:show()
    
    self:showList(ConfigHandler:getSquadInfos(self.SquadType))
end

return SquadPopView