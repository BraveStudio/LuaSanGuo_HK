--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local SoulShopViewController = class("SoulShopViewController", BaseViewController)

local Functions = require("app.common.Functions")

SoulShopViewController.debug = true
SoulShopViewController.modulePath = ...
SoulShopViewController.studioSpriteFrames = {"IntegralShopUI","CB_bgup","CB_blackbg","ShopUI_Text" }
--@auto code head end

--@Pre loading
SoulShopViewController.spriteFrameNames = 
    {
    }

SoulShopViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #SoulShopViewController.studioSpriteFrames > 0 then
    SoulShopViewController.spriteFrameNames = SoulShopViewController.spriteFrameNames or {}
    table.insertto(SoulShopViewController.spriteFrameNames, SoulShopViewController.studioSpriteFrames)
end
function SoulShopViewController:onDidLoadView()

    --output list
    self._resNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("resNode")
	self._Text_Countdown_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Image_bg"):getChildByName("Text_Countdown")
	self._ListView_shop_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_shop")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_back btFunc
function SoulShopViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto button backcall end


--@auto code view display func
function SoulShopViewController:onCreate()
    Functions.printInfo(self.debug_b," SoulShopViewController controller create!")
end

function SoulShopViewController:onDisplayView()
	Functions.printInfo(self.debug_b," SoulShopViewController view enter display!")
    self._ListView_shop_t:setVisible(false)
    Functions.setPopupKey("store")
    Functions.setAdbrixTag("retension","shop_inter")
    Functions.initResNodeUI(self._resNode_t,{ "jinbi" , "yuanbao", "hunjin" })

    --查看商城物品
    self:refresh()
    self:showTime()
end
--@auto code view display func end



function SoulShopViewController:refresh()

    local shopdatas = SoulShopData:getSoulShopDatas()

    --如果没有刷新令，就显示魂晶数量


    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        Functions.initTextColor(banModel:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"),ban:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"))
        local heroNode = nil
        if data.type == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.id})
        elseif data.type == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.id})
        elseif data.type == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.id})
            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.id))
            ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.type .. "错误")
        end
        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
        if data.coldtype == 1 then--1为元宝
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/bao.png")
        elseif data.coldtype == 2 then--2为铜钱
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/jinbi.png")
        elseif data.coldtype == 3 then--3为魂晶
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/hunjin.png")
        end

        ban:getChildByName("Text_buy_count"):setText(tostring(data.num))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.price))

        if data.flag == 1 then
            ban:getChildByName("Image_sell_out"):setVisible(false)
        else
            local open = widget:getChildByName("Image_ban"):getChildByName("Image_sell_out"):getChildByName("Text_buy_open")
            local str = string.format(LanguageConfig.language_soulShop_1, data.needlevel)
            open:setText(str)
            
            ban:getChildByName("Image_sell_out"):setVisible(true)
        end

        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            if data.flag == 1 then
                self:openChildView("app.ui.popViews.SoulShopPopView", { data = {datas = data ,shopType = 4} })
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

function SoulShopViewController:showTime()
    Functions.printInfo(self.debug_b,"showTime")
    --倒记时
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local CountdownTime = SoulShopData:getTimeEnd()
        m_newtime = CountdownTime - m_newtime 
        if m_newtime < 0 then
            m_newtime = 0
        end

        local time = TimerManager:formatOverTime("%02d:%02d:%02d", m_newtime)
        local str = LanguageConfig.language_soulShop_2..time
        Functions.initLabelOfString( self._Text_Countdown_t, str)
    end
    Functions.bindEventListener(self._Text_Countdown_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    --onTime()
end

function SoulShopViewController:openBgMusic()
    Audio.playMusic("sound/main2.mp3",true)
end

return SoulShopViewController