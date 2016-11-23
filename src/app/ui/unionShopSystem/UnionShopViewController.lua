--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local UnionShopViewController = class("UnionShopViewController", BaseViewController)

local Functions = require("app.common.Functions")

UnionShopViewController.debug = true
UnionShopViewController.modulePath = ...
UnionShopViewController.studioSpriteFrames = {"UnionUI_Text","IntegralShopUI","CB_bgup","CB_blackbg","ShopUI_Text" }
--@auto code head end

--@Pre loading
UnionShopViewController.spriteFrameNames = 
    {
    }

UnionShopViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #UnionShopViewController.studioSpriteFrames > 0 then
    UnionShopViewController.spriteFrameNames = UnionShopViewController.spriteFrameNames or {}
    table.insertto(UnionShopViewController.spriteFrameNames, UnionShopViewController.studioSpriteFrames)
end
function UnionShopViewController:onDidLoadView()

    --output list
    self._resNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("resNode")
	self._Text_buy_count_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Text_buy_count")
	self._ListView_shop_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_shop")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_help_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_help")
	self._Button_help_t:onTouch(Functions.createClickListener(handler(self, self.onButton_helpClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_back btFunc
function UnionShopViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_help btFunc
function UnionShopViewController:onButton_helpClick()
    Functions.printInfo(self.debug,"Button_help button is click!")
    NoticeManager:openNotice(self, {type = NoticeManager.UNION_SHOP_INFO})
end
--@auto code Button_help btFunc end

--@auto button backcall end


--@auto code view display func
function UnionShopViewController:onCreate()
    Functions.printInfo(self.debug_b," UnionShopViewController controller create!")
end

function UnionShopViewController:onDisplayView()
	Functions.printInfo(self.debug_b," UnionShopViewController view enter display!")
    Functions.initResNodeUI(self._resNode_t,{ "gongxian" })
    self.widgets ={}
    self._Text_buy_count_t:setText(str)
    self:itemShow()
    
    --公会购买次数的监听
    local onBuy = function(event)
--        
--        local str = tostring(g_csBaseCfg.shopCount - UnionData:getShopBuy_count()).."/"..tostring(g_csBaseCfg.shopCount)
--        self._Text_buy_count_t:setText(str)
        local data = UnionData:getShopInfo()[event.data.idx]
        local str = tostring(data.m_maxCount - data.m_curCount).."/"..tostring(data.m_maxCount)
        self.widgets[event.data.idx]:getChildByName("Text_buy_count_2"):setText(tostring(str))
        if data.m_maxCount - data.m_curCount == 0 then
            self.widgets[event.data.idx]:getChildByName("Image_sold_out"):setVisible(true)
        else
            self.widgets[event.data.idx]:getChildByName("Image_sold_out"):setVisible(false)
        end
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, UnionData.UNION_BUY_EVENT, onBuy)
end
--@auto code view display func end

function UnionShopViewController:itemShow()

    local shopdatas = UnionData:getShopInfo()

    self.widgets = {}
    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        
        self.widgets[#self.widgets + 1] = ban
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")
        local open = widget:getChildByName("Image_ban"):getChildByName("Image_sell_out"):getChildByName("Text_buy_open")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        Functions.initTextColor(banModel:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"),ban:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"))
        local heroNode = nil
        if data.m_ItemType == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.m_ItemID))
            --            Functions.loadImageWithWidget(head, ConfigHandler:getPropImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
            --            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.m_ItemID})
            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.goodtype .. "错误")
        end
        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        --ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
--        if data.m_MoneyType == 1 then--1为元宝
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/gongxian.png")
--        elseif data.m_MoneyType == 2 then--2为铜钱
--            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/jinbi.png")
--        elseif data.m_MoneyType == 3 then--2为铜钱
--            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/hunjin.png")
--        end

        ban:getChildByName("Text_buy_count"):setText(tostring(data.m_ItemNum))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_ItemPrice))
        local str = tostring(data.m_maxCount - data.m_curCount).."/"..tostring(data.m_maxCount)
        ban:getChildByName("Text_buy_count_2"):setText(tostring(str))
        if data.m_maxCount - data.m_curCount == 0 then
            ban:getChildByName("Image_sold_out"):setVisible(true)
        else
            ban:getChildByName("Image_sold_out"):setVisible(false)
        end
        


        local level = UnionData:getUnionInfoData()[1].eventAttr.guild_level
        if data.m_Needlevel > level then
            ban:getChildByName("Image_sell_out"):setVisible(true)
            local str = string.format(LanguageConfig.language_Union_46, data.m_Needlevel)
            open:setText(str)
        else
            ban:getChildByName("Image_sell_out"):setVisible(false)
        end


        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            local level = UnionData:getUnionInfoData()[1].eventAttr.guild_level
            if data.m_Needlevel <= level then
                self:openChildView("app.ui.popViews.ShopPopView", { data = {datas = data ,shopType = 2}})
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_4)
            end

        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))

        if index == 1 then
            self._shopWidget_t = widget:getChildByName("Image_ban")
        end

    end
    --绑定响应事件函数
    Functions.bindArryListWithData(self._ListView_shop_t,{ firstData = shopdatas }, listHandler,{direction = false,col = 2,firstSegment = 3,segment = 10})

end

return UnionShopViewController