--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local War_CY_RenMianPopView = class("War_CY_RenMianPopView", BasePopView)

local Functions = require("app.common.Functions")

War_CY_RenMianPopView.csbResPath = "lk/csb"
War_CY_RenMianPopView.debug = true
War_CY_RenMianPopView.studioSpriteFrames = {"WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #War_CY_RenMianPopView.studioSpriteFrames > 0 then
    War_CY_RenMianPopView.spriteFrameNames = War_CY_RenMianPopView.spriteFrameNames or {}
    table.insertto(War_CY_RenMianPopView.spriteFrameNames, War_CY_RenMianPopView.studioSpriteFrames)
end
function War_CY_RenMianPopView:onInitUI()

    --output list
    self._Image_head_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Image_head_bg"):getChildByName("Image_head")
	self._Text_zhiwei_1_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_1"):getChildByName("Text_zhiwei_1")
	self._Text_zhiwei_2_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_2"):getChildByName("Text_zhiwei_2")
	self._Text_zhiwei_3_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_3"):getChildByName("Text_zhiwei_3")
	self._Text_name_1_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Text_name_1")
	self._Text_level_1_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Text_level_1")
	self._Text_zhiwei_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Text_zhiwei")
	self._Text_zhiwei_4_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_4"):getChildByName("Text_zhiwei_4")
	self._Text_zhiwei_5_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_5"):getChildByName("Text_zhiwei_5")
	self._Text_zhiwei_6_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_6"):getChildByName("Text_zhiwei_6")
	
    --label list
    
    --button list
    self._Button_zhi_wei_1_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_1")
	self._Button_zhi_wei_1_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_1Click), "zoom"))

	self._Button_zhi_wei_2_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_2")
	self._Button_zhi_wei_2_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_2Click), "zoom"))

	self._Button_zhi_wei_3_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_3")
	self._Button_zhi_wei_3_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_3Click), "zoom"))

	self._Button_zhi_wei_4_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_4")
	self._Button_zhi_wei_4_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_4Click), "zoom"))

	self._Button_zhi_wei_5_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_5")
	self._Button_zhi_wei_5_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_5Click), "zoom"))

	self._Button_zhi_wei_6_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_zhi_wei_6")
	self._Button_zhi_wei_6_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhi_wei_6Click), "zoom"))

	self._Button_close_t = self.csbNode:getChildByName("Panel_c_y"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_zhi_wei_1 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_1Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_1 button is click!")
    local type = 1
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_1 btFunc end

--@auto code Button_zhi_wei_2 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_2Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_2 button is click!")
    local type = 2
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_2 btFunc end

--@auto code Button_zhi_wei_3 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_3Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_3 button is click!")
    local type = 3
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_3 btFunc end

--@auto code Button_zhi_wei_4 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_4Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_4 button is click!")
    local type = 4
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_4 btFunc end

--@auto code Button_zhi_wei_5 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_5Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_5 button is click!")
    local type = 5
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_5 btFunc end

--@auto code Button_zhi_wei_6 btFunc
function War_CY_RenMianPopView:onButton_zhi_wei_6Click()
    Functions.printInfo(self.debug,"Button_zhi_wei_6 button is click!")
    local type = 6
    self:sendOffer(type)
end
--@auto code Button_zhi_wei_6 btFunc end

--@auto code Button_close btFunc
function War_CY_RenMianPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto button backcall end


--@auto code output func
function War_CY_RenMianPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function War_CY_RenMianPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	self.dataInfo = data.datas
    self.Handler = data.Handler
    
    Functions.initLabelOfString( self._Text_zhiwei_6_t, LanguageConfig.language_war_11)

    local myPower = WarData:getAppointmentMyInfo()
    if myPower.power ~= 1 then
        Functions.setEnabledBt( self._Button_zhi_wei_6_t, false )
        self._Button_zhi_wei_5_t:setVisible(false)
    end
    for k, v in pairs(myPower.spoffer) do
        local str = string.format("_Text_zhiwei_%d_t", k)
        local strBut = string.format("_Button_zhi_wei_%d_t", k)
        if v ~= 0 then
            Functions.setEnabledBt( self[strBut], false )
        end
        self[str]:setString(g_gzCfg.power[myPower.power][k])
    end
    self:showInfo()
end

function War_CY_RenMianPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function War_CY_RenMianPopView:showInfo()
    Functions.printInfo(self.debug,"showInfo")
    self._Text_name_1_t:setString(self.dataInfo.name)
    self._Text_level_1_t:setString(self.dataInfo.level)
    self._Text_zhiwei_t:setString(self.dataInfo.offer)
    Functions.loadImageWithWidget( self._Image_head_t, Functions.getDisHeadFImagePathOfId(self.dataInfo.pic) )
end


function War_CY_RenMianPopView:showRefresh(type)
    Functions.printInfo(self.debug,"showRefresh")
    local strBut = string.format("_Button_zhi_wei_%d_t", type)
    Functions.setEnabledBt(self[strBut], false )
    self.close(self)
end


function War_CY_RenMianPopView:sendOffer(type)
    Functions.printInfo(self.debug,"sendOffer")
    if type == 6 then
        WarData:sendUndo(self.dataInfo.uid, type, self.Handler, handler(self, self.showRefresh))
    else
        WarData:sendAppointment (self.dataInfo.uid, type, self.Handler, handler(self, self.showRefresh))
    end
    
end

return War_CY_RenMianPopView