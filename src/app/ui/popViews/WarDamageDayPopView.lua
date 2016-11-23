--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarDamageDayPopView = class("WarDamageDayPopView", BasePopView)

local Functions = require("app.common.Functions")

WarDamageDayPopView.csbResPath = "lk/csb"
WarDamageDayPopView.debug = true
WarDamageDayPopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","RankUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarDamageDayPopView.studioSpriteFrames > 0 then
    WarDamageDayPopView.spriteFrameNames = WarDamageDayPopView.spriteFrameNames or {}
    table.insertto(WarDamageDayPopView.spriteFrameNames, WarDamageDayPopView.studioSpriteFrames)
end
function WarDamageDayPopView:onInitUI()

    --output list
    self._Panel_player_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Panel_player")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function WarDamageDayPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto button backcall end


--@auto code output func
function WarDamageDayPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
end

function WarDamageDayPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
    --self.type = data.type
    self:showList()
end

function WarDamageDayPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarDamageDayPopView:showList()
    Functions.printInfo(self.debug,"showList")

    local listHandler = function(index, widget, model, data)
        Functions.initTextColor(model:getChildByName("Text_offer"),widget:getChildByName("Text_offer"))
        Functions.initTextColor(model:getChildByName("Text_num"),widget:getChildByName("Text_num"))
        Functions.initTextColor(model:getChildByName("Text_player"),widget:getChildByName("Text_player"))
        widget:setTouchEnabled(false)
        local str = tostring(index)
        widget:getChildByName("BitmapFontLabel_rank"):setText(str)

        widget:getChildByName("Text_offer"):setString(data.offer)
        local strHurt = string.format(LanguageConfig.language_war_8,data.hurt)
        widget:getChildByName("Text_num"):setString(strHurt)
        widget:getChildByName("Text_player"):setString(data.name)
    end

    local HurtData = WarData:getWarHurtDay()

    Functions.bindTableViewWithData(self._Panel_player_t,{ firstData = HurtData },{handler = listHandler},{direction = false, col = 1, firstSegment = 0, segment = 2 }) 
end
return WarDamageDayPopView