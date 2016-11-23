--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarButPopView = class("WarButPopView", BasePopView)

local Functions = require("app.common.Functions")

WarButPopView.csbResPath = "lk/csb"
WarButPopView.debug = true
WarButPopView.studioSpriteFrames = {"WarUI_Text","CBO_unionBgTwo" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarButPopView.studioSpriteFrames > 0 then
    WarButPopView.spriteFrameNames = WarButPopView.spriteFrameNames or {}
    table.insertto(WarButPopView.spriteFrameNames, WarButPopView.studioSpriteFrames)
end
function WarButPopView:onInitUI()

    --output list
    
    --label list
    
    --button list
    self._Button_but_function_1_t = self.csbNode:getChildByName("Panel_but_function"):getChildByName("Button_but_function_1")
	self._Button_but_function_1_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_function_1Click), "zoom"))

	self._Button_but_function_2_t = self.csbNode:getChildByName("Panel_but_function"):getChildByName("Button_but_function_2")
	self._Button_but_function_2_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_function_2Click), "zoom"))

	self._Button_but_function_3_t = self.csbNode:getChildByName("Panel_but_function"):getChildByName("Button_but_function_3")
	self._Button_but_function_3_t:onTouch(Functions.createClickListener(handler(self, self.onButton_but_function_3Click), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_but_function_1 btFunc
function WarButPopView:onButton_but_function_1Click()
    Functions.printInfo(self.debug,"Button_but_function_1 button is click!")
    WarData:sendAppointmentInfo(handler(self, self.jumpAppointment))
end
--@auto code Button_but_function_1 btFunc end

--@auto code Button_but_function_2 btFunc
function WarButPopView:onButton_but_function_2Click()
    Functions.printInfo(self.debug,"Button_but_function_2 button is click!")
    --修改公告
    self._controller_t:openChildView("app.ui.popViews.UnionNoticePopView", {data = {type = 2}})
end
--@auto code Button_but_function_2 btFunc end

--@auto code Button_but_function_3 btFunc
function WarButPopView:onButton_but_function_3Click()
    Functions.printInfo(self.debug,"Button_but_function_3 button is click!")
    --全员邮件
    self._controller_t:openChildView("app.ui.popViews.UnionMailPopView", {data = {type = 2}})
end
--@auto code Button_but_function_3 btFunc end

--@auto button backcall end


--@auto code output func
function WarButPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarButPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
end

function WarButPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarButPopView:jumpAppointment()
    Functions.printInfo(self.debug,"jumpAppointment")
    --官职任免
    self._controller_t:openChildView("app.ui.popViews.WarRenMianPopView", {isRemove = false})
end

return WarButPopView