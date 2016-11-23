--@auto code head
local BaseView = require("app.baseMVC.BaseView")
local HeroShiLianView = class("HeroShiLianView", BaseView)

local Functions = require("app.common.Functions")

HeroShiLianView.csbResPath = "tyj/csb"
HeroShiLianView.debug = true
--@auto code head end


--@auto code uiInit
function HeroShiLianView:onInitUI()

    --output list
    self._heroHead_t = self.csbNode:getChildByName("main"):getChildByName("board_3"):getChildByName("smCardBt"):getChildByName("heroHead")
	self._piece_t = self.csbNode:getChildByName("main"):getChildByName("board_3"):getChildByName("smCardBt"):getChildByName("piece")
	
    --label list
    
    --button list
    
end
--@auto code uiInit end


return HeroShiLianView