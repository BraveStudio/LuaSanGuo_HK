--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HolidayPopView = class("HolidayPopView", BasePopView)

local Functions = require("app.common.Functions")

HolidayPopView.csbResPath = "lk/csb"
HolidayPopView.debug = true
HolidayPopView.studioSpriteFrames = {"HuoDongPopUI","CarnivalPopUI_Text","SquadPopUI","HuoDongPopUI_Text","CarnivalPopUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HolidayPopView.studioSpriteFrames > 0 then
    HolidayPopView.spriteFrameNames = HolidayPopView.spriteFrameNames or {}
    table.insertto(HolidayPopView.spriteFrameNames, HolidayPopView.studioSpriteFrames)
end
function HolidayPopView:onInitUI()

    --output list
    self._Image_ban_ban_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Image_beijin"):getChildByName("Image_bei_ban"):getChildByName("Image_ban_ban")
	self._Image_ban_ban_tian_ti_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Image_beijin"):getChildByName("Image_bei_ban"):getChildByName("Image_ban_ban_tian_ti")
	self._Panel_jie_ri_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_jie_ri")
	self._Sprite_jie_ri_bz_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_jie_ri"):getChildByName("Sprite_jie_ri_bz")
	self._Panel_fan_li_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_fan_li")
	self._Sprite_fan_li_bz_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_fan_li"):getChildByName("Sprite_fan_li_bz")
	self._Panel_zheng_ba_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_zheng_ba")
	self._Sprite_zheng_ba_bz_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("ScrollView_title"):getChildByName("Panel_zheng_ba"):getChildByName("Sprite_zheng_ba_bz")
	self._Panel_all_text_info_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_all_text_info")
	self._Text_all_text_info_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_all_text_info"):getChildByName("Text_all_text_info")
	self._Text_xiao_fei_count_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_xiao_fei_count_text"):getChildByName("Text_xiao_fei_count")
	self._Text_time_string_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_xiao_fei_count_text"):getChildByName("Text_time_string")
	self._ListView_xiao_fei_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("ListView_xiao_fei")
	self._ListView_tian_ti_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("ListView_tian_ti")
	self._Panel_te_jia_list_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list")
	self._Panel_te_jia_item_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Panel_te_jia_item")
	self._Text_yuan_bao_num_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Text_yuan_bao_num")
	self._Text_buy_num_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Text_buy_num")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Image_beijin"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))

	self._Button_buy_te_jia_t = self.csbNode:getChildByName("Panel_jie_ri"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Button_buy_te_jia")
	self._Button_buy_te_jia_t:onTouch(Functions.createClickListener(handler(self, self.onButton_buy_te_jiaClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function HolidayPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto code Button_buy_te_jia btFunc
function HolidayPopView:onButton_buy_te_jiaClick()
    Functions.printInfo(self.debug,"Button_buy_te_jia button is click!")
    HolidayData:sendGetTeJia(handler(self, self.showTeJia))
end
--@auto code Button_buy_te_jia btFunc end

--@auto button backcall end


--@auto code output func
function HolidayPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
end

function HolidayPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")

    HolidayData:sendXiaoFei()
    HolidayData:sendZhengBa()

    local HolidayOne = false
    local HolidayTwo = false
    local HolidayThree = false

    --请求每日充值
    local onData = function()
        --开启哪一个活动
        if HolidayData:get_jrth_BZ() then
            HolidayOne = true
            HolidayTwo = false
            HolidayThree = false
            self.State = 1
            self:showTypeUI()
            self:showTeJia()
        elseif HolidayData:get_xffl_BZ() then
            HolidayOne = false
            HolidayTwo = true
            HolidayThree = false
            self.State = 2
            self:showTypeUI()
            self:showXiaoFei()
        elseif HolidayData:get_zhzb_BZ() then
            HolidayOne = false
            HolidayTwo = false
            HolidayThree = true
            self.State = 3
            self:showTypeUI()
            self:showZhengBa()
        end
        --开启哪一个活动
        if not HolidayData:get_jrth_BZ() then
            self._Panel_jie_ri_t:setEnabled(false)
            Functions.setGraySprite(self._Panel_jie_ri_t:getChildByName("2"),true)
        end
        if not HolidayData:get_xffl_BZ() then
            self._Panel_fan_li_t:setEnabled(false)
            Functions.setGraySprite(self._Panel_fan_li_t:getChildByName("2"),true)
        end
        if not HolidayData:get_zhzb_BZ() then
            self._Panel_zheng_ba_t:setEnabled(false)
            Functions.setGraySprite(self._Panel_zheng_ba_t:getChildByName("2"),true)
        end
        
        local onPanel1 = function()
            print("panel 1 click")
            if self.State == 1 then
                return
            end
            self.State = 1
            self:showTypeUI()
            self:showTeJia()
        end

        local onPanel2 = function()
            print("panel 2 click")

            if self.State == 2 then
                return
            end
            self.State = 2
            self:showTypeUI()
            self:showXiaoFei()
        end 

        local onPanel3 = function()
            print("panel 3 click")

            if self.State == 3 then
                return
            end
            self.State = 3
            self:showTypeUI()
            self:showZhengBa()
        end 

        Functions.initTabCom({ { self._Panel_jie_ri_t, onPanel1, HolidayOne }, { self._Panel_fan_li_t, onPanel2, HolidayTwo}, { self._Panel_zheng_ba_t, onPanel3, HolidayThree}})
        self:showView()
    end
    HolidayData:sendTeJia(onData)
    
    local bz = HolidayData:getXiaoFeiBZ()
    if bz == 1 then
        self._Sprite_fan_li_bz_t:setVisible(true)
    else
        self._Sprite_fan_li_bz_t:setVisible(false)
    end
    
    self._Text_xiao_fei_count_t:setVisible(false)
    
    self.day = PlayerData.eventAttr.day
    
end

function HolidayPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

--控制ui显示哪个界面
function HolidayPopView:showTypeUI()
    self._ListView_xiao_fei_t:setVisible(false)
    self._ListView_tian_ti_t:setVisible(false)
    self._Panel_te_jia_list_t:setVisible(false)
    self._Text_xiao_fei_count_t:setVisible(false)
end

--节日特惠
function HolidayPopView:showTeJia()
    Functions.printInfo(self.debug,"showLvCheng")

    self._Panel_te_jia_list_t:setVisible(true)
    local datas = HolidayData:getTeJia()
    local str = string.format(LanguageConfig.language_Holiday_2, datas.maxNum - datas.curNum)
    Functions.initLabelOfString( self._Text_all_text_info_t, datas.describe, self._Text_buy_num_t, str )
    local time = LanguageConfig.ui_HuoDong_2..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.jrth_st).." — "..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.jrth_et)
    self._Text_time_string_t:setText(time)
    
    local item = datas.goods.goods

    self._Text_yuan_bao_num_t:setText(tostring(datas.goods.price))
    assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")


    for k, v in ipairs(item) do
        local heroNode = nil
        local itemBan = nil
        if v[2] == 4 then --4为道具
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            itemBan = heroNode:getChildByName("model")
        elseif v[2] == 1 then--1为武将卡
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            itemBan = heroNode:getChildByName("model"):getChildByName("headColor")
        elseif v[2] == 5 then--1为武将卡碎片
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            itemBan = heroNode:getChildByName("model"):getChildByName("headColor")
        else
            assert(false,"商店出售的商品类型 type = " .. v[2] .. "错误")
        end

        local size = self._Panel_te_jia_item_t:getContentSize()
        local pX = 0
        heroNode:setScale(0.7)
        pX = Functions.getPosOfIndex(k, #item, 90, size.width/2)
        heroNode:setPosition(pX , size.height/2)
        self._Panel_te_jia_item_t:addChild(heroNode)

        local onImage = function(parameters)
            PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
        end
        itemBan:setVisible(true)
        itemBan:onTouch(Functions.createClickListener(onImage, "zoom"))


        if datas.maxNum - datas.curNum <= 0 then
            Functions.setEnabledBt(self._Button_buy_te_jia_t,false)
        else
            Functions.setEnabledBt(self._Button_buy_te_jia_t,true)
        end
    end

end

-- 消费返利
function HolidayPopView:showXiaoFei()
    Functions.printInfo(self.debug,"showLvCheng")
    --self:updateBZ()
    local datas = HolidayData:getXiaoFei()
    self._ListView_xiao_fei_t:setVisible(true)
    self._Text_xiao_fei_count_t:setVisible(true)
    local str = string.format(LanguageConfig.language_Holiday_1, datas.num)
    self._Text_xiao_fei_count_t:setText(str)
    Functions.initLabelOfString(self._Text_all_text_info_t, datas.describe)
    
    local time = LanguageConfig.ui_HuoDong_2..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.xffl_st).." — "..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.xffl_et)
    self._Text_time_string_t:setText(time)
    
    local bz = HolidayData:getXiaoFeiBZ()
    if bz == 1 then
        self._Sprite_fan_li_bz_t:setVisible(true)
    else
        self._Sprite_fan_li_bz_t:setVisible(false)
    end


    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")

        local str = string.format(LanguageConfig.language_HuoDong_18, data.need)
        button:getChildByName("Text_xiao_fei_num"):setText(str)

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1) 
                self:showXiaoFei()
            end
            HolidayData:sendGetXiaoFei(index, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))


        local heroNode = nil
        local item = data.goods

        assert(#item <= 5,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于5个")

        for k, v in pairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
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
    
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_xiao_fei_t, datas.goods, listHandler)
end

--诸候争霸
function HolidayPopView:showZhengBa()
    Functions.printInfo(self.debug,"ShowChengZhang")
    local datas = HolidayData:getZhengBa()
    self._ListView_tian_ti_t:setVisible(true)
    local time = LanguageConfig.ui_HuoDong_2..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.zhzb_st).." — "..TimerManager:formatTime("%Y-%m-%d  %H:%M", PlayerData.eventAttr.zhzb_et)
    self._Text_time_string_t:setText(time)

    Functions.initLabelOfString( self._Text_all_text_info_t, datas.describe)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")

        local heroNode = nil
        local item = data.goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in ipairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
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

        local level = HolidayData:getZhengBa().reward
        local EveryDayNum = 0
        if index == 1 then
            EveryDayNum = tostring(data.rank)
        else
            if level[index-1].rank+1 == data.rank then
                EveryDayNum = tostring(data.rank)
            else
                EveryDayNum = tostring(level[index-1].rank+1).."-"..tostring(data.rank)
            end
        end

        local str = "X"..tostring(data.score)
        Functions.initLabelOfString(button:getChildByName("Text_tian_ti_rank"), EveryDayNum, button:getChildByName("Image_4"):getChildByName("Text_score_num"), str)
    end
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_tian_ti_t, datas.reward, listHandler)
end

function HolidayPopView:onChangeView()
end

return HolidayPopView