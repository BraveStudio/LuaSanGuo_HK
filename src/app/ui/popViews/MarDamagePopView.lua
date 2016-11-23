--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local MarDamagePopView = class("MarDamagePopView", BasePopView)

local Functions = require("app.common.Functions")

MarDamagePopView.csbResPath = "lk/csb"
MarDamagePopView.debug = true
MarDamagePopView.studioSpriteFrames = {"WarUI_Text","RankUI","CB_unionTankuang","WarUI","UnionUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #MarDamagePopView.studioSpriteFrames > 0 then
    MarDamagePopView.spriteFrameNames = MarDamagePopView.spriteFrameNames or {}
    table.insertto(MarDamagePopView.spriteFrameNames, MarDamagePopView.studioSpriteFrames)
end
function MarDamagePopView:onInitUI()

    --output list
    self._Panel_player_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Panel_player")
	
    --label list
    
    --button list
    
end
--@auto code uiInit end


--@auto code output func
function MarDamagePopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function MarDamagePopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
end

function MarDamagePopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

return MarDamagePopView