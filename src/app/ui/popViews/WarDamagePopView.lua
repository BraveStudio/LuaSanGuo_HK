--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarDamagePopView = class("WarDamagePopView", BasePopView)

local Functions = require("app.common.Functions")

WarDamagePopView.csbResPath = "lk/csb"
WarDamagePopView.debug = true
WarDamagePopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","RankUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarDamagePopView.studioSpriteFrames > 0 then
    WarDamagePopView.spriteFrameNames = WarDamagePopView.spriteFrameNames or {}
    table.insertto(WarDamagePopView.spriteFrameNames, WarDamagePopView.studioSpriteFrames)
end
function WarDamagePopView:onInitUI()

    --output list
    self._Image_title_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Image_title")
	self._Panel_player_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Panel_player")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function WarDamagePopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto button backcall end


--@auto code output func
function WarDamagePopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarDamagePopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	self.type = data.type
	self:showList()
end

function WarDamagePopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarDamagePopView:showList()
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

    local HurtData = {}
    if self.type == 2 then
        HurtData = WarData:getWarHurt()
    elseif self.type == 1 then
        HurtData = WarData:getCityHurt()
        self._Image_title_t:ignoreContentAdaptWithSize(true)
        Functions.loadImageWithWidget(self._Image_title_t, "commonUI/res/lk/WarUI/shanghaipaihangbang.png")
        
    end
    Functions.bindTableViewWithData(self._Panel_player_t,{ firstData = HurtData },{handler = listHandler},{direction = false, col = 1, firstSegment = 0, segment = 2 }) 
end

return WarDamagePopView