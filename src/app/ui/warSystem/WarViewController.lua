--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local WarViewController = class("WarViewController", BaseViewController)

local Functions = require("app.common.Functions")

WarViewController.debug = true
WarViewController.modulePath = ...
WarViewController.studioSpriteFrames = {"IntegralShopUI","CB_bgup","WarUI_Text","CB_blackbg","ShopUI_Text","RankUI","WarUI" }
--@auto code head end

--@Pre loading
WarViewController.spriteFrameNames = 
    {
    }

WarViewController.animaNames = 
    {
    }

--@auto code uiInit
--add spriteFrames
if #WarViewController.studioSpriteFrames > 0 then
    WarViewController.spriteFrameNames = WarViewController.spriteFrameNames or {}
    table.insertto(WarViewController.spriteFrameNames, WarViewController.studioSpriteFrames)
end
function WarViewController:onDidLoadView()

    --output list
    self._resNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("resNode")
	self._Text_time_text_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_time"):getChildByName("Text_time_text")
	self._Panel_add_national_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national")
	self._Text_money_text_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national"):getChildByName("Text_money_text")
	self._Panel_entrance_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance")
	self._Panel_rukou_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou_1")
	self._Panel_info_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_info_2")
	self._Panel_kufang_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_kufang_3")
	self._Panel_rukou_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou")
	self._Text_name_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Text_name_1")
	self._Text_name_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Text_name_2")
	self._Text_name_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Text_name_3")
	self._Text_name_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Text_name_4")
	self._Text_name_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Text_name_5")
	self._Panel_guojia_info_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info")
	self._Text_gonggao_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Text_gonggao")
	self._Text_notice_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Text_notice")
	self._Text_huangdi_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Text_huangdi")
	self._Text_huangdi_name_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Text_huangdi_name")
	self._Image_biaozhi_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Image_biaozhi")
	self._Panel_player_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Panel_player")
	self._Panel_guojia_kufang_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_kufang")
	self._ListView_shop_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_kufang"):getChildByName("ListView_shop")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_help_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_help")
	self._Button_help_t:onTouch(Functions.createClickListener(handler(self, self.onButton_helpClick), "zoom"))

	self._Button_xuanze_guojia_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national"):getChildByName("Button_xuanze_guojia_1")
	self._Button_xuanze_guojia_1_t:onTouch(Functions.createClickListener(handler(self, self.onButton_xuanze_guojia_1Click), "zoom"))

	self._Button_shu_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national"):getChildByName("Button_shu")
	self._Button_shu_t:onTouch(Functions.createClickListener(handler(self, self.onButton_shuClick), "zoom"))

	self._Button_wei_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national"):getChildByName("Button_wei")
	self._Button_wei_t:onTouch(Functions.createClickListener(handler(self, self.onButton_weiClick), "zoom"))

	self._Button_wu_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_add_national"):getChildByName("Button_wu")
	self._Button_wu_t:onTouch(Functions.createClickListener(handler(self, self.onButton_wuClick), "zoom"))

	self._Button_jinru_shijie_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_rukou"):getChildByName("Button_jinru_shijie")
	self._Button_jinru_shijie_t:onTouch(Functions.createClickListener(handler(self, self.onButton_jinru_shijieClick), "zoom"))

	self._Button_guanli_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_entrance"):getChildByName("Panel_guojia_info"):getChildByName("Button_guanli")
	self._Button_guanli_t:onTouch(Functions.createClickListener(handler(self, self.onButton_guanliClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_back btFunc
function WarViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_help btFunc
function WarViewController:onButton_helpClick()
    Functions.printInfo(self.debug,"Button_help button is click!")
    NoticeManager:openNotice(self, {type = NoticeManager.WAR_INFO})
end
--@auto code Button_help btFunc end

--@auto code Button_xuanze_guojia_1 btFunc
function WarViewController:onButton_xuanze_guojia_1Click()
    Functions.printInfo(self.debug,"Button_xuanze_guojia_1 button is click!")
    NoticeManager:openTips(self, { handler = function()
        WarData:setSelectWar(0, handler(self, self.show))
    end, title = LanguageConfig.language_war_18})
end
--@auto code Button_xuanze_guojia_1 btFunc end

--@auto code Button_shu btFunc
function WarViewController:onButton_shuClick()
    Functions.printInfo(self.debug,"Button_shu button is click!")
    --弹出框
    local str = string.format(LanguageConfig.language_war_17, LanguageConfig.language_war_3)
    NoticeManager:openTips(self, { handler = function()
        WarData:setSelectWar(2, handler(self, self.show))
    end, title = str})
end
--@auto code Button_shu btFunc end

--@auto code Button_wei btFunc
function WarViewController:onButton_weiClick()
    Functions.printInfo(self.debug,"Button_wei button is click!")
    --弹出框
    local str = string.format(LanguageConfig.language_war_17, LanguageConfig.language_war_2)
    NoticeManager:openTips(self, { handler = function()
        WarData:setSelectWar(1, handler(self, self.show))
    end, title = str})
end
--@auto code Button_wei btFunc end

--@auto code Button_wu btFunc
function WarViewController:onButton_wuClick()
    Functions.printInfo(self.debug,"Button_wu button is click!")
    --弹出框
    local str = string.format(LanguageConfig.language_war_17, LanguageConfig.language_war_4)
    NoticeManager:openTips(self, { handler = function()
        WarData:setSelectWar(3, handler(self, self.show))
    end, title = str})
end
--@auto code Button_wu btFunc end

--@auto code Button_jinru_shijie btFunc
function WarViewController:onButton_jinru_shijieClick()
    Functions.printInfo(self.debug,"Button_jinru_shijie button is click!")
    --打开据点界面
    WarData:setMapInfo(handler(self,self.jumpWorld))
end
--@auto code Button_jinru_shijie btFunc end

--@auto code Button_guanli btFunc
function WarViewController:onButton_guanliClick()
    Functions.printInfo(self.debug,"Button_guanli button is click!")
    --打开二级界面
    for k, v in pairs(WarData:getCampInfo()) do
        if v.uid == PlayerData.eventAttr.m_uid then
--            if v.power >= 1  then
            	self:openChildView("app.ui.popViews.WarButPopView")
--            else
--                --弹出报错信息
--                PromptManager:openTipPrompt(LanguageConfig.language_war_7)
--            end
            break
        end
    end  
end
--@auto code Button_guanli btFunc end

--@auto code Button_exit btFunc
function WarViewController:onButton_exitClick()
    Functions.printInfo(self.debug,"Button_exit button is click!")
    local onExit = function(event)
        GameCtlManager:pop(self)
    end
    WarData:sendExit(onExit)
end
--@auto code Button_exit btFunc end

--@auto button backcall end


--@auto code view display func
function WarViewController:onCreate()
    Functions.printInfo(self.debug_b," WarViewController controller create!")
end

function WarViewController:onDisplayView()
	Functions.printInfo(self.debug_b," WarViewController view enter display!")
	
    Functions.initResNodeUI(self._resNode_t,{ "yuanbao", "fenglu" })
    --公告
    Functions.initLabelOfString(self._Text_notice_t, WarData:getNotice())
    --首次听天由命给金币
    Functions.initLabelOfString(self._Text_money_text_t, LanguageConfig.language_war_14)
    
    --监听修改公告
    local onNotice = function(event)
        --公告
        Functions.initLabelOfString(self._Text_notice_t, WarData:getNotice())
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.NOTICE_EVENT, onNotice)
    
    --当前选择武将类型(1为全部，2为力，3为谋，4为术，5为医)
    self.warState = 1
    
    self:show()

    local onPanel1 = function()
        print("panel 1 click")
        if self.warState ~= 1 then
            self.warState = 1

            WarData:setWarRuKou(handler(self, self.showRuKou))
        end
    end

    local onPanel2 = function()
        print("panel 2 click")
        if self.warState ~= 2 then
            self.warState = 2

            WarData:setWarInfo(handler(self, self.showInfo))
        end
    end 

    local onPanel3 = function()
        print("panel 3 click")
        if self.warState ~= 3 then
            self.warState = 3

            WarData:setWarShop(handler(self, self.showShop))
        end
    end 

    Functions.initTabCom({{ self._Panel_rukou_1_t, onPanel1, true }, { self._Panel_info_2_t, onPanel2}, { self._Panel_kufang_3_t, onPanel3}})
	
end
--@auto code view display func end

function WarViewController:showTime()
    Functions.printInfo(self.debug_b,"showTime")
    --倒记时
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local CountdownTime = WarData:getEndTime()
        m_newtime = CountdownTime - m_newtime 
        if m_newtime < 0 then
            m_newtime = 0
        end

        local time = TimerManager:formatOverTime("%02d:%02d:%02d", m_newtime)
        local str = string.format(LanguageConfig.language_war_20, time) 
        Functions.initLabelOfString( self._Text_time_text_t, str)
    end
    Functions.bindEventListener(self._Text_time_text_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

function WarViewController:show()
        local test  = PlayerData.eventAttr.m_camp
    if PlayerData.eventAttr.m_camp <= 0 then
        self:showView()
        self._Panel_add_national_t:setVisible(true)
        self._Panel_entrance_t:setVisible(false)
    else
        self._Panel_add_national_t:setVisible(false)
        self._Panel_entrance_t:setVisible(true)
        WarData:setWarRuKou(handler(self, self.callbackC))
    end
    
end

--显示国家入口界面
function WarViewController:showRuKou()

    self._Panel_rukou_t:setVisible(true)
    self._Panel_guojia_info_t:setVisible(false)
    self._Panel_guojia_kufang_t:setVisible(false)
    
    local data = WarData:getRuKou()
    for k, v in pairs(data) do
        local str = string.format("_Text_name_%d_t",k)
        self[str]:setString(v)
    end
end

--显示国家信息界面
function WarViewController:showInfo()

    self._Panel_rukou_t:setVisible(false)
    self._Panel_guojia_info_t:setVisible(true)
    self._Panel_guojia_kufang_t:setVisible(false)
    
    Functions.initLabelOfString(self._Text_huangdi_t,LanguageConfig.language_war_15, self._Text_gonggao_t,LanguageConfig.language_war_16 )

    local notice = WarData:getNotice()
        self._Text_notice_t:setString(notice)
    local HDname = WarData:getHDname()
        self._Text_huangdi_name_t:setString(HDname)

    if PlayerData.eventAttr.m_camp == 1 then
        Functions.loadImageWithWidget(self._Image_biaozhi_t, "commonUI/res/lk/WarUI/wei1.png") 
    elseif PlayerData.eventAttr.m_camp == 2 then
        Functions.loadImageWithWidget(self._Image_biaozhi_t, "commonUI/res/lk/WarUI/shu1.png") 
    elseif PlayerData.eventAttr.m_camp == 3 then
        Functions.loadImageWithWidget(self._Image_biaozhi_t, "commonUI/res/lk/WarUI/wu1.png") 
    end

    

     local listHandler = function(index, widget, model, data)
        Functions.initTextColor(model:getChildByName("Text_position"),widget:getChildByName("Text_position"))
        Functions.initTextColor(model:getChildByName("Text_atk_num"),widget:getChildByName("Text_atk_num"))
        Functions.initTextColor(model:getChildByName("Text_level"),widget:getChildByName("Text_level"))
        Functions.initTextColor(model:getChildByName("Text_name"),widget:getChildByName("Text_name"))
        Functions.initTextColor(model:getChildByName("Text_old_contribution"),widget:getChildByName("Text_old_contribution"))
        Functions.initTextColor(model:getChildByName("Text_new_contribution"),widget:getChildByName("Text_new_contribution"))
        widget:setTouchEnabled(false)
     
        
        widget:getChildByName("Text_atk_num"):setString(data.fight)
        widget:getChildByName("Text_level"):setString(data.level)
        widget:getChildByName("Text_name"):setString(data.name)
        widget:getChildByName("Text_position"):setString(data.offer)
        widget:getChildByName("Text_old_contribution"):setString(data.freTribute)
        widget:getChildByName("Text_new_contribution"):setString(data.curTribute)
    end

    local playerDatas =  WarData:getCampInfo()

    Functions.bindTableViewWithData(self._Panel_player_t,{ firstData = playerDatas },{handler = listHandler},{direction = false, col = 1, firstSegment = 0, segment = 2 }) 

end

--显示国家商店
function WarViewController:showShop()
    
    self._Panel_rukou_t:setVisible(false)
    self._Panel_guojia_info_t:setVisible(false)
    self._Panel_guojia_kufang_t:setVisible(true)


    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")
        local open = widget:getChildByName("Image_ban"):getChildByName("Image_sell_out"):getChildByName("Text_buy_open")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        Functions.initTextColor(banModel:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"),ban:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"))
        local heroNode = nil
        if data.m_ItemType == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
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
        Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/fenglu.png")

        ban:getChildByName("Text_buy_count"):setText(tostring(data.m_ItemNum))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_ItemPrice))


       if data.m_state == 0 then
           ban:getChildByName("Image_sell_out"):setVisible(true)
           local str = string.format(LanguageConfig.language_war_6, g_gzCfg.xlcfg[data.m_place].name)
           open:setText(str)
       else
           ban:getChildByName("Image_sell_out"):setVisible(false)
       end

        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            if data.m_state == 1 then
                self:openChildView("app.ui.popViews.ShopPopView", { data = {datas = data ,shopType = 3}})
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
    local shopdatas = WarData:getWarShop()
    Functions.bindArryListWithData(self._ListView_shop_t,{ firstData = WarData:getWarShop() }, listHandler,{direction = false,col = 2,firstSegment = 0,segment = 9})

end

function WarViewController:jumpWorld()
    GameCtlManager:push("app.ui.warWorldMapSystem.WarWorldMapViewController")
end
function WarViewController:callbackC()
    Functions.printInfo(self.debug_b," callbackC")
    self:showView()
    self:showRuKou()
    self._Text_time_text_t:setVisible(true)
    self:showTime()
    
end
function WarViewController:onChangeView()
-- body
end

return WarViewController