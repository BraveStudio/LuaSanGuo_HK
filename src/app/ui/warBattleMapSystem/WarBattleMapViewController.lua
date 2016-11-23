--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local WarBattleMapViewController = class("WarBattleMapViewController", BaseViewController)

local Functions = require("app.common.Functions")

WarBattleMapViewController.debug = true
WarBattleMapViewController.modulePath = ...
WarBattleMapViewController.studioSpriteFrames = {"WarUI_Text","GuildBattleMapUI","WarUI" }
--@auto code head end

--@Pre loading
WarBattleMapViewController.spriteFrameNames = 
    {
    }

WarBattleMapViewController.animaNames = 
    {
        "combatAni"
    }


--@auto code uiInit
--add spriteFrames
if #WarBattleMapViewController.studioSpriteFrames > 0 then
    WarBattleMapViewController.spriteFrameNames = WarBattleMapViewController.spriteFrameNames or {}
    table.insertto(WarBattleMapViewController.spriteFrameNames, WarBattleMapViewController.studioSpriteFrames)
end
function WarBattleMapViewController:onDidLoadView()

    --output list
    self._Image_guild_map_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map")
	self._Panel_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_1")
	self._Sprite_donghua_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_1"):getChildByName("Sprite_donghua_1")
	self._Text_name_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_1"):getChildByName("Sprite_name_bg"):getChildByName("Text_name_1")
	self._Panel_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_2")
	self._Sprite_donghua_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_2"):getChildByName("Sprite_donghua_2")
	self._Text_name_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_2"):getChildByName("Sprite_name_bg_2"):getChildByName("Text_name_2")
	self._Panel_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_3")
	self._Sprite_donghua_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_3"):getChildByName("Sprite_donghua_3")
	self._Text_name_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_3"):getChildByName("Sprite_name_bg_3"):getChildByName("Text_name_3")
	self._Panel_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_4")
	self._Sprite_donghua_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_4"):getChildByName("Sprite_donghua_4")
	self._Text_name_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_4"):getChildByName("Sprite_name_bg_4"):getChildByName("Text_name_4")
	self._Panel_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_5")
	self._Sprite_donghua_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_5"):getChildByName("Sprite_donghua_5")
	self._Text_name_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_5"):getChildByName("Sprite_name_bg_5"):getChildByName("Text_name_5")
	self._Panel_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_6")
	self._Sprite_donghua_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_6"):getChildByName("Sprite_donghua_6")
	self._Text_name_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_6"):getChildByName("Sprite_name_bg_6"):getChildByName("Text_name_6")
	self._Panel_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_7")
	self._Sprite_donghua_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_7"):getChildByName("Sprite_donghua_7")
	self._Text_name_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_7"):getChildByName("Sprite_name_bg_7"):getChildByName("Text_name_7")
	self._Panel_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_8")
	self._Sprite_donghua_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_8"):getChildByName("Sprite_donghua_8")
	self._Text_name_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_8"):getChildByName("Sprite_name_bg_8"):getChildByName("Text_name_8")
	self._Panel_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_9")
	self._Sprite_donghua_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_9"):getChildByName("Sprite_donghua_9")
	self._Text_name_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_9"):getChildByName("Sprite_name_bg_9"):getChildByName("Text_name_9")
	self._Panel_1_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1_1")
	self._Panel_1_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1_2")
	self._Panel_1_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1_3")
	self._Text_tiaozhan_num_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Image_tiaozhan_num"):getChildByName("Text_tiaozhan_num")
	
    --label list
    
    --button list
    self._Image_city_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_1"):getChildByName("Image_city_1")
	self._Image_city_1_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_1Click), "zoom"))

	self._Image_city_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_2"):getChildByName("Image_city_2")
	self._Image_city_2_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_2Click), "zoom"))

	self._Image_city_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_3"):getChildByName("Image_city_3")
	self._Image_city_3_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_3Click), "zoom"))

	self._Image_city_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_4"):getChildByName("Image_city_4")
	self._Image_city_4_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_4Click), "zoom"))

	self._Image_city_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_5"):getChildByName("Image_city_5")
	self._Image_city_5_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_5Click), "zoom"))

	self._Image_city_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_6"):getChildByName("Image_city_6")
	self._Image_city_6_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_6Click), "zoom"))

	self._Image_city_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_7"):getChildByName("Image_city_7")
	self._Image_city_7_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_7Click), "zoom"))

	self._Image_city_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_8"):getChildByName("Image_city_8")
	self._Image_city_8_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_8Click), "zoom"))

	self._Image_city_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_9"):getChildByName("Image_city_9")
	self._Image_city_9_t:onTouch(Functions.createClickListener(handler(self, self.onImage_city_9Click), "zoom"))

	self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_BUT_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Button_BUT_1")
	self._Button_BUT_1_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_1Click), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Image_city_1 btFunc
function WarBattleMapViewController:onImage_city_1Click()
    Functions.printInfo(self.debug,"Image_city_1 button is click!")
    self.smallID = 1
    local ppp = self.bigID
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_1 btFunc end

--@auto code Image_city_2 btFunc
function WarBattleMapViewController:onImage_city_2Click()
    Functions.printInfo(self.debug,"Image_city_2 button is click!")
    self.smallID = 2
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_2 btFunc end

--@auto code Image_city_3 btFunc
function WarBattleMapViewController:onImage_city_3Click()
    Functions.printInfo(self.debug,"Image_city_3 button is click!")
    self.smallID = 3
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_3 btFunc end

--@auto code Image_city_4 btFunc
function WarBattleMapViewController:onImage_city_4Click()
    Functions.printInfo(self.debug,"Image_city_4 button is click!")
    self.smallID = 4
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_4 btFunc end

--@auto code Image_city_5 btFunc
function WarBattleMapViewController:onImage_city_5Click()
    Functions.printInfo(self.debug,"Image_city_5 button is click!")
    self.smallID = 5
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_5 btFunc end

--@auto code Image_city_6 btFunc
function WarBattleMapViewController:onImage_city_6Click()
    Functions.printInfo(self.debug,"Image_city_6 button is click!")
    self.smallID = 6
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_6 btFunc end

--@auto code Image_city_7 btFunc
function WarBattleMapViewController:onImage_city_7Click()
    Functions.printInfo(self.debug,"Image_city_7 button is click!")
    self.smallID = 7
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_7 btFunc end

--@auto code Image_city_8 btFunc
function WarBattleMapViewController:onImage_city_8Click()
    Functions.printInfo(self.debug,"Image_city_8 button is click!")
    self.smallID = 8
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_8 btFunc end

--@auto code Image_city_9 btFunc
function WarBattleMapViewController:onImage_city_9Click()
    Functions.printInfo(self.debug,"Image_city_9 button is click!")
    self.smallID = 9
    WarData:setOneStrongholdInfo(self.bigID, self.smallID, handler(self, self.jumpSmallJuDian))
end
--@auto code Image_city_9 btFunc end



--@auto code Button_back btFunc
function WarBattleMapViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    WarData:sendStrongholdLeave(self.bigID)
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_fuhuo btFunc
function WarBattleMapViewController:onButton_fuhuoClick()
    Functions.printInfo(self.debug,"Button_fuhuo button is click!")
end
--@auto code Button_fuhuo btFunc end

--@auto code Button_but_1 btFunc
function WarBattleMapViewController:onButton_but_1Click()
    Functions.printInfo(self.debug,"Button_but_1 button is click!")
    WarData:sendCityRank(self.bigID, handler(self,self.jumpRank))
end
--@auto code Button_but_1 btFunc end

--@auto button backcall end


--@auto code view display func
function WarBattleMapViewController:onCreate()
    Functions.printInfo(self.debug_b," WarBattleMapViewController controller create!")
end

function WarBattleMapViewController:onDisplayView()
	Functions.printInfo(self.debug_b," WarBattleMapViewController view enter display!")
	
	self.smallID = 1
    local countInfo = WarData:getWarCount()
    local str = tostring(countInfo.plusCount).."/"..tostring(countInfo.allCount)
    Functions.initLabelOfString(self._Text_tiaozhan_num_t, str)
	
    Functions.loadImageWithWidget(self._Image_guild_map_t,"map/warMap.jpg")
    self.switch = true
    
    self:showData()
    
       --监听城池信息改变
    local onTheWar = function(event)
    
        self:showBuilding(event.data.id)
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.THE_WAR, onTheWar)

    --小据点攻破
    local onStrongholdChange = function(event)
        self:showJuDian(event.data.id)
        self:showBuilding(event.data.id)
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.STRONGHOLD_CHANGE, onStrongholdChange)
    
    --城池占领
    local onStrongholdAll = function(event)
        self:showData()
        self:openChildView("app.ui.popViews.WarResultPopView", {data = {bigID = self.bigID}, isRemove = false})
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.STRONGHOLD_ALL, onStrongholdAll)
    
    --水晶监听
    local onShuiJin = function(event)
        for k, v in pairs(WarData:getResources()) do
            local str = string.format( "_Panel_1_%d_t", k )
            local Loading = math.floor(( v / g_gzCfg.winNeedCrystal) * 100)
            self[str]:getChildByName("LoadingBar"):setPercent(Loading)
            local strNum = tostring(v).."/"..g_gzCfg.winNeedCrystal
            self[str]:getChildByName("Text_num"):setString(strNum)
        end
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, WarData.SHUI_JIN, onShuiJin)

end
--@auto code view display func end

function WarBattleMapViewController:jumpSmallJuDian()
    Functions.printInfo(self.debug_b,"jumpSmallJuDian")
    --打开二级界面
    self:openChildView("app.ui.popViews.WarKaiZhanPopView", {data = {bigId = self.bigID, smallId = self.smallID}})
end

--初使化界面
function WarBattleMapViewController:showData()
    for k, v in pairs(WarData:getResources()) do
        local str = string.format( "_Panel_1_%d_t", k )
        local Loading = math.floor(( v / g_gzCfg.winNeedCrystal) * 100)
        self[str]:getChildByName("LoadingBar"):setPercent(Loading)
        local strNum = tostring(v).."/"..g_gzCfg.winNeedCrystal
        self[str]:getChildByName("Text_num"):setString(strNum)
    end
    
    local juDian = WarData:getStrongholdInfo()
    for k,v in ipairs(juDian) do
        local str = string.format( "_Panel_%d_t", k )
        local qizi = string.format( "Image_qizi_%d", k )
        local flag = ""
        if v.camp == 100 then
            flag = "commonUI/res/lk/WarUI/qunxiong_qizi.png"
        elseif v.camp == 1 then
            flag = "commonUI/res/lk/WarUI/wei_qizi.png"
        elseif v.camp == 2 then
            flag = "commonUI/res/lk/WarUI/shu_qizi.png"
        elseif v.camp == 3 then
            flag = "commonUI/res/lk/WarUI/wu_qizi.png"
        end
        Functions.loadImageWithWidget(self[str]:getChildByName(qizi), flag)
        self:showBuilding(k)
    end
end

--小据点的改变
function WarBattleMapViewController:showJuDian(id)
    local data = WarData:getJuDian(id)
    local str = string.format( "_Panel_%d_t", id )
    local qizi = string.format( "Image_qizi_%d", id )
    local flag = ""
    if data.camp == 100 then
        flag = "commonUI/res/lk/WarUI/qunxiong_qizi.png"
    elseif data.camp == 1 then
        flag = "commonUI/res/lk/WarUI/wei_qizi.png"
    elseif data.camp == 2 then
        flag = "commonUI/res/lk/WarUI/shu_qizi.png"
    elseif data.camp == 3 then
        flag = "commonUI/res/lk/WarUI/wu_qizi.png"
    end
    Functions.loadImageWithWidget(self[str]:getChildByName(qizi), flag)
end

function WarBattleMapViewController:showBuilding(id)
    local data = WarData:getJuDian(id)
    local donghua = string.format("_Sprite_donghua_%d_t", id)
    local name = string.format("_Text_name_%d_t", id)
    self[name]:setString(data.name)

    local callBack = function()
    --target:removeFromParent()
    end
    if data.state == 1 then
        self[donghua]:setVisible(true)
        self[donghua]:stopAllActions()
        Functions.playSequenceAction(self[donghua], { { actionName = "combatAni",repeatNum = 1} }, 0, 0, false, callBack )
    else
        self[donghua]:stopAllActions()
        self[donghua]:setVisible(false)
    end
end

--跳转到城池伤害界面
function WarBattleMapViewController:jumpRank()
    self:openChildView("app.ui.popViews.WarDamagePopView", {data = {type = 1}})
end

--接受push数据
function WarBattleMapViewController:onReceivePushData(data)
    self.bigID = data.bigID
end
--接受pop数
function WarBattleMapViewController:onReceivePopData(event)
    local countInfo = WarData:getWarCount()
    countInfo.plusCount = event.combatCount
    local str = tostring(countInfo.plusCount).."/"..tostring(countInfo.allCount)
    Functions.initLabelOfString(self._Text_tiaozhan_num_t, str)
end

return WarBattleMapViewController