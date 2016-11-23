--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local ShopPopView = class("ShopPopView", BasePopView)

local Functions = require("app.common.Functions")

ShopPopView.csbResPath = "lk/csb"
ShopPopView.debug = true
ShopPopView.studioSpriteFrames = {"IntegralShopUI_Text" }
--@auto code head end
--@Pre loading
ShopPopView.spriteFrameNames = 
    {
    }

ShopPopView.animaNames = 
    {
    }

local ShopData = require("app.gameData.ShopData")
--@auto code uiInit
--add spriteFrames
if #ShopPopView.studioSpriteFrames > 0 then
    ShopPopView.spriteFrameNames = ShopPopView.spriteFrameNames or {}
    table.insertto(ShopPopView.spriteFrameNames, ShopPopView.studioSpriteFrames)
end
function ShopPopView:onInitUI()

    --output list
    self._Sprite_shop_pop_bg_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg")
	self._Text_buy_count_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_buy_count")
	self._Text_expend_type_bao_num_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_expend_type_bao_num")
	self._Text_pop_cargo_name_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_pop_cargo_name")
	self._Image_Pop_head_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Image_Pop_head")
	self._Text_have_count_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_have_count")
	self._Text_Pop_info_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_Pop_info")
	self._Text_have_text_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_have_text")
	self._Image_buy_2_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Button_Pop_buy"):getChildByName("Image_buy_2")
	self._Image_expend_type_bao_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Image_expend_type_bao")
	
    --label list
    
    --button list
    self._Panel_2_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Panel_2")
	self._Panel_2_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_2Click), "zoom"))

	self._Button_Pop_buy_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_shop_pop_bg"):getChildByName("Button_Pop_buy")
	self._Button_Pop_buy_t:onTouch(Functions.createClickListener(handler(self, self.onButton_pop_buyClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin


--@auto code Button_pop_buy btFunc
function ShopPopView:onButton_pop_buyClick()
    Functions.printInfo(self.debug,"Button_pop_buy button is click!")
    --购买接口
    if self.shopType == 2 then
        self:sendUnionBuyShop()
    elseif self.shopType == 3 then
        self:senWarBuyShop()
    else
        self:sendBuyShop()
    end

end
--@auto code Button_pop_buy btFunc end

--@auto code Panel_2 btFunc
function ShopPopView:onPanel_2Click()
    Functions.printInfo(self.debug,"Panel_2 button is click!")
    if self.shopModel.m_ItemType == 1 or self.shopModel.m_ItemType == 5 then--1为武将卡
        --打开二级界面
        self._controller_t:openChildView("app.ui.popViews.CardInfoPopView", { data = {self.shopModel.m_ItemID, 3}, isRemove = false })
    end

end
--@auto code Panel_2 btFunc end

--@auto button backcall end


--@auto code output func
function ShopPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function ShopPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	
    assert(data, "param is nil error")

    self.shopModel = data.datas
    self.shopType = data.shopType
    
    --local shopTwo = self.shopModel.eventAttr
    local heroNode = nil
    local have_count = 0
    if self.shopModel.m_ItemType == 4 then--4为道具
        heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = self.shopModel.m_ItemID})
        self._Text_pop_cargo_name_t:setText(ConfigHandler:getPropNameOfId(self.shopModel.m_ItemID))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getPropInfOfId(self.shopModel.m_ItemID))
        
        --已经有的个数
        have_count = PropData:getPropNumOfId(self.shopModel.m_ItemID)
        if self.shopModel.m_ItemID == -2 then
            have_count = PlayerData.eventAttr.m_gold
        elseif self.shopModel.m_ItemID == -3 then
            have_count = PlayerData.eventAttr.m_money
        elseif self.shopModel.m_ItemID == -4 then
            have_count = PlayerData.eventAttr.m_energy
        elseif self.shopModel.m_ItemID == -5 then
            have_count = PlayerData.eventAttr.m_soul
        elseif self.shopModel.m_ItemID == -6 then
            have_count = PlayerData.eventAttr.m_hunjing
        elseif self.shopModel.m_ItemID == -7 then

        elseif self.shopModel.m_ItemID == -8 then
            have_count = PlayerData.eventAttr.m_nengliang
        end
    elseif self.shopModel.m_ItemType == 1 then--1为武将卡
        heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = self.shopModel.m_ItemID})
        
        self._Text_pop_cargo_name_t:setText(ConfigHandler:getHeroNameOfId(self.shopModel.m_ItemID))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getHeroDescriptionId(self.shopModel.m_ItemID))
        have_count = HeroCardData:getHaveHero(self.shopModel.m_ItemID)
    elseif self.shopModel.m_ItemType == 5 then--1为武将卡碎片
        heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = self.shopModel.m_ItemID})
        
        self._Text_pop_cargo_name_t:setText(ConfigHandler:getHeroNameOfId(self.shopModel.m_ItemID))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getHeroDescriptionId(self.shopModel.m_ItemID))
        have_count = CompoundData:getCompoundDatanNum(self.shopModel.m_ItemID)
    end
    
    Functions.copyParam(self._Image_Pop_head_t, heroNode)
    self._Image_Pop_head_t:setVisible(false)
    self._Sprite_shop_pop_bg_t:addChild(heroNode)
    
    self._Image_expend_type_bao_t:ignoreContentAdaptWithSize(true)
    if self.shopType == 2 then
        Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/gongxian.png")
    elseif self.shopType == 3 then
        Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/fenglu.png")
    else
        if self.shopModel.m_MoneyType == 1 then--1为元宝
            Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/bao.png")
        elseif self.shopModel.m_MoneyType == 2 then--2为铜钱
            Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/jinbi.png")
        elseif self.shopModel.m_MoneyType == 3 then--2为铜钱
            Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/hunjin.png")
        end
    end

    --已经有的个数
    Functions.initLabelOfString(self._Text_have_count_t, tostring(have_count))
    self._Text_buy_count_t:setText(tostring(self.shopModel.m_ItemNum))
    self._Text_expend_type_bao_num_t:setText(tostring(self.shopModel.m_ItemPrice))
end

function ShopPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

--购买国战商品
function ShopPopView:senWarBuyShop()

    local onWarShop = function(event)
        PlayerData.eventAttr.m_fenglu = event.data.fenglu
        local item = event.data.goods
        Functions:addItemResources( {id = item[1], type = item[2], count = item[3], slot = item[4]} )

        self._controller_t:closeChildView(self)
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
    end
    
    local oo = self.shopModel
    NetWork:addNetWorkListener({ 30, 10 }, Functions.createNetworkListener(onWarShop,true,"ret"))
    NetWork:sendToServer({ idx = { 30, 10 }, index = self.shopModel.m_Idx})
end

--购买公会商店物品
function ShopPopView:sendUnionBuyShop()

    local onShop = function(event)
        if event.reqtype == 40 then
            if event.ret == 1 then
                PlayerData.eventAttr.m_actif = event.data.actif
                local itemInfo = UnionData:getShopInfo()[self.shopModel.m_Idx]
                itemInfo.m_curCount = itemInfo.m_curCount + 1
                local item = event.data.item
                Functions:addItemResources( {id = item[1], type = item[2], count = item[3], slot = item[4]} )
                --公会等级提升的监听
                GameEventCenter:dispatchEvent({ name = UnionData.UNION_BUY_EVENT, data = {idx = self.shopModel.m_Idx} })
                self._controller_t:closeChildView(self)
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
            else
                --弹出报错信息
                PromptManager:openTipPrompt(ConfigHandler:getServerErrorCode(event.ret))
            end
            return true
        end
    end
    NetWork:addNetWorkListener({ 7, 1 }, onShop)
    NetWork:sendToServer({ idx = { 7, 1 }, reqtype = 40, data = {index = self.shopModel.m_flag} })

end
--购买商城物品
function ShopPopView:sendBuyShop()
    Functions.printInfo(self.debug,"sendBuyShop")
    local onBuyShop = function (event)

        Functions.playSound("get_loot.mp3")
        ShopData:clearShopData()--清空商城数据
        --埋点
        if PlayerData.eventAttr.m_gold > event.gold then
            Functions.callAnySdkFuc(function()
                Analytics:onPurchase({event.goodID, event.goodtype ,event.goodcount}, tostring(math.floor((PlayerData.eventAttr.m_gold - event.gold)/event.goodcount)))
            end)
        end
        PlayerData.eventAttr.m_gold = event.gold
        PlayerData.eventAttr.m_money = event.money
        PlayerData.eventAttr.m_hunjing = event.hunjing
--            if self.shopModel.eventAttr.m_BuyCount ~= nil then
--                self.shopModel.eventAttr.m_BuyCount = self.shopModel.eventAttr.m_BuyCount + self.buyCount
--            end
        if self.shopModel.m_ItemType == 1 then
            assert(event.goodcount == 1, "input hero card num is error")
        end
        Functions:addItemResources( {id = event.goodID, type = event.goodtype, count = event.goodcount, slot = event.goodslot} )
        
        
        --购买后数据更新监听
        GameEventCenter:dispatchEvent({ name = ShopData.BUY_REFRESH_CHANGE, data = {} })
--            --道具的添加
--            if self.shopModel.m_ItemType == 1 then
--                --添加武将卡
--                local ooooo = event.amount
--                for i = 1, event.amount do
--                	HeroCardData:addCard({slot = event.slot[i],id = self.shopModel.m_ItemID})
--                end
--            else
--                --添加道具
--                PropData:addProp({m_id = self.shopModel.m_ItemID, m_count = event.amount})
--            end
        self._controller_t:closeChildView(self)
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
    end

    NetWork:addNetWorkListener({ 5, 12 }, Functions.createNetworkListener(onBuyShop,true,"ret"))
    NetWork:sendToServer({ idx = { 5, 12 }, index = self.shopModel.m_Idx})
end

return ShopPopView