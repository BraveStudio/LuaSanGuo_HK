--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local CarnivalPopView = class("CarnivalPopView", BasePopView)

local Functions = require("app.common.Functions")

CarnivalPopView.csbResPath = "lk/csb"
CarnivalPopView.debug = true
CarnivalPopView.studioSpriteFrames = {"HuoDongPopUI","CarnivalPopUI_Text","SquadPopUI","HuoDongPopUI_Text","CarnivalPopUI" }
--@auto code head end

--@Pre loading
CarnivalPopView.spriteFrameNames = 
    {
        "equipmentRes", "propRes"
    }

CarnivalPopView.animaNames = 
    {
    }



--@auto code uiInit
--add spriteFrames
if #CarnivalPopView.studioSpriteFrames > 0 then
    CarnivalPopView.spriteFrameNames = CarnivalPopView.spriteFrameNames or {}
    table.insertto(CarnivalPopView.spriteFrameNames, CarnivalPopView.studioSpriteFrames)
end
function CarnivalPopView:onInitUI()

    --output list
    self._Image_ban_ban_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Image_beijin"):getChildByName("Image_bei_ban"):getChildByName("Image_ban_ban")
	self._Image_ban_ban_tian_ti_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Image_beijin"):getChildByName("Image_bei_ban"):getChildByName("Image_ban_ban_tian_ti")
	self._Panel_Journey_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_Journey")
	self._Sprite_Journey_bz_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_Journey"):getChildByName("Sprite_Journey_bz")
	self._Panel_active_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_active")
	self._Sprite_active_bz_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_active"):getChildByName("Sprite_active_bz")
	self._Panel_te_jia_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_te_jia")
	self._Sprite_chong_zhi_huo_dong_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_te_jia"):getChildByName("Sprite_chong_zhi_huo_dong")
	self._Panel_xiao_hao_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_xiao_hao")
	self._Sprite_xiao_hao_bz_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_xiao_hao"):getChildByName("Sprite_xiao_hao_bz")
	self._Panel_tian_ti_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title"):getChildByName("Panel_tian_ti")
	self._ScrollView_title_1_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1")
	self._Panel_1_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_1")
	self._Panel_2_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_2")
	self._Panel_3_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_3")
	self._Panel_4_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_4")
	self._Panel_5_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_5")
	self._Panel_6_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_6")
	self._Panel_7_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("ScrollView_title_1"):getChildByName("Panel_7")
	self._Panel_all_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all")
	self._Text_time_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time")
	self._Text_time_num_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time_num")
	self._Text_jie_shao_info_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_jie_shao_info")
	self._Panel_all_text_info_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all_text_info")
	self._Text_all_text_info_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_all_text_info"):getChildByName("Text_all_text_info")
	self._Panel_xiao_fei_count_text_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_xiao_fei_count_text")
	self._ListView_Journey_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_Journey")
	self._Text_tiao_jian_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_Journey"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_tiao_jian")
	self._ListView_active_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_active")
	self._Text_tiao_jian_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_active"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_tiao_jian")
	self._ListView_xiao_fei_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_xiao_fei")
	self._ListView_tian_ti_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("ListView_tian_ti")
	self._Panel_te_jia_list_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list")
	self._Panel_te_jia_item_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Panel_te_jia_item")
	self._Text_yuan_bao_num_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Text_yuan_bao_num")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Image_beijin"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))

	self._Button_buy_te_jia_t = self.csbNode:getChildByName("Panel_kuang_huan"):getChildByName("Panel_info"):getChildByName("Panel_te_jia_list"):getChildByName("Button_buy_te_jia")
	self._Button_buy_te_jia_t:onTouch(Functions.createClickListener(handler(self, self.onButton_buy_te_jiaClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function CarnivalPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto code Button_buy_te_jia btFunc
function CarnivalPopView:onButton_buy_te_jiaClick()
    Functions.printInfo(self.debug,"Button_buy_te_jia button is click!")
    CarnivalData:sendGetTeJia(self.day, handler(self, self.showTeJia))
end
--@auto code Button_buy_te_jia btFunc end

--@auto button backcall end


--@auto code output func
function CarnivalPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function CarnivalPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
   --CarnivalData:sendLvCheng(handler(self,self.showLvCheng))
   CarnivalData:sendHuoYue()
   CarnivalData:sendTeJia()
   CarnivalData:sendXiaoFei()
   CarnivalData:sendTianTi()
   
   --cc.Node:setPosition(float,float)
   self._Button_close_t:setPosition(1029, 495)
   
    
    --请求每日充值
    local onData = function()
        if G_CurrentLanguage == "ch" then
            self._Panel_all_text_info_t:setVisible(true)
        else
            self._Panel_all_text_info_t:setVisible(false)
        end
        self:showLvCheng()
    end
    CarnivalData:sendLvCheng(onData)
    
    self.State = 1
    self.day = PlayerData.eventAttr.day
    local onPanel1 = function()
        print("panel 1 click")
        if self.State == 1 then
            return
        end
        self.State = 1
        self:showTypeUI()
    end

    local onPanel2 = function()
        print("panel 2 click")

        if self.State == 2 then
            return
        end
        self.State = 2
        self:showTypeUI()
    end 

    local onPanel3 = function()
        print("panel 3 click")

        if self.State == 3 then
            return
        end
        self.State = 3
        self:showTypeUI()
    end 

    local onPanel4 = function()
        print("panel 4 click")

        if self.State == 4 then
            return
        end
        self.State = 4
        self:showTypeUI()
    end 

    local onPanel5 = function()
        print("panel 5 click")
        if self.State == 5 then
            return
        end
        self.State = 5
        self:showTypeUI()
    end

    Functions.initTabCom({ { self._Panel_Journey_t, onPanel1, true }, { self._Panel_active_t, onPanel2}, { self._Panel_te_jia_t, onPanel3}, 
        { self._Panel_xiao_hao_t, onPanel4 }, { self._Panel_tian_ti_t, onPanel5}})
        
    self:initShowDay()

end

function CarnivalPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function CarnivalPopView:updateBZ()
    Functions.printInfo(self.debug,"updataBZ")
    if CarnivalData.lvChengBZ == true then
        self._Sprite_Journey_bz_t:setVisible(true)
    else
        self._Sprite_Journey_bz_t:setVisible(false)
    end
    if CarnivalData.HuoYueBZ == true then
        self._Sprite_active_bz_t:setVisible(true)
    else
        self._Sprite_active_bz_t:setVisible(false)
    end
    if CarnivalData.XiaoFeiBZ == true then
        self._Sprite_xiao_hao_bz_t:setVisible(true)
    else
        self._Sprite_xiao_hao_bz_t:setVisible(false)
    end
end

--控制ui显示哪个界面
function CarnivalPopView:showTypeUI()
    Functions.printInfo(self.debug,"showTypeUI")
    self._Panel_all_t:setVisible(false)
    if G_CurrentLanguage == "ch" then
    	self._Panel_all_text_info_t:setVisible(true)
    else
    	self._Panel_all_text_info_t:setVisible(false)
    end
    --关闭红点
    for k = 1, 7 do
        if k > self.day then
            break
        end
        local str = string.format("_Panel_%d_t",k)
        local sprite = string.format("Sprite_%d",k)

        self[str]:getChildByName(sprite):setVisible(false)
    end
    
    self._ScrollView_title_1_t:setVisible(true)
    --如果点击相同，不刷新ui
    self:ListClose()
    if self.State == 1 then
        self:showLvCheng()
    elseif self.State == 2 then
        self:showHuoYue()
    elseif self.State == 3 then
        self:showTeJia()
    elseif self.State == 4 then
        self:showXiaoFei()
    elseif self.State == 5 then
        self:showTianTi()
    end
end
--控制ui显示哪个界面
function CarnivalPopView:ListClose()
    Functions.printInfo(self.debug,"ListClose")
    self._ListView_Journey_t:setVisible(false)
    self._ListView_active_t:setVisible(false)
    self._ListView_xiao_fei_t:setVisible(false)
    self._ListView_tian_ti_t:setVisible(false)
    self._Panel_te_jia_list_t:setVisible(false)
    self._Panel_xiao_fei_count_text_t:setVisible(false)
    self._Image_ban_ban_t:setVisible(true)
end

function CarnivalPopView:showLvCheng()
    Functions.printInfo(self.debug,"showLvCheng")
    self:updateBZ()
    Functions.initLabelOfString( self._Text_all_text_info_t, g_welfareInstructions.lvCheng)
    local initDay = 0
    initDay = PlayerData.eventAttr.day
    -- if initDay ~= 7 then
    --     for k = initDay+1, 7 do
    --         local str = string.format("_Panel_%d_t",k)
    --         self[str]:setEnabled(false)
    --         Functions.setGraySprite(self[str]:getChildByName("2"),true)
    --     end
    -- end

    --显示红点
    for k = 1, 7 do
        if k > self.day then
    	   break
        end
        local str = string.format("_Panel_%d_t",k)
        local sprite = string.format("Sprite_%d",k)
        local datas = CarnivalData:getlvCheng(k)
        local open = false
        for i,v in pairs(datas) do
            if v.day == k and v.bz == 1 and v.day <= self.day then
                self[str]:getChildByName(sprite):setVisible(true)
                open = true
                break
            end
        end
        if not open then
            self[str]:getChildByName(sprite):setVisible(false)
        end
    end
    
    for k = 1, 7 do
        if initDay < k then
            local str = string.format("_Panel_%d_t",k)
            self[str]:setEnabled(false)
            Functions.setGraySprite(self[str]:getChildByName("2"),true)
        else
            local str = string.format("_Panel_%d_t",k)
            self[str]:setEnabled(true)
            Functions.setGraySprite(self[str]:getChildByName("2"),false)
        end
    end

    local listHandler = function(index, widget, data, model)

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
                self:showLvCheng()
            end
            CarnivalData:sendGetLvCheng(data.id, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))


        local heroNode = nil
        local item = data.goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
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
    local datas = CarnivalData:getlvCheng(self.day)
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_Journey_t, datas, listHandler)
end

function CarnivalPopView:showHuoYue()
    Functions.printInfo(self.debug,"showLvCheng")
    self:updateBZ()
    self:initShowDay()
    self.day = PlayerData.eventAttr.day
    local initDay = 0
    initDay = PlayerData.eventAttr.day

    for k = 1, 7 do
        if initDay ~= k then
            local str = string.format("_Panel_%d_t",k)
            self[str]:setEnabled(false)
            Functions.setGraySprite(self[str]:getChildByName("2"),true)
        end
    end
    Functions.initLabelOfString( self._Text_all_text_info_t, g_welfareInstructions.huoYue)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")
        Functions.initTextColor(banModel:getChildByName("Text_tiao_jian"),button:getChildByName("Text_tiao_jian"))
        local text = string.format("language_huoyue_%d", data.tj)
        local str = string.format(LanguageConfig[text], data.tjnum)
        button:getChildByName("Text_tiao_jian"):setText(str)

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1) 
                self:showHuoYue()
            end
            CarnivalData:sendGetHuoYue(data.id, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))


        local heroNode = nil
        local item = data.goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
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
    local datas = CarnivalData:getHuoYue(self.day)
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_active_t, datas, listHandler)
end

function CarnivalPopView:showTeJia()
    Functions.printInfo(self.debug,"showLvCheng")
    
    self._Panel_te_jia_list_t:setVisible(true)
    Functions.initLabelOfString( self._Text_all_text_info_t, g_welfareInstructions.teJia)
    self:initShowDay()
    self.day = PlayerData.eventAttr.day
    local datas = CarnivalData:getTeJia(self.day)
    
    local item = datas.goods
    
    self._Text_yuan_bao_num_t:setText(tostring(datas.price))
    assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

    
    local initDay = 0
    initDay = PlayerData.eventAttr.day
    for k = 1, 7 do
        if initDay ~= k then
            local str = string.format("_Panel_%d_t",k)
            self[str]:setEnabled(false)
            Functions.setGraySprite(self[str]:getChildByName("2"),true)
        end
    end

    for k, v in pairs(item) do
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
        
--        local Image = "Image_"..tostring(k)

        --local itemBan = heroNode:getChildByName("model"):getChildByName("headColor")
        
        local onImage = function(parameters)
            PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
        end
        --heroNode:getChildByName("model"):getChildByName("headColor"):setVisible(true)
        --heroNode:getChildByName("model"):getChildByName("frame"):setEnabled(true)
        itemBan:setVisible(true)
        itemBan:onTouch(Functions.createClickListener(onImage, "zoom"))

        
        if datas.bz == 0 then
            Functions.setEnabledBt(self._Button_buy_te_jia_t,false)
            --Functions.loadImageWithSprite(self._Button_buy_te_jia_t:getChildByName("Sprite_but_text"),"commonUI/res/common/lingqu.png")
        elseif datas.bz == 2 then
            Functions.setEnabledBt(self._Button_buy_te_jia_t,false)
            --Functions.loadImageWithSprite(self._Button_buy_te_jia_t:getChildByName("Sprite_but_text"),"commonUI/res/common/yilingqu.png")
        elseif datas.bz == 1 then
            Functions.setEnabledBt(self._Button_buy_te_jia_t,true)
            --Functions.loadImageWithSprite(self._Button_buy_te_jia_t:getChildByName("Sprite_but_text"),"commonUI/res/common/lingqu.png")
        end
    end
    
end

function CarnivalPopView:showXiaoFei()
    Functions.printInfo(self.debug,"showLvCheng")
    self:updateBZ()
    local str = string.format(LanguageConfig.language_Carnival_1, CarnivalData:getXiaoFeiNum())
    self._Panel_xiao_fei_count_text_t:getChildByName("Text_xiao_fei_count"):setText(str)
    self._Panel_xiao_fei_count_text_t:setVisible(true)
    self._ScrollView_title_1_t:setVisible(false)
    Functions.initLabelOfString( self._Text_all_text_info_t, g_welfareInstructions.xiaoHao)
    

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")

        local str = string.format(LanguageConfig.language_HuoDong_18, data.consume)
        button:getChildByName("Text_xiao_fei_num"):setText(str)

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1) 
                self:showXiaoFei()
            end
            CarnivalData:sendGetXiaoFei(index, updateShow)
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
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
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
    local datas = CarnivalData:getXiaoFei()
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_xiao_fei_t, datas, listHandler)
end

--天梯争霸
function CarnivalPopView:showTianTi()
    Functions.printInfo(self.debug,"ShowChengZhang")
    --self._Text_gold_num_t:setVisible(false)
    
    self._Panel_all_t:setVisible(true)
    self._Panel_all_text_info_t:setVisible(false)
    self._ScrollView_title_1_t:setVisible(false)
    self._Image_ban_ban_t:setVisible(false)
    Functions.initLabelOfString( self._Text_jie_shao_info_t, g_welfareInstructions.tianTi)
    --显示时间
    self:ShowTime()

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")

        local heroNode = nil
        local item = data.goods
--        local tt =  #item + 1
--        if #item < 4 then
--            local prop = {id = -7, type = 4, count = data.score}
--            item[#item + 1] = prop
--        end

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

        local level = CarnivalData:getTianTiRank()
        local EveryDayNum = 0
        if index == 1 then
            EveryDayNum = tostring(data.rank)
        else
            local iii = level[index-1].rank+1
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
    local datas = CarnivalData:getTianTiRank()
    Functions.bindListWithData(self._ListView_tian_ti_t, datas, listHandler)
end

function CarnivalPopView:Show(type)
    Functions.printInfo(self.debug,"Show")

end

--显示倒记时
function CarnivalPopView:showTime_(wiget, time)

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

    end
    Functions.bindEventListener(wiget.timeSprite, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

function CarnivalPopView:ShowTime()
    Functions.printInfo(self.debug,"Show")
    local Start = CarnivalData.TianTiStartTime
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
    local EndTime = CarnivalData.TianTiEndTime
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


    if os.time(CarnivalData.TianTiStartTime) > TimerManager:getCurrentSecond() then
        Functions.initLabelOfString(self._Text_time_num_t, LanguageConfig.language_HuoDong_12)
    else
        self:showTime_(self._Text_time_num_t, os.time(CarnivalData.TianTiEndTime))
    end
end

--显示天数
function CarnivalPopView:initShowDay()
    local initDay = PlayerData.eventAttr.day
    local day1 = false
    local day2 = false
    local day3 = false
    local day4 = false
    local day5 = false
    local day6 = false
    local day7 = false   
    if initDay == 1 then
        day1 = true
    elseif initDay == 2 then
        day2 = true
    elseif initDay == 3 then
        day3 = true
    elseif initDay == 4 then
        day4 = true
    elseif initDay == 5 then
        day5 = true
    elseif initDay == 6 then
        day6 = true
    elseif initDay == 7 then
        day7 = true
    end

    local onDay1 = function()
        print("onDay1 click")
        if self.day == 1 then
            return
        end
        self.day = 1
        self:showTypeUI()
    end 
    local onDay2 = function()
        print("onDay2 click")
        if self.day == 2 then
            return
        end
        self.day = 2
        self:showTypeUI()
    end 
    local onDay3 = function()
        print("onDay3 click")
        if self.day == 3 then
            return
        end
        self.day = 3
        self:showTypeUI()
    end 
    local onDay4 = function()
        print("onDay4 click")
        if self.day == 4 then
            return
        end
        self.day = 4
        self:showTypeUI()
    end 
    local onDay5 = function()
        print("onDay5 click")
        if self.day == 5 then
            return
        end
        self.day = 5
        self:showTypeUI()
    end     

    local onDay6 = function()
        print("onDay6 click")
        if self.day == 6 then
            return
        end
        self.day = 6
        self:showTypeUI()
    end 
    local onDay7 = function()
        print("onDay7 click")
        if self.day == 7 then
            return
        end
        self.day = 7
        self:showTypeUI()
    end 

    Functions.initTabCom({ { self._Panel_1_t, onDay1, day1 }, { self._Panel_2_t, onDay2, day2}, { self._Panel_3_t, onDay3,day3}, 
        { self._Panel_4_t, onDay4,day4 }, { self._Panel_5_t, onDay5,day5}, { self._Panel_6_t, onDay6,day6}, { self._Panel_7_t, onDay7,day7}})
end

return CarnivalPopView