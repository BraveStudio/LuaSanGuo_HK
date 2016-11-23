--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local HeroKillViewController = class("HeroKillViewController", BaseViewController)

local Functions = require("app.common.Functions")

HeroKillViewController.debug = true
HeroKillViewController.modulePath = ...
HeroKillViewController.studioSpriteFrames = {"HeroKillUI_Text","GuildBattleUI" }
--@auto code head end

--@Pre loading
HeroKillViewController.spriteFrameNames = 
    {
    }

HeroKillViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #HeroKillViewController.studioSpriteFrames > 0 then
    HeroKillViewController.spriteFrameNames = HeroKillViewController.spriteFrameNames or {}
    table.insertto(HeroKillViewController.spriteFrameNames, HeroKillViewController.studioSpriteFrames)
end
function HeroKillViewController:onDidLoadView()

    --output list
    self._Image_guild_map_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map")
	self._Sprite_kuang_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_tianshui"):getChildByName("Sprite_kuang_1")
	self._Text_name_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_tianshui"):getChildByName("Sprite_kuang_1"):getChildByName("Text_name_1")
	self._Sprite_prize_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_tianshui"):getChildByName("Panel_prize_1"):getChildByName("Sprite_prize_1")
	self._Sprite_kuang_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_chendu"):getChildByName("Sprite_kuang_2")
	self._Text_name_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_chendu"):getChildByName("Sprite_kuang_2"):getChildByName("Text_name_2")
	self._Sprite_prize_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_chendu"):getChildByName("Panel_prize_2"):getChildByName("Sprite_prize_2")
	self._Sprite_kuang_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_hanzhong"):getChildByName("Sprite_kuang_3")
	self._Text_name_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_hanzhong"):getChildByName("Sprite_kuang_3"):getChildByName("Text_name_3")
	self._Sprite_prize_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_hanzhong"):getChildByName("Panel_prize_3"):getChildByName("Sprite_prize_3")
	self._Sprite_kuang_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianning"):getChildByName("Sprite_kuang_4")
	self._Text_name_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianning"):getChildByName("Sprite_kuang_4"):getChildByName("Text_name_4")
	self._Sprite_prize_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianning"):getChildByName("Panel_prize_4"):getChildByName("Sprite_prize_4")
	self._Sprite_kuang_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_yongan"):getChildByName("Sprite_kuang_5")
	self._Text_name_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_yongan"):getChildByName("Sprite_kuang_5"):getChildByName("Text_name_5")
	self._Sprite_prize_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_yongan"):getChildByName("Panel_prize_5"):getChildByName("Sprite_prize_5")
	self._Sprite_kuang_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_changan"):getChildByName("Sprite_kuang_6")
	self._Text_name_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_changan"):getChildByName("Sprite_kuang_6"):getChildByName("Text_name_6")
	self._Sprite_prize_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_changan"):getChildByName("Panel_prize_6"):getChildByName("Sprite_prize_6")
	self._Sprite_kuang_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_nanpi"):getChildByName("Sprite_kuang_7")
	self._Text_name_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_nanpi"):getChildByName("Sprite_kuang_7"):getChildByName("Text_name_7")
	self._Sprite_prize_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_nanpi"):getChildByName("Panel_prize_7"):getChildByName("Sprite_prize_7")
	self._Sprite_kuang_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jiangxia"):getChildByName("Sprite_kuang_8")
	self._Text_name_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jiangxia"):getChildByName("Sprite_kuang_8"):getChildByName("Text_name_8")
	self._Sprite_prize_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jiangxia"):getChildByName("Panel_prize_8"):getChildByName("Sprite_prize_8")
	self._Sprite_kuang_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xuchang"):getChildByName("Sprite_kuang_9")
	self._Text_name_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xuchang"):getChildByName("Sprite_kuang_9"):getChildByName("Text_name_9")
	self._Sprite_prize_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xuchang"):getChildByName("Panel_prize_9"):getChildByName("Sprite_prize_9")
	self._Sprite_kuang_10_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianan"):getChildByName("Sprite_kuang_10")
	self._Text_name_10_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianan"):getChildByName("Sprite_kuang_10"):getChildByName("Text_name_10")
	self._Sprite_prize_10_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianan"):getChildByName("Panel_prize_10"):getChildByName("Sprite_prize_10")
	self._Sprite_kuang_11_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianye"):getChildByName("Sprite_kuang_11")
	self._Text_name_11_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianye"):getChildByName("Sprite_kuang_11"):getChildByName("Text_name_11")
	self._Sprite_prize_11_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianye"):getChildByName("Panel_prize_11"):getChildByName("Sprite_prize_11")
	self._Sprite_kuang_12_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xiapi"):getChildByName("Sprite_kuang_12")
	self._Text_name_12_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xiapi"):getChildByName("Sprite_kuang_12"):getChildByName("Text_name_12")
	self._Sprite_prize_12_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xiapi"):getChildByName("Panel_prize_12"):getChildByName("Sprite_prize_12")
	self._ProjectNode_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("ProjectNode_1")
	
    --label list
    
    --button list
    self._Button_city_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_tianshui"):getChildByName("Button_city_1")
	self._Button_city_1_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_1Click), "zoom"))

	self._Panel_prize_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_tianshui"):getChildByName("Panel_prize_1")
	self._Panel_prize_1_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_1Click), "zoom"))

	self._Button_city_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_chendu"):getChildByName("Button_city_2")
	self._Button_city_2_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_2Click), "zoom"))

	self._Panel_prize_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_chendu"):getChildByName("Panel_prize_2")
	self._Panel_prize_2_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_2Click), "zoom"))

	self._Button_city_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_hanzhong"):getChildByName("Button_city_3")
	self._Button_city_3_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_3Click), "zoom"))

	self._Panel_prize_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_hanzhong"):getChildByName("Panel_prize_3")
	self._Panel_prize_3_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_3Click), "zoom"))

	self._Button_city_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianning"):getChildByName("Button_city_4")
	self._Button_city_4_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_4Click), "zoom"))

	self._Panel_prize_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianning"):getChildByName("Panel_prize_4")
	self._Panel_prize_4_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_4Click), "zoom"))

	self._Button_city_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_yongan"):getChildByName("Button_city_5")
	self._Button_city_5_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_5Click), "zoom"))

	self._Panel_prize_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_yongan"):getChildByName("Panel_prize_5")
	self._Panel_prize_5_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_5Click), "zoom"))

	self._Button_city_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_changan"):getChildByName("Button_city_6")
	self._Button_city_6_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_6Click), "zoom"))

	self._Panel_prize_6_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_changan"):getChildByName("Panel_prize_6")
	self._Panel_prize_6_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_6Click), "zoom"))

	self._Button_city_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_nanpi"):getChildByName("Button_city_7")
	self._Button_city_7_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_7Click), "zoom"))

	self._Panel_prize_7_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_nanpi"):getChildByName("Panel_prize_7")
	self._Panel_prize_7_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_7Click), "zoom"))

	self._Button_city_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jiangxia"):getChildByName("Button_city_8")
	self._Button_city_8_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_8Click), "zoom"))

	self._Panel_prize_8_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jiangxia"):getChildByName("Panel_prize_8")
	self._Panel_prize_8_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_8Click), "zoom"))

	self._Button_city_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xuchang"):getChildByName("Button_city_9")
	self._Button_city_9_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_9Click), "zoom"))

	self._Panel_prize_9_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xuchang"):getChildByName("Panel_prize_9")
	self._Panel_prize_9_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_9Click), "zoom"))

	self._Button_city_10_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianan"):getChildByName("Button_city_10")
	self._Button_city_10_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_10Click), "zoom"))

	self._Panel_prize_10_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianan"):getChildByName("Panel_prize_10")
	self._Panel_prize_10_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_10Click), "zoom"))

	self._Button_city_11_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianye"):getChildByName("Button_city_11")
	self._Button_city_11_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_11Click), "zoom"))

	self._Panel_prize_11_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_jianye"):getChildByName("Panel_prize_11")
	self._Panel_prize_11_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_11Click), "zoom"))

	self._Button_city_12_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xiapi"):getChildByName("Button_city_12")
	self._Button_city_12_t:onTouch(Functions.createClickListener(handler(self, self.onButton_city_12Click), "zoom"))

	self._Panel_prize_12_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView_guild"):getChildByName("Image_guild_map"):getChildByName("Panel_xiapi"):getChildByName("Panel_prize_12")
	self._Panel_prize_12_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_prize_12Click), "zoom"))

	self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_help_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_1"):getChildByName("Panel_left"):getChildByName("Button_help")
	self._Button_help_t:onTouch(Functions.createClickListener(handler(self, self.onButton_helpClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_city_1 btFunc
function HeroKillViewController:onButton_city_1Click()
    Functions.printInfo(self.debug,"Button_city_1 button is click!")
    self.id = 1
    self:send()
end
--@auto code Button_city_1 btFunc end

--@auto code Panel_prize_1 btFunc
function HeroKillViewController:onPanel_prize_1Click()
    Functions.printInfo(self.debug,"Panel_prize_1 button is click!")
    self.id = 1
    self:getPrize()
end
--@auto code Panel_prize_1 btFunc end

--@auto code Button_city_2 btFunc
function HeroKillViewController:onButton_city_2Click()
    Functions.printInfo(self.debug,"Button_city_2 button is click!")
    self.id = 2
    self:send()
end
--@auto code Button_city_2 btFunc end

--@auto code Panel_prize_2 btFunc
function HeroKillViewController:onPanel_prize_2Click()
    Functions.printInfo(self.debug,"Panel_prize_2 button is click!")
    self.id = 2
    self:getPrize()
end
--@auto code Panel_prize_2 btFunc end

--@auto code Button_city_3 btFunc
function HeroKillViewController:onButton_city_3Click()
    Functions.printInfo(self.debug,"Button_city_3 button is click!")
    self.id = 3
    self:send()
end
--@auto code Button_city_3 btFunc end

--@auto code Panel_prize_3 btFunc
function HeroKillViewController:onPanel_prize_3Click()
    Functions.printInfo(self.debug,"Panel_prize_3 button is click!")
    self.id = 3
    self:getPrize()
end
--@auto code Panel_prize_3 btFunc end

--@auto code Button_city_4 btFunc
function HeroKillViewController:onButton_city_4Click()
    Functions.printInfo(self.debug,"Button_city_4 button is click!")
    self.id = 4
    self:send()
end
--@auto code Button_city_4 btFunc end

--@auto code Panel_prize_4 btFunc
function HeroKillViewController:onPanel_prize_4Click()
    Functions.printInfo(self.debug,"Panel_prize_4 button is click!")
    self.id = 4
    self:getPrize()
end
--@auto code Panel_prize_4 btFunc end

--@auto code Button_city_5 btFunc
function HeroKillViewController:onButton_city_5Click()
    Functions.printInfo(self.debug,"Button_city_5 button is click!")
    self.id = 5
    self:send()
end
--@auto code Button_city_5 btFunc end

--@auto code Panel_prize_5 btFunc
function HeroKillViewController:onPanel_prize_5Click()
    Functions.printInfo(self.debug,"Panel_prize_5 button is click!")
    self.id = 5
    self:getPrize()
end
--@auto code Panel_prize_5 btFunc end

--@auto code Button_city_6 btFunc
function HeroKillViewController:onButton_city_6Click()
    Functions.printInfo(self.debug,"Button_city_6 button is click!")
    self.id = 6
    self:send()
end
--@auto code Button_city_6 btFunc end

--@auto code Panel_prize_6 btFunc
function HeroKillViewController:onPanel_prize_6Click()
    Functions.printInfo(self.debug,"Panel_prize_6 button is click!")
    self.id = 6
    self:getPrize()
end
--@auto code Panel_prize_6 btFunc end

--@auto code Button_city_7 btFunc
function HeroKillViewController:onButton_city_7Click()
    Functions.printInfo(self.debug,"Button_city_7 button is click!")
    self.id = 7
    self:send()
end
--@auto code Button_city_7 btFunc end

--@auto code Panel_prize_7 btFunc
function HeroKillViewController:onPanel_prize_7Click()
    Functions.printInfo(self.debug,"Panel_prize_7 button is click!")
    self.id = 7
    self:getPrize()
end
--@auto code Panel_prize_7 btFunc end

--@auto code Button_city_8 btFunc
function HeroKillViewController:onButton_city_8Click()
    Functions.printInfo(self.debug,"Button_city_8 button is click!")
    self.id = 8
    self:send()
end
--@auto code Button_city_8 btFunc end


--@auto code Panel_prize_8 btFunc
function HeroKillViewController:onPanel_prize_8Click()
    Functions.printInfo(self.debug,"Panel_prize_8 button is click!")
    self.id = 8
    self:getPrize()
end
--@auto code Panel_prize_8 btFunc end

--@auto code Button_city_9 btFunc
function HeroKillViewController:onButton_city_9Click()
    Functions.printInfo(self.debug,"Button_city_9 button is click!")
    self.id = 9
    self:send()

end
--@auto code Button_city_9 btFunc end

--@auto code Panel_prize_9 btFunc
function HeroKillViewController:onPanel_prize_9Click()
    Functions.printInfo(self.debug,"Panel_prize_9 button is click!")
    self.id = 9
    self:getPrize()
end
--@auto code Panel_prize_9 btFunc end

--@auto code Button_city_10 btFunc
function HeroKillViewController:onButton_city_10Click()
    Functions.printInfo(self.debug,"Button_city_10 button is click!")
    self.id = 10
    self:send()
end
--@auto code Button_city_10 btFunc end

--@auto code Panel_prize_10 btFunc
function HeroKillViewController:onPanel_prize_10Click()
    Functions.printInfo(self.debug,"Panel_prize_10 button is click!")
    self.id = 10
    self:getPrize()
end
--@auto code Panel_prize_10 btFunc end

--@auto code Button_city_11 btFunc
function HeroKillViewController:onButton_city_11Click()
    Functions.printInfo(self.debug,"Button_city_11 button is click!")
    self.id = 11
    self:send()
end
--@auto code Button_city_11 btFunc end

--@auto code Panel_prize_11 btFunc
function HeroKillViewController:onPanel_prize_11Click()
    Functions.printInfo(self.debug,"Panel_prize_11 button is click!")
    self.id = 11
    self:getPrize()
end
--@auto code Panel_prize_11 btFunc end

--@auto code Button_city_12 btFunc
function HeroKillViewController:onButton_city_12Click()
    Functions.printInfo(self.debug,"Button_city_12 button is click!")
    self.id = 12
    self:send()
end
--@auto code Button_city_12 btFunc end

--@auto code Panel_prize_12 btFunc
function HeroKillViewController:onPanel_prize_12Click()
    Functions.printInfo(self.debug,"Panel_prize_12 button is click!")
    self.id = 12
    self:getPrize()
end
--@auto code Panel_prize_12 btFunc end

--@auto code Button_back btFunc
function HeroKillViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_help btFunc
function HeroKillViewController:onButton_helpClick()
    Functions.printInfo(self.debug,"Button_help button is click!")
    NoticeManager:openNotice(self, {type = NoticeManager.HERO_KILL})
end
--@auto code Button_help btFunc end

--@auto button backcall end


--@auto code view display func
function HeroKillViewController:onCreate()
    Functions.printInfo(self.debug_b," HeroKillViewController controller create!")
end

function HeroKillViewController:onDisplayView()
	Functions.printInfo(self.debug_b," HeroKillViewController view enter display!")
    Functions.initResNodeUI(self._ProjectNode_1_t,{ "nengliang"})
    Functions.loadImageWithWidget(self._Image_guild_map_t,"map/guildCity.png")
    --城池id
    self.id = 0

    --初使化城池
    self:updatePrize()

    --监听函数
    local onUpdate = function(event)
        self:updatePrize()
    end

    Functions.bindEventListener(self.view_t, GameEventCenter, HeroKillData.UPDATE_PRIZE, onUpdate)
    
end
--@auto code view display func end

function HeroKillViewController:send()
    --self:openChildView("src/app/ui/heroKillGuanKaSystem/HeroKillGuanKaViewController", { data = {id = id}, isRemove = true})
    GameCtlManager:push("app.ui.heroKillGuanKaSystem.HeroKillGuanKaViewController", { data = {id = self.id}})
end

function HeroKillViewController:getPrize()

    HeroKillData:sendPrize(self.id, handler(self, self.update))
    
end

function HeroKillViewController:update()
    local levelDatas = HeroKillData:getHeroKillData()
    local srtPrize = string.format("_Panel_prize_%d_t", self.id)
    if levelDatas[self.id].everyFlag ~= 1 then
        self[srtPrize]:setVisible(false)
    end
end

function HeroKillViewController:updatePrize()

    --初使化城池名
    local levelDatas = HeroKillData:getHeroKillData()

    for k, v in pairs(levelDatas) do
        local str = string.format("_Text_name_%d_t", k)
        local srtPrize = string.format("_Panel_prize_%d_t", k)
        self[str]:setText(v.name)
        if v.everyFlag == 1 then
            self[srtPrize]:setVisible(true)
            local Sprite_prize = string.format("_Sprite_prize_%d_t", k)

            local jumpby = cc.JumpBy:create(1, cc.p(0, 0), 4, 20)
            local easeSineIn = cc.EaseSineIn:create(jumpby)
            local seq = cc.Sequence:create(easeSineIn, cc.DelayTime:create(2))

            local repeatForever = cc.RepeatForever:create(seq)
            self[Sprite_prize]:runAction(repeatForever)
        end
    end
end

return HeroKillViewController