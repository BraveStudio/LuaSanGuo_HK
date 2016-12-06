--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local HeroKillGuanKaViewController = class("HeroKillGuanKaViewController", BaseViewController)

local Functions = require("app.common.Functions")

HeroKillGuanKaViewController.debug = true
HeroKillGuanKaViewController.modulePath = ...
HeroKillGuanKaViewController.studioSpriteFrames = {"HeroKillGuanKaUI","HeroKillUI_Text","CB_blackbg","CBO_infor" }
--@auto code head end

--@Pre loading
HeroKillGuanKaViewController.spriteFrameNames = 
    {
    }

HeroKillGuanKaViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #HeroKillGuanKaViewController.studioSpriteFrames > 0 then
    HeroKillGuanKaViewController.spriteFrameNames = HeroKillGuanKaViewController.spriteFrameNames or {}
    table.insertto(HeroKillGuanKaViewController.spriteFrameNames, HeroKillGuanKaViewController.studioSpriteFrames)
end
function HeroKillGuanKaViewController:onDidLoadView()

    --output list
    self._Text_name_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Text_name")
	self._resNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("resNode")
	self._Text_small_str_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Text_small_str")
	self._Sprite_box_light_small_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Sprite_box_light_small")
	self._Sprite_6_ling_qu_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Button_small"):getChildByName("Sprite_6_ling_qu")
	self._Text_lot_str_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Text_lot_str")
	self._Sprite_box_light_lot_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Sprite_box_light_lot")
	self._Sprite_12_ling_qu_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Button_lot"):getChildByName("Sprite_12_ling_qu")
	self._Text_count_1_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_1"):getChildByName("Image_count_1"):getChildByName("Text_count_1")
	self._Panel_star_1_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_1"):getChildByName("Panel_star_1")
	self._Text_count_2_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_2"):getChildByName("Image_count_2"):getChildByName("Text_count_2")
	self._Panel_star_2_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_2"):getChildByName("Panel_star_2")
	self._Text_count_3_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_3"):getChildByName("Image_count_3"):getChildByName("Text_count_3")
	self._Panel_star_3_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_3"):getChildByName("Panel_star_3")
	self._Text_count_4_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_4"):getChildByName("Image_count_4"):getChildByName("Text_count_4")
	self._Panel_star_4_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_4"):getChildByName("Panel_star_4")
	self._Panel_icon_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon")
	self._Panel_guanqia_1_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_1")
	self._Panel_guanqia_2_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_2")
	self._3_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_2"):getChildByName("3")
	self._Panel_guanqia_3_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_3")
	self._3_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_3"):getChildByName("3")
	self._Panel_guanqia_4_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_4")
	self._Panel_item_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_item")
	self._Text_get_num_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Text_get_num")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_small_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Button_small")
	self._Button_small_t:onTouch(Functions.createClickListener(handler(self, self.onButton_smallClick), "zoom"))

	self._Button_lot_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_right"):getChildByName("Button_lot")
	self._Button_lot_t:onTouch(Functions.createClickListener(handler(self, self.onButton_lotClick), "zoom"))

	self._Button_saodang_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Button_saodang")
	self._Button_saodang_t:onTouch(Functions.createClickListener(handler(self, self.onButton_saodangClick), "zoom"))

	self._Button_zhandou_t = self.view_t.csbNode:getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Button_zhandou")
	self._Button_zhandou_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhandouClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_back btFunc
function HeroKillGuanKaViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_small btFunc
function HeroKillGuanKaViewController:onButton_smallClick()
    Functions.printInfo(self.debug,"Button_small button is click!")
    local data = HeroKillData:getHeroKillData()[self.ID]
    self:openChildView("app.ui.popViews.HeroKillAwardPopView", { isRemove = false, data = { awardData = data, awardStarType = 1 , id = self.ID, handler = handler(self,self.updateBOX) } })
end
--@auto code Button_small btFunc end

--@auto code Button_lot btFunc
function HeroKillGuanKaViewController:onButton_lotClick()
    Functions.printInfo(self.debug,"Button_lot button is click!")
    local data = HeroKillData:getHeroKillData()[self.ID]
    self:openChildView("app.ui.popViews.HeroKillAwardPopView", { isRemove = false, data = { awardData = data, awardStarType = 2 , id = self.ID, handler = handler(self,self.updateBOX) } })
end
--@auto code Button_lot btFunc end

--@auto code Button_saodang btFunc
function HeroKillGuanKaViewController:onButton_saodangClick()
    Functions.printInfo(self.debug,"Button_saodang button is click!")
    local neetPower = ConfigHandler:getKillHeroConfig(self.ID, self.smallID)

    local data = HeroKillData:getHeroKillData()[self.ID].diff
    local maxGkNum = g_gcldCfg.MaxCount - data[self.smallID].count
    self:openChildView("app.ui.popViews.SweepPopView",{isRemove = false, name = "SweepPopView",data = { bigId = self.ID, smallID = self.smallID,
        levelNum = maxGkNum, levelPower = neetPower["消耗能量"], type = 1, handler = handler(self,self.saodangData) }})
end
--@auto code Button_saodang btFunc end

--@auto code Button_zhandou btFunc
function HeroKillGuanKaViewController:onButton_zhandouClick()
    Functions.printInfo(self.debug,"Button_zhandou button is click!")
    --过关斩将测试代码
    GameCtlManager:push("app.ui.combatSystem.CombatViewController",
        { data = {  combatType = CombatCenter.CombatType.RB_KILL_HERO,
            big = self.ID,
            small = self.smallID,
        }
        })
end
--@auto code Button_zhandou btFunc end

--@auto button backcall end


--@auto code view display func
function HeroKillGuanKaViewController:onCreate()
    Functions.printInfo(self.debug_b," HeroKillGuanKaViewController controller create!")
end

function HeroKillGuanKaViewController:onDisplayView()
	Functions.printInfo(self.debug_b," HeroKillGuanKaViewController view enter display!")
    Functions.initResNodeUI(self._resNode_t,{ "nengliang"})
    
    --初使化小关卡id
    self.smallID = 1
    self:getOpenInit()
    self:show()
    self:updateBOX()
end
--@auto code view display func end

function HeroKillGuanKaViewController:show()
    Functions.printInfo(self.debug,"show ")
    
    self._Text_name_t:setText(HeroKillData:getHeroKillData()[self.ID].name)
    
    local StarNum = HeroKillData:getHeroKillData()[self.ID].diff[self.smallID].star
    if StarNum == 3 then
        Functions.setEnabledBt(self._Button_saodang_t,true)
    else
        Functions.setEnabledBt(self._Button_saodang_t,false)
    end
    
--    self._Sprite_box_light_small_t:stopAllActions()
--    self._Sprite_box_light_lot_t:stopAllActions()
    --星星宝箱外发光
    if HeroKillData:getHeroKillData()[self.ID].starFlag1 == 1 then
        if not self._Sprite_box_light_small_t:isVisible() then
            self._Sprite_box_light_small_t:setVisible(true)
            Functions.playActionWithBackCall(self._Sprite_box_light_small_t, UIActionTool:createBlinkAction(0.6))
        end
    end
        --星星宝箱外发光
    if HeroKillData:getHeroKillData()[self.ID].starFlag2 == 1 then
        if not self._Sprite_box_light_lot_t:isVisible() then
            self._Sprite_box_light_lot_t:setVisible(true)
            Functions.playActionWithBackCall(self._Sprite_box_light_lot_t, UIActionTool:createBlinkAction(0.6))
        end
    end
    
    
    if self.itemArray then
        for k, v in pairs(self.itemArray) do
            v:removeFromParentAndCleanup()
        end
    end
    
    local levelConfig = self:getItemInfo()
    self.itemArray = {}
    for k,v in pairs(levelConfig) do
        if v == nil then
        	break
        end
        local hero = Functions.createPartNode({ nodeType = v.type, nodeId = v.id, count = v.count })
        hero:setScale(0.6)
        hero:setPosition(80+90*k, 50)
        self._Panel_item_t:addChild(hero)
        self.itemArray[#self.itemArray + 1] = hero
    end
    
    local data = ConfigHandler:getKillHeroConfig(self.ID, self.smallID)
    self._Text_get_num_t:setText(data["金币"])

    
    local data = HeroKillData:getHeroKillData()[self.ID].diff
    for k,v in pairs(data) do
        local str = string.format("_Text_count_%d_t", k)
        Functions.initLabelOfString(self[str], tostring(v.count).."/"..tostring(g_gcldCfg.MaxCount))

        local PanelStar = string.format("_Panel_star_%d_t", k)
        if data[k].star > 0 then
            local size = self[PanelStar]:getContentSize()
            local px = 0
            local py = size.height/2
            for y = 1, data[k].star do
                px = string.format("%.2f", size.width / 3 * y) 

                local param = {scale = 0.6, pos = cc.p( px, py ), zorder = 10, spriteName ="commonUI/res/icons/star.png" }
                local sprite = Functions.createSprite(param)
                sprite:setAnchorPoint(1,0.5)
                self[PanelStar]:addChild(sprite)
            end
        end
    end
end

--获取关卡是否开启
function HeroKillGuanKaViewController:getOpenInit()
    local onPanelClick = function(data)
        if data == "Panel_guanqia_1" then
            if self.smallID ~= 1 then
                self.smallID = 1
                self:show()
            end
            
        elseif data == "Panel_guanqia_2" then
            if self.smallID ~= 2 then
                self.smallID = 2
                self:show()
            end
        elseif data == "Panel_guanqia_3" then
            if self.smallID ~= 3 then
                self.smallID = 3
                self:show()
            end
        elseif data == "Panel_guanqia_4" then
            if self.smallID ~= 4 then
                self.smallID = 4
                self:show()
            end
        end
    end

    local onDisTab2Click = function(data)
        PromptManager:openTipPrompt(LanguageConfig.language_MinFb_3)
    end

    local onDisTab3Click = function(data)
        PromptManager:openTipPrompt(LanguageConfig.language_MinFb_3)
    end

    local onDisTab4Click = function(data)
        PromptManager:openTipPrompt(LanguageConfig.language_MinFb_3)
    end

    local disTabDatas = {}
    if not self:getIsOpen(2) then
        disTabDatas[#disTabDatas+1] = { name = "Panel_guanqia_2", listener = onDisTab2Click }
    end
    if not self:getIsOpen(3) then
        disTabDatas[#disTabDatas+1] = { name = "Panel_guanqia_3", listener = onDisTab3Click }
    end
    if not self:getIsOpen(4) then
        disTabDatas[#disTabDatas+1] = { name = "Panel_guanqia_4", listener = onDisTab4Click }
    end
    Functions.initTabComWithSimple({ widget = self._Panel_icon_t, listener = onPanelClick, firstName = "Panel_guanqia_1", disTabDatas = disTabDatas })
end
--获取关卡是否开启
function HeroKillGuanKaViewController:getIsOpen(id)
    local data = HeroKillData:getHeroKillData()[self.ID].diff
    local isOpen = true
    --判断小关卡是否开启，要从它的前一小关是否得到星星来判定（第一小关默认全部开启）
    if id >= 2 and data[id-1].star == 0 then
        isOpen = false
    end
    return isOpen
end

--获取掉落数据
function HeroKillGuanKaViewController:getItemInfo()
    self.itemInfo = {}
    local data = ConfigHandler:getKillHeroConfig(self.ID, self.smallID)
    --最多5个道具
    for k = 1, 5 do
        local strId = string.format("物品%d_ID", k)
        local strType = string.format("物品%d类型", k)
        local strCount = string.format("物品%d数量", k)
        local info = {}
        --如果表中没有道具id了，说明就是最后一个
        if data[strId] == nil then
            break
        end
        info.id = data[strId]
        info.type = data[strType]
        info.Count = data[strCount]
        self.itemInfo[#self.itemInfo + 1] = info
    end
    return self.itemInfo
end

--接受push数据
function HeroKillGuanKaViewController:updateBOX()
    local dataFlag = HeroKillData:getHeroKillData()[self.ID]

    --星星宝箱外发光
    if dataFlag.starFlag1 ~= 1 then
        self._Sprite_box_light_small_t:setVisible(false)
        if dataFlag.starFlag1 == 2 then
            self._Sprite_6_ling_qu_t:setVisible(true)
        end
    end
    --星星宝箱外发光
    if dataFlag.starFlag2 ~= 1 then
        self._Sprite_box_light_lot_t:setVisible(false)
        if dataFlag.starFlag2 == 2 then
            self._Sprite_12_ling_qu_t:setVisible(true)
        end
    end
    
    --self._Sprite_box_light_small_t:setVisible(false)
end

--接受扫荡后的回调数据
function HeroKillGuanKaViewController:saodangData(data)
    HeroKillData:getHeroKillData()[self.ID].diff[self.smallID].count = data.count
    
    local str = string.format("_Text_count_%d_t", self.smallID)
    Functions.initLabelOfString(self[str], tostring(data.count).."/"..tostring(g_gcldCfg.MaxCount))
end

--接受push数据
function HeroKillGuanKaViewController:onReceivePushData(data)
    --大关卡id
    self.ID = data.id
end

--接受pop数据
function HeroKillGuanKaViewController:onReceivePopData(data)
    if data.result == 1 then
        HeroKillData:getHeroKillData()[self.ID].diff[self.smallID].star = data.starNum
        HeroKillData:getHeroKillData()[self.ID].diff[self.smallID].count = data.combatCount
        self:getOpenInit()
        self:show()
        --监听是否有可领的奖励
        GameEventCenter:dispatchEvent({ name = HeroKillData.UPDATE_PRIZE, data = data })
    elseif data.result == 0 then
        HeroKillData:getHeroKillData()[self.ID].diff[self.smallID].count = data.combatCount
        self:show()
    end
end


return HeroKillGuanKaViewController