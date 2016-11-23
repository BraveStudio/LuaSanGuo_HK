--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarRenMianPopView = class("WarRenMianPopView", BasePopView)

local Functions = require("app.common.Functions")

WarRenMianPopView.csbResPath = "lk/csb"
WarRenMianPopView.debug = true
WarRenMianPopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","RankUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarRenMianPopView.studioSpriteFrames > 0 then
    WarRenMianPopView.spriteFrameNames = WarRenMianPopView.spriteFrameNames or {}
    table.insertto(WarRenMianPopView.spriteFrameNames, WarRenMianPopView.studioSpriteFrames)
end
function WarRenMianPopView:onInitUI()

    --output list
    self._Panel_new_num_1_t = self.csbNode:getChildByName("Panel_RenMian_info"):getChildByName("Panel_new_num_1")
	self._Panel_old_num_2_t = self.csbNode:getChildByName("Panel_RenMian_info"):getChildByName("Panel_old_num_2")
	self._Panel_player_t = self.csbNode:getChildByName("Panel_RenMian_info"):getChildByName("Panel_player")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_RenMian_info"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function WarRenMianPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto button backcall end


--@auto code output func
function WarRenMianPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarRenMianPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
    --默认为本轮贡献
    self.type = 1
    self:showInfo()

    local onPanel1 = function()
        print("panel 1 click")
        if self.type ~= 1 then
            self.type = 1
        end
        self:showInfo()
    end 

    local onPanel2 = function()
        print("panel 2 click")
        if self.type ~= 2 then
            self.type = 2
        end
        self:showInfo()
    end 

    Functions.initTabCom({ { self._Panel_new_num_1_t, onPanel1, true }, { self._Panel_old_num_2_t, onPanel2}})
end

function WarRenMianPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarRenMianPopView:showInfo()
    Functions.printInfo(self.debug,"showInfo")

    local listHandler = function(index, widget, model, data)
        Functions.initTextColor(model:getChildByName("Text_offer"),widget:getChildByName("Text_offer"))
        Functions.initTextColor(model:getChildByName("Text_num"),widget:getChildByName("Text_num"))
        Functions.initTextColor(model:getChildByName("Text_player"),widget:getChildByName("Text_player"))

        --        widget:getChildByName("Button_renmian"):setTouchEnabled(true)
        --        widget:getChildByName("Button_renmian"):setSwallowTouches(false)

        widget:setTouchEnabled(false)

        if self.type == 1 then
            widget:getChildByName("Text_num"):setString(data.curTribute)
        elseif self.type == 2 then
            widget:getChildByName("Text_num"):setString(data.freTribute)
        end
        widget:getChildByName("Text_offer"):setString(data.offer)
        widget:getChildByName("Text_player"):setString(data.name)
        widget:getChildByName("BitmapFontLabel_rank"):setString(index)

        if data.power >= 1  then
            widget:getChildByName("Button_renmian"):setVisible(false)
        else
            widget:getChildByName("Button_renmian"):setVisible(true)
        end
        local onClickOK = function(event)
            --全员邮件
            self._controller_t:openChildView("app.ui.popViews.War_CY_RenMianPopView", {data = {datas = data, Handler = handler(self, self.onHandler)}})

        end
        widget:getChildByName("Button_renmian"):onTouch(Functions.createClickListener(onClickOK, "zoom"))

    end

    local AppointmentInfo = {}
    if self.type == 1 then
        AppointmentInfo = WarData:getAppointmentInfo()
    elseif self.type == 2 then
        AppointmentInfo = WarData:getAppointmentOldInfo()
    end
    Functions.bindTableViewWithData(self._Panel_player_t,{ firstData = AppointmentInfo },{handler = listHandler},{direction = false, col = 1, firstSegment = 0, segment = 2 }) 

end

function WarRenMianPopView:onHandler()
    --Functions.printInfo(self.debug,"onHandler")
    self:showInfo()
end

return WarRenMianPopView