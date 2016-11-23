--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SoulShopPopView = class("SoulShopPopView", BasePopView)

local Functions = require("app.common.Functions")

SoulShopPopView.csbResPath = "lk/csb"
SoulShopPopView.debug = true
SoulShopPopView.studioSpriteFrames = {"IntegralShopUI_Text" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #SoulShopPopView.studioSpriteFrames > 0 then
    SoulShopPopView.spriteFrameNames = SoulShopPopView.spriteFrameNames or {}
    table.insertto(SoulShopPopView.spriteFrameNames, SoulShopPopView.studioSpriteFrames)
end
function SoulShopPopView:onInitUI()

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

--@auto code Panel_2 btFunc
function SoulShopPopView:onPanel_2Click()
    Functions.printInfo(self.debug,"Panel_2 button is click!")
    if self.shopModel.type == 1 or self.shopModel.type == 5 then--1为武将卡
        --打开二级界面
        self._controller_t:openChildView("app.ui.popViews.CardInfoPopView", { data = {self.shopModel.id, 3}, isRemove = false })
    end
end
--@auto code Panel_2 btFunc end

--@auto code Button_pop_buy btFunc
function SoulShopPopView:onButton_pop_buyClick()
    Functions.printInfo(self.debug,"Button_pop_buy button is click!")
    self:sendBuyShop()
end
--@auto code Button_pop_buy btFunc end

--@auto button backcall end


--@auto code output func
function SoulShopPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function SoulShopPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	
    self.shopModel = data.datas
    self.shopType = data.shopType

    --local shopTwo = self.shopModel.eventAttr
    local heroNode = nil
    local have_count = 0
    if self.shopModel.type == 4 then--4为道具
        heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = self.shopModel.id})
        self._Text_pop_cargo_name_t:setText(ConfigHandler:getPropNameOfId(self.shopModel.id))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getPropInfOfId(self.shopModel.id))

        --已经有的个数
        have_count = PropData:getPropNumOfId(self.shopModel.id)
        if self.shopModel.id == -2 then
            have_count = PlayerData.eventAttr.m_gold
        elseif self.shopModel.id == -3 then
            have_count = PlayerData.eventAttr.m_money
        elseif self.shopModel.id == -4 then
            have_count = PlayerData.eventAttr.m_energy
        elseif self.shopModel.id == -5 then
            have_count = PlayerData.eventAttr.m_soul
        elseif self.shopModel.id == -6 then
            have_count = PlayerData.eventAttr.m_hunjing
        elseif self.shopModel.id == -7 then

        elseif self.shopModel.id == -8 then
            have_count = PlayerData.eventAttr.m_nengliang
        end
    elseif self.shopModel.type == 1 then--1为武将卡
        heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = self.shopModel.id})

        self._Text_pop_cargo_name_t:setText(ConfigHandler:getHeroNameOfId(self.shopModel.id))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getHeroDescriptionId(self.shopModel.id))
        have_count = HeroCardData:getHaveHero(self.shopModel.id)
    elseif self.shopModel.type == 5 then--1为武将卡碎片
        heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = self.shopModel.id})

        self._Text_pop_cargo_name_t:setText(ConfigHandler:getHeroNameOfId(self.shopModel.id))
        Functions.initLabelOfString(self._Text_Pop_info_t, ConfigHandler:getHeroDescriptionId(self.shopModel.id))
        have_count = CompoundData:getCompoundDatanNum(self.shopModel.id)
    end

    Functions.copyParam(self._Image_Pop_head_t, heroNode)
    self._Image_Pop_head_t:setVisible(false)
    self._Sprite_shop_pop_bg_t:addChild(heroNode)

    self._Image_expend_type_bao_t:ignoreContentAdaptWithSize(true)
    if self.shopType == 2 then
        Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/gongxian.png")
    elseif self.shopType == 3 then
        Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/fenglu.png")
    elseif self.shopType == 4 then
        Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/hunjin.png")
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
    self._Text_buy_count_t:setText(tostring(self.shopModel.num))
    self._Text_expend_type_bao_num_t:setText(tostring(self.shopModel.price))
end

function SoulShopPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

--购买商城物品
function SoulShopPopView:sendBuyShop()
    Functions.printInfo(self.debug,"sendBuyShop")
    local onBuyShop = function (event)

        Functions.playSound("get_loot.mp3")

        PlayerData.eventAttr.m_gold = event.gold
        PlayerData.eventAttr.m_money = event.money
        PlayerData.eventAttr.m_hunjing = event.hunjing

        if self.shopModel.m_ItemType == 1 then
            assert(event.goodcount == 1, "input hero card num is error")
        end
        for k, v in ipairs(event.data) do
            Functions:addItemResources( {id = v[1], type = v[2], count = v[3], slot = v[4]} )
        end
        --购买后数据更新监听
        --GameEventCenter:dispatchEvent({ name = ShopData.BUY_REFRESH_CHANGE, data = {} })

        self._controller_t:closeChildView(self)
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7) 
    end

    NetWork:addNetWorkListener({ 32, 2 }, Functions.createNetworkListener(onBuyShop,true,"ret"))
    NetWork:sendToServer({ idx = { 32, 2 }, index = self.shopModel.index})
end

return SoulShopPopView