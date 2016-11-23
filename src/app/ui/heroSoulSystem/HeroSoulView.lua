--@auto code head
local BaseView = require("app.baseMVC.BaseView")
local HeroSoulView = class("HeroSoulView", BaseView)

local Functions = require("app.common.Functions")

HeroSoulView.csbResPath = "tyj/csb"
HeroSoulView.debug = true
--@auto code head end


--@auto code uiInit
function HeroSoulView:onInitUI()

    --output list
    
    --label list
    self._title1_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("title1")
	self._title1_t:setString(LanguageConfig.ui_equip_12)

	self._title2_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("title2")
	self._title2_t:setString(LanguageConfig.ui_equip_11)

	self._hp_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("hp_t")
	self._hp_t_t:setString(LanguageConfig.language_9_46)

	self._at_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("at_t")
	self._at_t_t:setString(LanguageConfig.ui_equip_2)

	self._fs_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("fs_t")
	self._fs_t_t:setString(LanguageConfig.ui_equip_7)

	self._ff_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("ff_t")
	self._ff_t_t:setString(LanguageConfig.ui_equip_8)

	self._jm_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("jm_t")
	self._jm_t_t:setString(LanguageConfig.ui_equip_9)

	self._dk_t_t = self.csbNode:getChildByName("main"):getChildByName("heroSoulPanel"):getChildByName("propertyPanel"):getChildByName("dk_t")
	self._dk_t_t:setString(LanguageConfig.ui_equip_10)

	self._huisouLabel_t = self.csbNode:getChildByName("main"):getChildByName("topBarPanel"):getChildByName("topbarBg"):getChildByName("Panel_3"):getChildByName("huisouLabel")
	self._huisouLabel_t:setString(LanguageConfig.language_Teach36)
    --button list
    
end
--@auto code uiInit end


return HeroSoulView