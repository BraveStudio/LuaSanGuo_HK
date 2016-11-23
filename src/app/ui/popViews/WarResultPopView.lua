--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarResultPopView = class("WarResultPopView", BasePopView)

local Functions = require("app.common.Functions")

WarResultPopView.csbResPath = "lk/csb"
WarResultPopView.debug = true
WarResultPopView.studioSpriteFrames = {"GvgUI_Text" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarResultPopView.studioSpriteFrames > 0 then
    WarResultPopView.spriteFrameNames = WarResultPopView.spriteFrameNames or {}
    table.insertto(WarResultPopView.spriteFrameNames, WarResultPopView.studioSpriteFrames)
end
function WarResultPopView:onInitUI()

    --output list
    self._Sprite_text_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_text")
	self._Sprite_meizi_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Sprite_meizi")
	
    --label list
    
    --button list
    self._Button_OK_t = self.csbNode:getChildByName("Panel_1"):getChildByName("Button_OK")
	self._Button_OK_t:onTouch(Functions.createClickListener(handler(self, self.onButton_okClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_ok btFunc
function WarResultPopView:onButton_okClick()
    Functions.printInfo(self.debug,"Button_ok button is click!")
    WarData:sendStrongholdLeave(self.idx)
    self.close(self)
    GameCtlManager:pop(GameCtlManager:getCurrentController())
end
--@auto code Button_ok btFunc end

--@auto button backcall end


--@auto code output func
function WarResultPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarResultPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
	
    self.idx = data.bigID 
    local info = WarData:getMapInfo()
    if info[self.idx].camp == PlayerData.eventAttr.m_camp then
        Functions.loadImageWithSprite(self._Sprite_text_t, "commonUI/res/lk/WarUI/warshengli.png")
        Functions.loadImageWithSprite(self._Sprite_meizi_t, "npc/gvg_suc.png")
    else
        Functions.loadImageWithSprite(self._Sprite_text_t, "commonUI/res/lk/WarUI/warshibai.png")
        Functions.loadImageWithSprite(self._Sprite_meizi_t, "npc/gvg_suc.png")
    end
end

function WarResultPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

return WarResultPopView