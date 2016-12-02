--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HuoDongPopView = class("HuoDongPopView", BasePopView)

local Functions = require("app.common.Functions")

HuoDongPopView.csbResPath = "lk/csb"
HuoDongPopView.debug = true
HuoDongPopView.studioSpriteFrames = {"HuoDongPopUI","HuoDongPopUI_Text_Bg","HuoDongPopUI_Text" }
--@auto code head end


HuoDongPopView.spriteFrameNames = 
{
}

HuoDongPopView.animaNames = 
{
}


--@auto code uiInit
--add spriteFrames
if #HuoDongPopView.studioSpriteFrames > 0 then
    HuoDongPopView.spriteFrameNames = HuoDongPopView.spriteFrameNames or {}
    table.insertto(HuoDongPopView.spriteFrameNames, HuoDongPopView.studioSpriteFrames)
end
function HuoDongPopView:onInitUI()

    --output list
    self._ScrollView_title_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title")
	self._Panel_Every_day_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_Every_day")
	self._Sprite_Every_day_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_Every_day"):getChildByName("Sprite_Every_day")
	self._Panel_san_can_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_san_can")
	self._Sprite_san_can_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_san_can"):getChildByName("Sprite_san_can")
	self._Panel_chong_zhi_huo_dong_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_chong_zhi_huo_dong")
	self._Sprite_chong_zhi_huo_dong_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_chong_zhi_huo_dong"):getChildByName("Sprite_chong_zhi_huo_dong")
	self._Panel_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_cheng_zhang")
	self._Sprite_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_cheng_zhang"):getChildByName("Sprite_cheng_zhang")
	self._Panel_yue_ka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_yue_ka")
	self._Sprite_yue_ka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_yue_ka"):getChildByName("Sprite_yue_ka")
	self._Panel_cheng_jiu_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_cheng_jiu")
	self._Sprite_cheng_jiu_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_cheng_jiu"):getChildByName("Sprite_cheng_jiu")
	self._Panel_goto_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_goto_dian_zan")
	self._Sprite_goto_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_goto_dian_zan"):getChildByName("Sprite_goto_dian_zan")
	self._Panel_xuan_mei_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_xuan_mei")
	self._Sprite_xuan_mei_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_xuan_mei"):getChildByName("Sprite_xuan_mei")
	self._Panel_all_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all")
	self._Text_time_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time")
	self._Text_time_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time_num")
	self._Text_jie_shao_info_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_jie_shao_info")
	self._Text_gold_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_gold_num")
	self._Panel_jie_shao_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_jie_shao")
	self._Text_jie_shao_no_time_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_jie_shao"):getChildByName("Text_jie_shao_no_time")
	self._Panel_cheng_zhang_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text")
	self._Text_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text"):getChildByName("Text_cheng_zhang")
	self._Panel_yue_ka_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text")
	self._Text_yueka_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_yueka_num")
	self._Panel_san_can_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_san_can_text")
	self._ListView_Every_day_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_Every_day")
	self._ListView_chong_zhi_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chong_zhi")
	self._ListView_san_can_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_san_can")
	self._ListView_chen_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang")
	self._Text_ji_jin_1_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_ji_jin_1")
	self._Text_ji_jin_2_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_ji_jin_2")
	self._ListView_yue_ka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_yue_ka")
	self._Panel_list_cheng_jiu_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_list_cheng_jiu")
	self._Panel_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))

	self._Button_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text"):getChildByName("Button_cheng_zhang")
	self._Button_cheng_zhang_t:onTouch(Functions.createClickListener(handler(self, self.onButton_cheng_zhangClick), "zoom"))

	self._Button_buy_yueka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text"):getChildByName("Image_mei_ri_bg"):getChildByName("Button_buy_yueka")
	self._Button_buy_yueka_t:onTouch(Functions.createClickListener(handler(self, self.onButton_buy_yuekaClick), "zoom"))

	self._Button_get_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan"):getChildByName("Image_mei_ri_bg"):getChildByName("Button_get_dian_zan")
	self._Button_get_dian_zan_t:onTouch(Functions.createClickListener(handler(self, self.onButton_get_dian_zanClick), "zoom"))

	self._Button_go_to_dz_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan"):getChildByName("Button_go_to_dz")
	self._Button_go_to_dz_t:onTouch(Functions.createClickListener(handler(self, self.onButton_go_to_dzClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_cheng_zhang btFunc
--购买成长基金
function HuoDongPopView:onButton_cheng_zhangClick()
    Functions.printInfo(self.debug,"Button_cheng_zhang button is click!")
    if PlayerData.eventAttr.m_gold < g_VipCgf.GrowUpGold then
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_Enlist_11)
        return true
    end
    --监听服务器数据
    local onServerRequest = function (event)
        Functions.setAdbrixTag("retension","growth_wealth_buy",PlayerData.eventAttr.m_level)
        PlayerData.eventAttr.m_gold = event.gold
        local data = event.state
        ActivityData.VIPJiHua = {}
        for k, v in pairs(data) do
            ActivityData.VIPJiHua[#ActivityData.VIPJiHua + 1] = v
        end
        ActivityData.VIPJiHuaBuy = 1
        self:ShowChengZhang()
        self:ListBZ()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7)
    end
    NetWork:addNetWorkListener({25,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 3}}
    NetWork:sendToServer(msg)

end
--@auto code Button_cheng_zhang btFunc end

--@auto code Button_close btFunc
function HuoDongPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self:close()
end
--@auto code Button_close btFunc end

--@auto code Button_buy_yueka btFunc
function HuoDongPopView:onButton_buy_yuekaClick()
    Functions.printInfo(self.debug,"Button_buy_yueka button is click!")
    VipData:buyMonthCard()
end
--@auto code Button_buy_yueka btFunc end

--@auto code Button_get_dian_zan btFunc
function HuoDongPopView:onButton_get_dian_zanClick()
    Functions.printInfo(self.debug,"Button_get_dian_zan button is click!")
    
    --领取点赞奖励
    local updateShow = function(event)
        self:ShowDainZan()
    end
    ActivityData:sendGetDianZan(updateShow)
end
--@auto code Button_get_dian_zan btFunc end

--@auto code Button_go_to_dz btFunc
function HuoDongPopView:onButton_go_to_dzClick()
    Functions.printInfo(self.debug,"Button_go_to_dz button is click!")
    --接受点赞
    Functions.callJavaFuc(function ( )
        NativeUtil:javaCallHanler({command = "nanoo",url = SDKConfig.facebookUrl,isAddParameter = false})
    end)
    local data = ActivityData:getDianZan()
    --没有点过赞时才向服务器
    if data.dzBZ == 0 then
        local updateShow = function(event)
            self:ShowDainZan()
        end
        ActivityData:sendAcceptDianZan(updateShow)
    end
end
--@auto code Button_go_to_dz btFunc end

--@auto button backcall end


--@auto code output func
function HuoDongPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HuoDongPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
    Functions.setPopupKey("welfare")

    
    --VipData:RequestVipPay("111111","1231321","1000021769")
    
    -- --请求累积消费
    -- ActivityData:sendXiaoFei()
    
    --请求充值活动
    ActivityData:sendNumHuoDong()
    
--    --发送天梯
--    ActivityData:sendTianTi()
    
	--请求vip成长基金状态
    ActivityData:sendJiHua()

    --请求成就
    ActivityData:sendChengJiu()

    --查询月卡奖励
    ActivityData:sendYueKa()
    
    --当前语言
    if G_CurrentLanguage == "hk" then
    	--查询点赞奖励
        ActivityData:sendDianZan()
    end

    
    --请求每日充值
    local onData = function()
        self:ListClose()
        self:ShowTime(1)
        self:ShowEveryDay()
        self:showView()
        self:ListBZ()
    end
    ActivityData:sendEveryDay(onData)

    
    self.State = 1
    local onPanel1 = function()
        print("panel 1 click")

        self.State = 1
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end

    local onPanel2 = function()
        print("panel 2 click")

        self.State = 2
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end 

    local onPanel3 = function()
        print("panel 3 click")

        self.State = 3
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end 

    local onPanel4 = function()
        print("panel 4 click")

        self.State = 4
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end 

    local onPanel5 = function()
        print("panel 5 click")
        self.State = 5
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end
    
    local onPanel6 = function()
        print("panel 6 click")
        self.State = 6
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end 
    
    local onPanel7 = function()
        print("panel 7 click")
        self.State = 7
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end
    
    local onPanel8 = function()
        print("panel 8 click")
        self.State = 8
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end

        self:Show(self.State)
    end 

    Functions.initTabCom({ { self._Panel_Every_day_t, onPanel1, true }, { self._Panel_san_can_t, onPanel2}, { self._Panel_chong_zhi_huo_dong_t, onPanel3}, { self._Panel_yue_ka_t, onPanel4 }, 
        { self._Panel_cheng_zhang_t, onPanel5}, { self._Panel_cheng_jiu_t, onPanel6}, { self._Panel_goto_dian_zan_t, onPanel7},  { self._Panel_xuan_mei_t, onPanel8}})
    
    --self:ListBZ()  
end

function HuoDongPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function HuoDongPopView:onChangeView()
end

function HuoDongPopView:ListClose()
    Functions.printInfo(self.debug,"ListClose")
    self._ListView_Every_day_t:setVisible(false)
    self._ListView_chong_zhi_t:setVisible(false)
    self._ListView_san_can_t:setVisible(false)
    self._ListView_chen_zhang_t:setVisible(false)
    self._ListView_yue_ka_t:setVisible(false)
    self._Panel_list_cheng_jiu_t:setVisible(false)
    self._Panel_dian_zan_t:setVisible(false)
end

function HuoDongPopView:ListBZ()
    Functions.printInfo(self.debug,"ListBZ")
    --获取标志
--    ActivityData:getVIPBZ()
--    ActivityData:getEveryDayBZ()
--    ActivityData:getMoneyBZ()
--    ActivityData:getXiaoFeiBZ()
    
    --对标志进行展示
    if ActivityData.EveryDayBZ then
        self._Sprite_Every_day_t:setVisible(true)
    else
        self._Sprite_Every_day_t:setVisible(false)
    end

--    if ActivityData.XiaoFeiBZ then
--        self._Sprite_lei_ji_t:setVisible(true)
--    else
--        self._Sprite_lei_ji_t:setVisible(false)
--    end
    
    if ActivityData.MoneyBZ then
        self._Sprite_chong_zhi_huo_dong_t:setVisible(true)
    else
        self._Sprite_chong_zhi_huo_dong_t:setVisible(false)
    end
    
    if ActivityData.VIPBZ then
        self._Sprite_cheng_zhang_t:setVisible(true)
    else
        self._Sprite_cheng_zhang_t:setVisible(false)
    end
    
    if ActivityData.SanCanBZ then
        self._Sprite_san_can_t:setVisible(true)
    else
        self._Sprite_san_can_t:setVisible(false)
    end
    
    if ActivityData.YueKaBZ then
        self._Sprite_yue_ka_t:setVisible(true)
    else
        self._Sprite_yue_ka_t:setVisible(false)
    end
    
    if ActivityData.ChengJiuBZ then
        self._Sprite_cheng_jiu_t:setVisible(true)
    else
        self._Sprite_cheng_jiu_t:setVisible(false)
    end
    
    if ActivityData.DianZanBZ then
        self._Sprite_goto_dian_zan_t:setVisible(true)
    else
        self._Sprite_goto_dian_zan_t:setVisible(false)
    end
end

--显示倒记时
function HuoDongPopView:showTime_(wiget, time)

    if time == 0 then
        return
    end
    if wiget.timeSprite then
        return
    end
    wiget.timeSprite = Functions.createSprite()
    wiget:addChild(wiget.timeSprite)
    --任务倒记时
    local onTime = function()
        local m_newtime = TimerManager:getCurrentSecond()
        local tm = time - m_newtime
        if tm < 0 then
            tm = 0
        end
        local str = LanguageConfig.language_HuoDong_3..string.format(LanguageConfig.language_HuoDong_1, tm/(3600*24), tm%(3600*24)/3600, tm/60%60)
        if tm == 0 then
            str = LanguageConfig.language_HuoDong_2
        end
        Functions.initLabelOfString(wiget, str)
        
--        local time = str--TimerManager:formatTime(LanguageConfig.language_HuoDong_1, tm)
--        local day = TimerManager:formatTime("%d", tm)
--        local iii = tonumber(day)
        --天数小于10天时，就要显示一位数，否则显示二位数

--        else
--            if tonumber(day) < 10 then
--                str = LanguageConfig.language_HuoDong_3..string.sub(time,2,#time)
--            else
--                str = LanguageConfig.language_HuoDong_3..tostring(time)
--            end
--            
--        end
    end
    Functions.bindEventListener(wiget.timeSprite, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

function HuoDongPopView:Show(type)
    Functions.printInfo(self.debug,"Show")
    self:ListClose()
    self:ShowTime(type)
    self._Panel_cheng_zhang_text_t:setVisible(false)
    self._Panel_san_can_text_t:setVisible(false)
    self._Panel_yue_ka_text_t:setVisible(false)
    self._Panel_jie_shao_t:setVisible(true)
    self._Panel_all_t:setVisible(false)
    if type == 1 then
        self:ShowEveryDay()
    elseif type == 2 then
        self._Panel_jie_shao_t:setVisible(false)
        self._Panel_san_can_text_t:setVisible(true)
        self:ShowSanCan()
    elseif type == 3 then
        self._Panel_all_t:setVisible(true)
        self._Panel_jie_shao_t:setVisible(false)
        self:ShowNumHuoDong()
    elseif type == 4 then
        self._Panel_yue_ka_text_t:setVisible(true)
        self:ShowYueKa()
    elseif type == 5 then
        self._Panel_jie_shao_t:setVisible(false)
        self._Panel_cheng_zhang_text_t:setVisible(true)
        self:ShowChengZhang()
    elseif type == 6 then
        self._Panel_jie_shao_t:setVisible(false)
        self:ShowChengJiu()
    elseif type == 7 then
        self:ShowDainZan()
    elseif type == 8 then
        self:ShowXuanMei()
    end
    
end

function HuoDongPopView:ShowTime(type)
    Functions.printInfo(self.debug,"Show")
    if type == 6 or type == 4 or type == 7 then
    	return
    end
    if type == 5 then

    else
        local a1 = ActivityData:getEndTime()
        local a2 = ActivityData:getStartTime()
        local Start = ActivityData:getStartTime()[1]
        local Start_hour = tostring(Start.hour)
        --因为是显示时间，所以小于10时前面加个0
        if Start.hour < 10 then
            Start_hour = "0"..tostring(Start.hour)
        end
        local Start_min = tostring(Start.min)
        if Start.min < 10 then
            Start_min = "0"..tostring(Start_min)
        end
        assert(Start, "No start time")
        local EndTime = ActivityData:getEndTime()[1]
        --因为是显示时间，所以小于10时前面加个0
        local EndTime_hour = tostring(EndTime.hour)
        if EndTime.hour < 10 then
            EndTime_hour = "0"..tostring(EndTime.hour)
        end
        local EndTime_min = tostring(EndTime.min)
        if EndTime.min < 10 then
            EndTime_min = "0"..tostring(EndTime_min)
        end
        local str = tostring(Start.month)..LanguageConfig.language_HuoDong_4..tostring(Start.day)..LanguageConfig.language_HuoDong_5.." "..Start_hour..":"..Start_min.."--"..
            tostring(EndTime.month)..LanguageConfig.language_HuoDong_4..tostring(EndTime.day)..LanguageConfig.language_HuoDong_5.." "..EndTime_hour..":"..EndTime_min
        Functions.initLabelOfString( self._Text_time_t, str )

        if os.time(ActivityData.StartTime[1]) > TimerManager:getCurrentSecond() then
            Functions.initLabelOfString(self._Text_time_num_t, LanguageConfig.language_HuoDong_12)
        else
            self:showTime_(self._Text_time_num_t, os.time(ActivityData.EndTime[1]))
        end
    end
end

--成长计划
function HuoDongPopView:ShowChengZhang()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    self._Panel_all_t:setVisible(false)
    self._Panel_cheng_zhang_text_t:setVisible(true)
    Functions.initLabelOfString( self._Text_cheng_zhang_t, g_welfareInstructions.chengZhang)

    if ActivityData.VIPJiHuaBuy == 0 then
        Functions.setEnabledBt(self._Button_cheng_zhang_t,true)
    elseif ActivityData.VIPJiHuaBuy == 1 then
        Functions.setEnabledBt(self._Button_cheng_zhang_t,false)
    end
    
    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")
        Functions.initTextColor(banModel:getChildByName("Text_ji_jin_1"),button:getChildByName("Text_ji_jin_1"))
        Functions.initTextColor(banModel:getChildByName("Text_ji_jin_2"),button:getChildByName("Text_ji_jin_2"))
        
        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getJiHuaJiang(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))

        local num = ActivityData:getJiHuaItem()
        local JiHuaOne = tostring(num[index].level)..LanguageConfig.language_HuoDong_6
        local JiHuaTwo = string.format(LanguageConfig.language_HuoDong_7,num[index].level, num[index].gold )  --(LanguageConfig.language_HuoDong_7)..tostring(num[index].level)..LanguageConfig.language_HuoDong_8..tostring(num[index].gold)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_ji_jin_1"), JiHuaOne,button:getChildByName("Text_ji_jin_2"),JiHuaTwo)
        if ActivityData.VIPJiHuaBuy == 0 or data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_chen_zhang_t, ActivityData:getJiHua(), listHandler)
end

--成长计划领奖
function HuoDongPopView:getJiHuaJiang(idx)
    --监听服务器数据
    local onServerRequest = function (event)
        PlayerData.eventAttr.m_gold = event.gold
        ActivityData.VIPJiHua[idx] = 2
        self:ShowChengZhang()
        self:ListBZ()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({25,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 4},index = idx }
    NetWork:sendToServer(msg)
end

--每日充值领奖
function HuoDongPopView:getEveryDayJiang(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.EveryDay[idx] = 2
        self:ShowEveryDay()
        self:ListBZ()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,16}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 16},index = idx }
    NetWork:sendToServer(msg)
end

--充值活动领奖
function HuoDongPopView:getMoneyHuoDong(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.MoneyHuoDong[idx] = 2
        self:ShowNumHuoDong()
        self:ListBZ()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,9}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 9}, index = idx }
    NetWork:sendToServer(msg)
end


--天梯领奖
function HuoDongPopView:getTianTi(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.MoneyHuoDong[idx] = 2
        self:ShowNumHuoDong()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,9}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 9}, index = idx }
    NetWork:sendToServer(msg)
end

--每日特惠
function HuoDongPopView:ShowEveryDay()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    self._Text_gold_num_t:setVisible(true)
    local str = string.format(LanguageConfig.language_HuoDong_13, ActivityData:getEveryDayGold())
    Functions.initLabelOfString( self._Text_gold_num_t, str)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.teHui)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_chong_zhi_bg")
        local banModel = model:getChildByName("Image_chong_zhi_bg")
        Functions.initTextColor(banModel:getChildByName("Text_yuanjia_num"),button:getChildByName("Text_yuanjia_num"))
        
        
        
        local FadeIn = cc.FadeIn:create(1)
        local FadeOut = cc.FadeOut:create(1)
        local play = cc.Sequence:create(FadeOut,FadeIn)
        local rep = cc.RepeatForever:create(play)--永久播放 （次数设为负数可以一直播放）
--        widget:runAction(rep)
--        
--        --动画
--        local blink = cc.Blink:create(2, 3)
        Functions.playAnimaWithCreateSprite(widget,rep,true, "lk/ui_res/HuoDongPopUI/chongzhi_2.png", cc.p( 355, 35 ),1.1)
        local param = {scale = 1, pos = cc.p( 355, 35 ) , zorder = 10, spriteName = "commonUI/res/lk/HuoDongPopUI/chongzhi_1.png"}
        local sp = Functions.createSprite(param)

        widget:addChild(sp)

        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getEveryDayJiang(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        local heroNode = nil
        local item = ActivityData:getEveryDayItem()[index].goods
        
        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")
        
        for k, v in pairs(item) do
            if v.type == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v.id, count = v.count})
            elseif v.type == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v.id, count = v.count})
            elseif v.type == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v.id, count = v.count})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v.id))
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end
            local Price = ConfigHandler:getItemPrice(v.id,v.type) 
            local numGold = Price*v.count
            Functions.initLabelOfString(button:getChildByName("Text_yuanjia_num"), numGold)
            
            
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)
            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v.type,id = v.id,target = heroNode:getChildByName("model")})
            end
            
            widget:getChildByName("Image_chong_zhi_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end


        local EveryDayNum = tostring(ActivityData:getEveryDayItem()[index].payCount)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_chong_num"), EveryDayNum)
        if data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    local iiiii = ActivityData:getEveryDay()
    Functions.bindListWithData(self._ListView_Every_day_t, ActivityData:getEveryDay(), listHandler)
end

--充值活动
function HuoDongPopView:ShowNumHuoDong()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    self._Text_gold_num_t:setVisible(true)
    local str = string.format(LanguageConfig.language_HuoDong_15, ActivityData:getMoneyHuoDongNum())
    Functions.initLabelOfString( self._Text_gold_num_t, str)
    
    Functions.initLabelOfString( self._Text_jie_shao_info_t, g_welfareInstructions.chongZhi)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")

        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getMoneyHuoDong(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))

        local heroNode = nil
        local item = ActivityData:getMoneyHuoDongItem()[index].goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            if v.type == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v.id, count = v.count})
            elseif v.type == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v.id, count = v.count})
            elseif v.type == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v.id, count = v.count})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)
            
            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v.type,id = v.id,target = heroNode:getChildByName("model")})
            end

            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end


        local EveryDayNum = tostring(ActivityData:getMoneyHuoDongItem()[index].payCount)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_chong_num"), EveryDayNum)
        if data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    local iiiii = ActivityData:getMoneyHuoDong()
    Functions.bindListWithData(self._ListView_chong_zhi_t, ActivityData:getMoneyHuoDong(), listHandler)
end


--豪华三餐
function HuoDongPopView:ShowSanCan()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    self:ListBZ()
    self._Text_gold_num_t:setVisible(false)
    self._Panel_san_can_text_t:setVisible(true)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")
        Functions.initTextColor(banModel:getChildByName("Text_tiem"),button:getChildByName("Text_tiem"))

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
            	self:ShowSanCan()
            end
            ActivityData:sendGetSanCan(index, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        if index == 2 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/hhwanc.png")
        elseif index == 3 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/hhyex.png")
        end
        
        
        local timeST = TimerManager:formatTime("%H:%M", data.st)
        local timeET = TimerManager:formatTime("%H:%M", data.et)
        local str = string.format(LanguageConfig.language_HuoDong_16, timeST, timeET)
        Functions.initLabelOfString( button:getChildByName("Text_tiem"), str)

        if data.flag == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data.flag == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.flag == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_san_can_t, ActivityData:getSanCan(), listHandler)
end

--月卡奖励
function HuoDongPopView:ShowYueKa()
    Functions.printInfo(self.debug,"ShowYueKa")
    
    self:ListBZ()
    self._Text_gold_num_t:setVisible(true)
    self._Panel_yue_ka_text_t:setVisible(true)
    self._ListView_yue_ka_t:setVisible(true)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.yueKa)
    
    local daoJiShi = ActivityData:getYueKaInfo().monthTime
    local time = 0
    
    if daoJiShi ~= 0 then
        time = ((ActivityData:getYueKaInfo().monthTime - TimerManager:getCurrentSecond()) / (24*60*60))
    end
    local text = string.format(LanguageConfig.language_HuoDong_17, tonumber(time))
    Functions.initLabelOfString( self._Text_yueka_num_t, text)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
                self:ShowYueKa()
            end
            ActivityData:sendGetYueKa(index, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        local heroNode = nil
        local item = ActivityData:getYueKa()[index]

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")
        for k, v in ipairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
            else
                assert(false,"商店出售的商品类型 type = " .. v[2] .. "错误")
            end
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)

            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
            end

            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end

        if index == 2 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/mrlb.png")
        end

        if data.bz == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data.bz == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.bz == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    local ppp = ActivityData:getYueKa()
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_yue_ka_t, ActivityData:getYueKa(), listHandler)
end

--成就奖励
function HuoDongPopView:ShowChengJiu()
    Functions.printInfo(self.debug,"ShowChengJiu")
    
    self:ListBZ()
    self._Panel_all_t:setVisible(false)
    self._Panel_cheng_zhang_text_t:setVisible(false)
    self._Panel_yue_ka_text_t:setVisible(false)

    local listHandler = function(index, widget, model, data)
    
        widget:setTouchEnabled(true)
        widget:setSwallowTouches(false)
         local button = widget:getChildByName("Image_mei_ri_bg")
         local banModel = model:getChildByName("Image_mei_ri_bg")
         Functions.initTextColor(banModel:getChildByName("Text_tiao_jian"),button:getChildByName("Text_tiao_jian"))
         local text = string.format("language_chengjiu_%d", data.tj)
         local str = string.format(LanguageConfig[text], data.tjnum)
         button:getChildByName("Text_tiao_jian"):setText(str)
         
        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
                self:ShowChengJiu()
            end
            ActivityData:sendGetChengJiu(data.id, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))


        local heroNode = nil
        local item = data.goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            local Image = "Image_"..tostring(k)
            button:getChildByName(Image):getChildByName("Image_star"):setVisible(true)
            button:getChildByName(Image):getChildByName("Image_sui_pian"):setVisible(false)
            
            local itemWidget = button:getChildByName(Image)--:getChildByName("disImage") --Image_item
            local starWidget = button:getChildByName(Image):getChildByName("Image_star")
            
            local textNum = button:getChildByName(Image):getChildByName("Text_num")
            local str = "X"..tostring(v[3])
            textNum:setString(str)
             
            if v[2] == 4 then --4为道具
                --heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
                button:getChildByName(Image):getChildByName("Image_star"):setVisible(false)
                Functions.initItemComOfId(itemWidget, v[1])
            elseif v[2] == 1 then--1为武将卡
                Functions.loadImageWithWidget(itemWidget:getChildByName("disImage"), ConfigHandler:getHeroHeadImageOfId(v[1]))
                Functions.HeroStar(starWidget, v[1])
            elseif v[2] == 5 then--1为武将卡碎片
                button:getChildByName(Image):getChildByName("Image_sui_pian"):setVisible(true)
                Functions.loadImageWithWidget(itemWidget:getChildByName("disImage"), ConfigHandler:getHeroHeadImageOfId(v[1]))
                Functions.HeroStar(starWidget, v[1])
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end

            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v[2],id = v[1],target = widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image)})
            end
            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            --button:addChild(heroNode)
        end

        if data.bz == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
        elseif data.bz == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.bz == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
        end
    
    end
    
    local romveNodeHandler = function(widget)
        Functions.removeEventBeforeUiClean(widget)
    end
    local cleanNodeHandler = function(widget)
    	
    end
    Functions.bindTableViewWithData(self._Panel_list_cheng_jiu_t,{ firstData = ActivityData:getChengJiu() },
    {handler = listHandler,handler2 = cleanNodeHandler,romveNodeHandler = romveNodeHandler},{direction = true, col = 1, firstSegment = 0, segment = 2 }) 
end

--点赞
function HuoDongPopView:ShowDainZan()
    Functions.printInfo(self.debug,"ShowDainZan")

    self:ListBZ()
    self._Text_gold_num_t:setVisible(false)
    self._Panel_dian_zan_t:setVisible(true)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.dianZan)

    local heroNode = nil
    local data = ActivityData:getDianZan()
    local item = data.goods

    assert(#item <= 5,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

    for k, v in ipairs(item) do
        if v[2] == 4 then --4为道具
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
        elseif v[2] == 1 then--1为武将卡
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
        elseif v[2] == 5 then--1为武将卡碎片
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
        else
            assert(false,"商店出售的商品类型 type = " .. v[2] .. "错误")
        end
        local Image = "Image_"..tostring(k)
        local button = self._Panel_dian_zan_t:getChildByName("Image_mei_ri_bg")
        Functions.copyParam(button:getChildByName(Image), heroNode)
        local wgt = heroNode:getChildByName("model")
        wgt:setTouchEnabled(false)

        local onImage = function(parameters)
            PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
        end

        button:getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

        button:getChildByName(Image):setVisible(true)
        button:addChild(heroNode)
    end
    
--    if data.dzBZ ~= 0 then
--        Functions.setEnabledBt(self._Button_go_to_dz_t,false)
--    end
    
    if data.rewardBZ == 0 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,false)
    elseif data.rewardBZ == 2 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,false)
        self._Button_get_dian_zan_t:getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
        Functions.loadImageWithWidget(self._Button_get_dian_zan_t:getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
    elseif data.rewardBZ == 1 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,true)
    end
end

--选美
function HuoDongPopView:ShowXuanMei()
    Functions.printInfo(self.debug,"ShowXuanMei")

    self:ListBZ()
    self._Text_gold_num_t:setVisible(false)
    local onstr = function(data)
        -- body
        Functions.initLabelOfString( self._Text_jie_shao_no_time_t, "选美活动")
    end
    local str = NoticeManager:getSystemNoticeData(self:getController(), { type = NoticeManager.XUAN_MEI, cb = onstr} )
end

return HuoDongPopView