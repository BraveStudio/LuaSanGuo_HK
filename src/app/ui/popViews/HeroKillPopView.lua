--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HeroKillPopView = class("HeroKillPopView", BasePopView)

local Functions = require("app.common.Functions")

HeroKillPopView.csbResPath = "lk/csb"
HeroKillPopView.debug = true
HeroKillPopView.studioSpriteFrames = {"HeroKillUI_Text","HeroKillGuanKaUI","CBO_infor" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #HeroKillPopView.studioSpriteFrames > 0 then
    HeroKillPopView.spriteFrameNames = HeroKillPopView.spriteFrameNames or {}
    table.insertto(HeroKillPopView.spriteFrameNames, HeroKillPopView.studioSpriteFrames)
end
function HeroKillPopView:onInitUI()

    --output list
    self._Text_count_1_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_1"):getChildByName("Image_count_1"):getChildByName("Text_count_1")
	self._Panel_star_1_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_1"):getChildByName("Panel_star_1")
	self._Sprite_star_1_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_1"):getChildByName("Panel_star_1"):getChildByName("Sprite_star_1")
	self._Text_count_2_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_2"):getChildByName("Image_count_2"):getChildByName("Text_count_2")
	self._Panel_star_2_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_2"):getChildByName("Panel_star_2")
	self._Sprite_star_2_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_2"):getChildByName("Panel_star_2"):getChildByName("Sprite_star_2")
	self._Text_count_3_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_3"):getChildByName("Image_count_3"):getChildByName("Text_count_3")
	self._Panel_star_3_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_3"):getChildByName("Panel_star_3")
	self._Sprite_star_3_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_3"):getChildByName("Panel_star_3"):getChildByName("Sprite_star_3")
	self._Text_count_4_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_4"):getChildByName("Image_count_4"):getChildByName("Text_count_4")
	self._Panel_star_4_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_4"):getChildByName("Panel_star_4")
	self._Sprite_star_4_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_difficulty_4"):getChildByName("Panel_star_4"):getChildByName("Sprite_star_4")
	self._Panel_guanqia_1_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_1")
	self._Panel_guanqia_2_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_2")
	self._Panel_guanqia_3_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_3")
	self._Panel_guanqia_4_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_bg"):getChildByName("Panel_icon"):getChildByName("Panel_guanqia_4")
	self._Text_get_num_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Text_get_num")
	
    --label list
    
    --button list
    self._Button_saodang_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Button_saodang")
	self._Button_saodang_t:onTouch(Functions.createClickListener(handler(self, self.onButton_saodangClick), "zoom"))

	self._Button_zhandou_t = self.csbNode:getChildByName("Panel_dikuang"):getChildByName("Panel_ban"):getChildByName("Panel_item"):getChildByName("Button_zhandou")
	self._Button_zhandou_t:onTouch(Functions.createClickListener(handler(self, self.onButton_zhandouClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_saodang btFunc
function HeroKillPopView:onButton_saodangClick()
    Functions.printInfo(self.debug,"Button_saodang button is click!")
end
--@auto code Button_saodang btFunc end

--@auto code Button_zhandou btFunc
function HeroKillPopView:onButton_zhandouClick()
    Functions.printInfo(self.debug,"Button_zhandou button is click!")
end
--@auto code Button_zhandou btFunc end

--@auto button backcall end


--@auto code output func
function HeroKillPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
	Functions.playScaleOpenChildViewAction(self)
end

function HeroKillPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
end

function HeroKillPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

return HeroKillPopView