--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local MainViewController = class("MainViewController", BaseViewController)

local Functions = require("app.common.Functions")

MainViewController.debug = true
MainViewController.modulePath = ...
MainViewController.studioSpriteFrames = {"MainUI_icon1","MainUI","MainUI_BG","Main_icon2","MainUI_Text" }
--@auto code head end

local scheduler = require("app.common.scheduler")
local config = require("app.configs.ResConfig_cs")

MainViewController.ENTER_MAINVIEW_EVENT_NAME = "ENTER_MAINVIEW_EVENT_NAME"

--@Pre loading
MainViewController.spriteFrameNames = 
    {
        "playerHeadRes", "gameSet","payRes","ChatUI", "ChatBgUI","ChatPopUI_Text","EquipmentUI"
    }

MainViewController.animaNames = 
    {
        "drumWave_plist", "sevenStar_plist", "stars_plist", "lantern_plist", "mainUIFire_plist", "czbx_plist"
    }

--@auto code uiInit
--add spriteFrames
if #MainViewController.studioSpriteFrames > 0 then
    MainViewController.spriteFrameNames = MainViewController.spriteFrameNames or {}
    table.insertto(MainViewController.spriteFrameNames, MainViewController.studioSpriteFrames)
end
function MainViewController:onDidLoadView()

    --output list
    self._ScrollView_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView")
	self._MainBackPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainBackPanel")
	self._MainMid1Panel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel")
	self._rankTile_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("rankTile")
	self._tiantTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("tiantTitle")
	self._heroShilianTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("heroShilianTitle")
	self._mainGate_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("mainGate_anima")
	self._chuzText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("chuzText")
	self._drumWave_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("drumWave_anima")
	self._sevenStar_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("sevenStar_anima")
	self._sevenStarTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("sevenStarTitle")
	self._fire_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("fire_anima")
	self._gvgTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("gvgTitle")
	self._guoZhanTitile_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("guoZhanTitile")
	self._MainFrontPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel")
	self._tinkerText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("tinkerText")
	self._mailTitil_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("mailTitil")
	self._mainCityTitil_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("mainCityTitil")
	self._zhaomText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("zhaomText")
	self._xuezTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("xuezTitle")
	self._stars_anima_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("stars_anima_1")
	self._stars_anima_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("stars_anima_2")
	self._lantern_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("lantern_anima")
	self._heroKillTitile_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("heroKillTitile")
	self._huoDongText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("huoDongText")
	self._czbx_anima_t = self.view_t.csbNode:getChildByName("main"):getChildByName("czbxBt"):getChildByName("czbx_anima")
	self._czbx_time_t = self.view_t.csbNode:getChildByName("main"):getChildByName("czbxBt"):getChildByName("czbx_time")
	self._topHead_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel"):getChildByName("topHead")
	self._vipLevel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel"):getChildByName("vipLevel")
	self._fightPower_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel"):getChildByName("fightPower")
	self._levelText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel"):getChildByName("level_28"):getChildByName("levelText")
	self._heroNameText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel"):getChildByName("namebg_31"):getChildByName("heroNameText")
	self._coinText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("Resource_12"):getChildByName("coinText")
	self._moneyText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("Resource_12_0"):getChildByName("moneyText")
	self._powerText_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("Resource_12_0_0"):getChildByName("powerText")
	self._power_bt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("power_bt")
	self._downBtPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel")
	self._taskBg_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame7"):getChildByName("taskBg")
	self._power_panel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel")
	self._nextPowerTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("nextPowerTitle")
	self._recAllPowerTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("recAllPowerTitle")
	self._recTimeTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("recTimeTitle")
	self._buyPowerTitle_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("buyPowerTitle")
	self._freePowerTime_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("freePowerTime")
	self._allFreePowerTime_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("allFreePowerTime")
	self._powerRecoverTime_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("powerRecoverTime")
	self._buyPowerCount_t = self.view_t.csbNode:getChildByName("main"):getChildByName("power_panel"):getChildByName("buyPowerCount")
	self._vipPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("vipPanel")
	
    --label list
    
    --button list
    self._tiantiBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("tiantiBt")
	self._tiantiBt_t:onTouch(Functions.createClickListener(handler(self, self.onTiantibtClick), "movedis"))

	self._rankBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("rankBt")
	self._rankBt_t:onTouch(Functions.createClickListener(handler(self, self.onRankbtClick), "movedis"))

	self._sevenStarBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("sevenStarBt")
	self._sevenStarBt_t:onTouch(Functions.createClickListener(handler(self, self.onSevenstarbtClick), "movedis"))

	self._heroTrialsBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("heroTrialsBt")
	self._heroTrialsBt_t:onTouch(Functions.createClickListener(handler(self, self.onHerotrialsbtClick), "movedis"))

	self._outFightBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("outFightBt")
	self._outFightBt_t:onTouch(Functions.createClickListener(handler(self, self.onOutfightbtClick), "movedis"))

	self._gvgBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("gvgBt")
	self._gvgBt_t:onTouch(Functions.createClickListener(handler(self, self.onGvgbtClick), "movedis"))

	self._guoZhanBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainMid1Panel"):getChildByName("guoZhanBt")
	self._guoZhanBt_t:onTouch(Functions.createClickListener(handler(self, self.onGuozhanbtClick), "movedis"))

	self._tinkerBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("tinkerBt")
	self._tinkerBt_t:onTouch(Functions.createClickListener(handler(self, self.onTinkerbtClick), "movedis"))

	self._mailBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("mailBt")
	self._mailBt_t:onTouch(Functions.createClickListener(handler(self, self.onMailbtClick), "movedis"))

	self._mainCityBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("mainCityBt")
	self._mainCityBt_t:onTouch(Functions.createClickListener(handler(self, self.onMaincitybtClick), "movedis"))

	self._zhaomuBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("zhaomuBt")
	self._zhaomuBt_t:onTouch(Functions.createClickListener(handler(self, self.onZhaomubtClick), "movedis"))

	self._xuezhanBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("xuezhanBt")
	self._xuezhanBt_t:onTouch(Functions.createClickListener(handler(self, self.onXuezhanbtClick), "movedis"))

	self._heroKillBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("heroKillBt")
	self._heroKillBt_t:onTouch(Functions.createClickListener(handler(self, self.onHerokillbtClick), "movedis"))

	self._huoDongBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("ScrollView"):getChildByName("MainFrontPanel"):getChildByName("huoDongBt")
	self._huoDongBt_t:onTouch(Functions.createClickListener(handler(self, self.onHuodongbtClick), "movedis"))

	self._czbxBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("czbxBt")
	self._czbxBt_t:onTouch(Functions.createClickListener(handler(self, self.onCzbxbtClick), "zoom"))

	self._LeftTopPanel_t = self.view_t.csbNode:getChildByName("main"):getChildByName("LeftTopPanel")
	self._LeftTopPanel_t:onTouch(Functions.createClickListener(handler(self, self.onLefttoppanelClick), ""))

	self._addMoneyBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("addMoneyBt")
	self._addMoneyBt_t:onTouch(Functions.createClickListener(handler(self, self.onAddmoneybtClick), "zoom"))

	self._addPowerBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("addPowerBt")
	self._addPowerBt_t:onTouch(Functions.createClickListener(handler(self, self.onAddpowerbtClick), "zoom"))

	self._addCoinBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("tipBtPanel"):getChildByName("addCoinBt")
	self._addCoinBt_t:onTouch(Functions.createClickListener(handler(self, self.onAddcoinbtClick), "zoom"))

	self._heroListBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame1"):getChildByName("heroListBt")
	self._heroListBt_t:onTouch(Functions.createClickListener(handler(self, self.onHerolistbtClick), "zoom"))

	self._upLevelBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame2"):getChildByName("upLevelBt")
	self._upLevelBt_t:onTouch(Functions.createClickListener(handler(self, self.onUplevelbtClick), "zoom"))

	self._buzhenBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame3"):getChildByName("buzhenBt")
	self._buzhenBt_t:onTouch(Functions.createClickListener(handler(self, self.onBuzhenbtClick), "zoom"))

	self._zhuangbeiBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame4"):getChildByName("zhuangbeiBt")
	self._zhuangbeiBt_t:onTouch(Functions.createClickListener(handler(self, self.onZhuangbeibtClick), "zoom"))

	self._PropitemBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame5"):getChildByName("PropitemBt")
	self._PropitemBt_t:onTouch(Functions.createClickListener(handler(self, self.onPropitembtClick), "zoom"))

	self._hechengBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame6"):getChildByName("hechengBt")
	self._hechengBt_t:onTouch(Functions.createClickListener(handler(self, self.onHechengbtClick), "zoom"))

	self._taskBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame7"):getChildByName("taskBt")
	self._taskBt_t:onTouch(Functions.createClickListener(handler(self, self.onTaskbtClick), "zoom"))

	self._shopBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame8"):getChildByName("shopBt")
	self._shopBt_t:onTouch(Functions.createClickListener(handler(self, self.onShopbtClick), "zoom"))

	self._btChongs_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btChongs")
	self._btChongs_t:onTouch(Functions.createClickListener(handler(self, self.onBtchongsClick), "zoom"))

	self._btJiangh_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btJiangh")
	self._btJiangh_t:onTouch(Functions.createClickListener(handler(self, self.onBtjianghClick), "zoom"))

	self._hideBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("downBtPanel"):getChildByName("btFrame9"):getChildByName("hideBt")
	self._hideBt_t:onTouch(Functions.createClickListener(handler(self, self.onHidebtClick), "zoom"))

	self._serviceBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("leftDownPanel"):getChildByName("serviceBt")
	self._serviceBt_t:onTouch(Functions.createClickListener(handler(self, self.onServicebtClick), "zoom"))

	self._cafeBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("leftDownPanel"):getChildByName("cafeBt")
	self._cafeBt_t:onTouch(Functions.createClickListener(handler(self, self.onCafebtClick), "zoom"))

	self._loginRewardBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("loginRewardBt")
	self._loginRewardBt_t:onTouch(Functions.createClickListener(handler(self, self.onLoginrewardbtClick), "zoom"))

	self._chengjiuBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("chengjiuBt")
	self._chengjiuBt_t:onTouch(Functions.createClickListener(handler(self, self.onChengjiubtClick), "zoom"))

	self._SignRewardBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("SignRewardBt")
	self._SignRewardBt_t:onTouch(Functions.createClickListener(handler(self, self.onSignrewardbtClick), "zoom"))

	self._xuanxBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("xuanxBt")
	self._xuanxBt_t:onTouch(Functions.createClickListener(handler(self, self.onXuanxbtClick), "zoom"))

	self._jrkhBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("jrkhBt")
	self._jrkhBt_t:onTouch(Functions.createClickListener(handler(self, self.onJrkhbtClick), "zoom"))

	self._vipBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("vipBt")
	self._vipBt_t:onTouch(Functions.createClickListener(handler(self, self.onVipbtClick), "zoom"))

	self._limitTimeHeroBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("limitTimeHeroBt")
	self._limitTimeHeroBt_t:onTouch(Functions.createClickListener(handler(self, self.onLimittimeherobtClick), "zoom"))

	self._scdlbBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("scdlbBt")
	self._scdlbBt_t:onTouch(Functions.createClickListener(handler(self, self.onScdlbbtClick), "zoom"))

	self._fuliBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("fuliBt")
	self._fuliBt_t:onTouch(Functions.createClickListener(handler(self, self.onFulibtClick), "zoom"))

	self._libaoBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("libaoBt")
	self._libaoBt_t:onTouch(Functions.createClickListener(handler(self, self.onLibaobtClick), "zoom"))

	self._sevenAwardBt_t = self.view_t.csbNode:getChildByName("main"):getChildByName("sevenAwardBt")
	self._sevenAwardBt_t:onTouch(Functions.createClickListener(handler(self, self.onSevenawardbtClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Tiantibt btFunc
function MainViewController:onTiantibtClick()
    Functions.printInfo(self.debug,"Tiantibt button is click!")
    GameCtlManager:push("app.ui.tianTiSystem.TianTiViewController")
end
--@auto code Tiantibt btFunc end

--@auto code Sevenstarbt btFunc
function MainViewController:onSevenstarbtClick()
    Functions.printInfo(self.debug,"Sevenstarbt button is click!")
    GameCtlManager:push("app.ui.sevenStarSystem.SevenStarViewController")
   -- GameCtlManager:push("app.ui.imagePlayerSystem.ImagePlayerViewController",{data = {jumpData = {levelId = 10}}})
end
--@auto code Sevenstarbt btFunc end

--@auto code Herotrialsbt btFunc
function MainViewController:onHerotrialsbtClick()
    Functions.printInfo(self.debug,"Herotrialsbt button is click!")

    GameCtlManager:push("app.ui.shiLianSystem.ShiLianViewController")
end
--@auto code Herotrialsbt btFunc end

--@auto code Outfightbt btFunc
function MainViewController:onOutfightbtClick()
    Functions.printInfo(self.debug,"Outfightbt button is click!")
    
    EmbattleData:getEmbattleInfos(EmbattleData.EmbattleTypeEnum.attack, function(data)
    	if data.MainHero[1].id == 0 then
    	   PromptManager:openTipPrompt(LanguageConfig.ui_FbSelectView_1)
    	else
            -- GameCtlManager:push("app.ui.fbSelectSystem.FbSelectViewController")
            GameCtlManager:goTo("app.ui.fbSelectSystem.FbSelectViewController")
    	end
    end)    
end
--@auto code Outfightbt btFunc end

--@auto code Tinkerbt btFunc
function MainViewController:onTinkerbtClick()
    Functions.printInfo(self.debug,"Tinkerbt button is click!")

    GameCtlManager:push("app.ui.unionSystem.UnionViewController")
end

--@auto code Tinkerbt btFunc end

--@auto code Mailbt btFunc
function MainViewController:onMailbtClick()
    Functions.printInfo(self.debug,"Mailbt button is click!")
    self:openChildView("app.ui.popViews.MailOnePopView")
end
--@auto code Mailbt btFunc end

--@auto code Maincitybt btFunc
function MainViewController:onMaincitybtClick()
    Functions.printInfo(self.debug,"Maincitybt button is click!")
	GameCtlManager:push("app.ui.citySystem.CityViewController")  
end
--@auto code Maincitybt btFunc end

--@auto code Zhaomubt btFunc
function MainViewController:onZhaomubtClick()
    Functions.printInfo(self.debug,"Zhaomubt button is click!")

    GameCtlManager:push("app.ui.enlistSystem.EnlistViewController")
end
--@auto code Zhaomubt btFunc end

--@auto code Xuezhanbt btFunc
function MainViewController:onXuezhanbtClick()
    Functions.printInfo(self.debug,"Xuezhanbt button is click!")
    
    GameCtlManager:push("app.ui.xueZhanSystem.XueZhanViewController")
end
--@auto code Xuezhanbt btFunc end

--@auto code Addmoneybt btFunc
function MainViewController:onAddmoneybtClick()
    Functions.printInfo(self.debug,"Addmoneybt button is click!")
    -- local payView = require("app.ui.popViews.PayPopView"):new()--cs

    -- if G_CurrentLanguage == "ch" then
    -- 	PromptManager:openTipPrompt(LanguageConfig.language_vip_not_pay)
    -- 	return
    -- end

    self:openChildView("app.ui.popViews.PayPopView",{isRemove = false,name = "PayPopView"})
end
--@auto code Addmoneybt btFunc end

--@auto code Addpowerbt btFunc
function MainViewController:onAddpowerbtClick()
    Functions.printInfo(self.debug,"Addpowerbt button is click!")

    Functions.setAdbrixTag("retension","energy_inter")
    Functions.buyPowerHandler(self)
end
--@auto code Addpowerbt btFunc end

--@auto code Herolistbt btFunc
function MainViewController:onHerolistbtClick()
    Functions.printInfo(self.debug,"Herolistbt button is click!")
    GameCtlManager:push("app.ui.heroSystem.HeroViewController")
end
--@auto code Herolistbt btFunc end

--@auto code Uplevelbt btFunc
function MainViewController:onUplevelbtClick()
    Functions.printInfo(self.debug,"Uplevelbt button is click!")

    GameCtlManager:push("app.ui.enhanceSystem.EnhanceViewController")
end
--@auto code Uplevelbt btFunc end

--@auto code Buzhenbt btFunc
function MainViewController:onBuzhenbtClick()
    Functions.printInfo(self.debug,"Buzhenbt button is click!")
    GameCtlManager:push("app.ui.embattleSystem.EmbattleViewController",{data = {jumpType = 5,jumpData = {embattleType = 1}}})
end
--@auto code Buzhenbt btFunc end

--@auto code Propitembt btFunc
function MainViewController:onPropitembtClick()
    Functions.printInfo(self.debug,"Propitembt button is click!")
    GameCtlManager:push("app.ui.propSystem.PropViewController")
end
--@auto code Propitembt btFunc end

--@auto code Hechengbt btFunc
function MainViewController:onHechengbtClick()
    Functions.printInfo(self.debug,"Hechengbt button is click!")
    GameCtlManager:push("app.ui.compoundSystem.CompoundViewController")
end
--@auto code Hechengbt btFunc end

--@auto code Taskbt btFunc
function MainViewController:onTaskbtClick()
    Functions.printInfo(self.debug,"Taskbt button is click!")
    GameCtlManager:push("app.ui.taskSystem.TaskViewController")
    -- Functions.callAnySdkFuc(function( )
    --     NativeUtil:javaCallHanler({command = "onEvent",eventId = "003",data = {["level"] = 20}})
    -- end)
end
--@auto code Taskbt btFunc end

--@auto code Shopbt btFunc
function MainViewController:onShopbtClick()
    Functions.printInfo(self.debug,"Shopbt button is click!")

    GameCtlManager:push("app.ui.shopSystem.ShopViewController")
end
--@auto code Shopbt btFunc end

--@auto code Hidebt btFunc
function MainViewController:onHidebtClick()
    Functions.printInfo(self.debug,"Hidebt button is click!")
    
    if not self._isHidingBt then
        self:hideRightDownBtHandler_(not self._isBtHide)
    end
   
end
--@auto code Hidebt btFunc end

--@auto code Servicebt btFunc
function MainViewController:onServicebtClick()
    Functions.printInfo(self.debug,"Servicebt button is click!")
    -- local helpView = require("app.ui.popViews.HelpPopView"):new()--cs
    self:openChildView("app.ui.popViews.SquadPopView", { isRemove = false })
end
--@auto code Servicebt btFunc end

--@auto code Lefttoppanel btFunc
function MainViewController:onLefttoppanelClick()
    Functions.printInfo(self.debug,"Lefttoppanel button is click!")

    -- local setView = require("app.ui.popViews.GameSetPopView"):new()--cs
    self:openChildView("app.ui.popViews.GameSetPopView")

end
--@auto code Lefttoppanel btFunc end

--@auto code Loginrewardbt btFunc
function MainViewController:onLoginrewardbtClick()
    Functions.printInfo(self.debug,"Loginrewardbt button is click!")
    -- local loginRewardView = require("app.ui.popViews.LoginRewardPopView"):new()--cs
    self:openChildView("app.ui.popViews.LoginRewardPopView")
end
--@auto code Loginrewardbt btFunc end

--@auto code Chengjiubt btFunc
function MainViewController:onChengjiubtClick()
    Functions.printInfo(self.debug,"Chengjiubt button is click!")
    GameCtlManager:push("app.ui.chengJiuSystem.ChengJiuViewController")
--    Functions.printInfo(self.debug,"Chengjiubt button is click!")
--    GameCtlManager:push("app.ui.aniPreviewSystem.AniPreviewViewController")
end
--@auto code Chengjiubt btFunc end

--@auto code Signrewardbt btFunc
function MainViewController:onSignrewardbtClick()
    Functions.printInfo(self.debug,"Signrewardbt button is click!")
    -- local signRewardView = require("app.ui.popViews.SignRewardPopView"):new()--cs
    self:openChildView("app.ui.popViews.SignRewardPopView")
end
--@auto code Signrewardbt btFunc end

--@auto code Addcoinbt btFunc
function MainViewController:onAddcoinbtClick()
    Functions.printInfo(self.debug,"Addcoinbt button is click!")

    Functions.setAdbrixTag("retension","silver_inter")
    Functions.buyMoneyHandler(self)
end
--@auto code Addcoinbt btFunc end

--@auto code Button_1 btFunc
function MainViewController:onButton_1Click()
    Functions.printInfo(self.debug,"Button_1 button is click!")
end
--@auto code Button_1 btFunc end

--@auto code Zhuangbeibt btFunc
function MainViewController:onZhuangbeibtClick()
    Functions.printInfo(self.debug,"Zhuangbeibt button is click!")

    GameCtlManager:push("app.ui.equipmentSystem.EquipmentViewController")
   
end
--@auto code Zhuangbeibt btFunc end

--@auto code Vipbt btFunc
function MainViewController:onVipbtClick()
    Functions.printInfo(self.debug,"Vipbt button is click!")
    -- local vipView = require("app.ui.popViews.VipPopView"):new()--cs
    self:openChildView("app.ui.popViews.VipPopView",{isRemove = false,name = "VipPopView"})
    
end
--@auto code Vipbt btFunc end

--@auto code Limittimeherobt btFunc
function MainViewController:onLimittimeherobtClick()
    Functions.printInfo(self.debug,"Limittimeherobt button is click!")
    -- local activityHeroView = require("app.ui.popViews.ActivityHeroPopView"):new()--cs
    -- self:openChildView("app.ui.popViews.ActivityHeroPopView",{isRemove = false, name = "ActivityHeroPopView"})
    self:openChildView("app.ui.popViews.SelectActivityHeroPopView",{isRemove = false, name = "SelectActivityHeroPopView"})
end
--@auto code Limittimeherobt btFunc end

--@auto code Fulibt btFunc
function MainViewController:onFulibtClick()
    Functions.printInfo(self.debug,"Fulibt button is click!")
    self:openChildView("app.ui.popViews.HuoDongPopView")
    
end
--@auto code Fulibt btFunc end

--@auto code Libaobt btFunc
function MainViewController:onLibaobtClick()
    Functions.printInfo(self.debug,"Libaobt button is click!")
    -- local onlineRewardView = require("app.ui.popViews.OnlineRewardPopView"):new()--cs
    self:openChildView("app.ui.popViews.OnlineRewardPopView",{isRemove = false})
end
--@auto code Libaobt btFunc end

--@auto code Scdlbbt btFunc
function MainViewController:onScdlbbtClick()
    Functions.printInfo(self.debug,"Scdlbbt button is click!")

    -- local firstPayRewardView = require("app.ui.popViews.FirstPayRewardPopView"):new()--cs
    self:openChildView("app.ui.popViews.FirstPayRewardPopView",{isRemove = false})
end
--@auto code Scdlbbt btFunc end

--@auto code Czbxbt btFunc
function MainViewController:onCzbxbtClick()
    Functions.printInfo(self.debug,"Czbxbt button is click!")

    self:openChildView("app.ui.popViews.DiscountPopView")
end
--@auto code Czbxbt btFunc end

--@auto code Rankbt btFunc
function MainViewController:onRankbtClick()
    Functions.printInfo(self.debug,"Rankbt button is click!")
    RankData:sendPlayerDatas()
    
end
--@auto code Rankbt btFunc end

--@auto code Cafebt btFunc
function MainViewController:onCafebtClick()
    Functions.printInfo(self.debug,"Cafebt button is click!")
    Functions.callJavaFuc(function ( )
        NativeUtil:javaCallHanler({command = "openCafeHome"})
    end)
end
--@auto code Cafebt btFunc end

--@auto code Gvgbt btFunc
function MainViewController:onGvgbtClick()
    Functions.printInfo(self.debug,"Gvgbt button is click!")
    GameCtlManager:push("app.ui.guildBattleSystem.GuildBattleViewController")
    -- PromptManager:openTipPrompt(LanguageConfig.language_Union_41)
    
end
--@auto code Gvgbt btFunc end

--@auto code Btchongs btFunc
function MainViewController:onBtchongsClick()
    Functions.printInfo(self.debug,"Btchongs button is click!")
    GameCtlManager:push("app/ui/expTransferSystem/ExpTransferViewController")
end
--@auto code Btchongs btFunc end

--@auto code Guozhanbt btFunc
function MainViewController:onGuozhanbtClick()
    Functions.printInfo(self.debug,"Guozhanbt button is click!")
    GameCtlManager:push("app.ui.warSystem.WarViewController")
    -- PromptManager:openTipPrompt("功能正在研发中，敬请期待!")
end
--@auto code Guozhanbt btFunc end

--@auto code Herokillbt btFunc
function MainViewController:onHerokillbtClick()
    Functions.printInfo(self.debug,"Herokillbt button is click!")

    GameCtlManager:push("app.ui.heroKillSystem.HeroKillViewController")
end
--@auto code Herokillbt btFunc end

--@auto code Btjiangh btFunc
function MainViewController:onBtjianghClick()
    Functions.printInfo(self.debug,"Btjiangh button is click!")
    GameCtlManager:push("app.ui.heroSoulSystem.HeroSoulViewController")
end
--@auto code Btjiangh btFunc end

--@auto code Huodongbt btFunc
function MainViewController:onHuodongbtClick()
    Functions.printInfo(self.debug,"Huodongbt button is click!")
    
    local SoulShop = function()
        GameCtlManager:push("app.ui.soulShopSystem.SoulShopViewController")
    end
    SoulShopData:sendShop(SoulShop)
end
--@auto code Huodongbt btFunc end

--@auto code Sevenawardbt btFunc
function MainViewController:onSevenawardbtClick()
    Functions.printInfo(self.debug,"Sevenawardbt button is click!")
    self:openChildView("app.ui.popViews.CarnivalPopView")
    --self:openChildView("app.ui.popViews.HolidayPopView")
end
--@auto code Sevenawardbt btFunc end

--@auto code Jrkhbt btFunc
function MainViewController:onJrkhbtClick()
    Functions.printInfo(self.debug,"Jrkhbt button is click!")
    self:openChildView("app.ui.popViews.HolidayPopView")
end
--@auto code Jrkhbt btFunc end

--@auto code Xuanxbt btFunc
function MainViewController:onXuanxbtClick()
    Functions.printInfo(self.debug,"Xuanxbt button is click!")
    self:openChildView("app.ui.popViews.SelectGirlPopView")
end
--@auto code Xuanxbt btFunc end

--@auto button backcall end


--@auto code view display func
function MainViewController:onDisplayView()
    Functions.printInfo(self.debug_b," MainViewController view enter display!")
    self._vipPanel_t:setBackGroundColorOpacity(0)
    Functions.delayCallHandler(self._vipPanel_t,300,function( )
    	local text1 = ""
    	local text2 = ""
    	if VipData.eventAttr.m_vipLevel >= 15 then 
    		text1 = LanguageConfig.language_vip_bubble_tips1
    		text2 = LanguageConfig.language_vip_bubble16
    	else
    		text1 = "V" .. tostring(VipData.eventAttr.m_vipLevel+1) ..  LanguageConfig.language_vip_bubble_tips2
    		text2 = LanguageConfig["language_vip_bubble" .. tostring(VipData.eventAttr.m_vipLevel+1)]
    	end
    	Functions.playBubbleAction(self._vipPanel_t,text1,text2)
    end)


    GameEventCenter:dispatchEvent({ name = MainViewController.ENTER_MAINVIEW_EVENT_NAME  })

    --sdk
    Functions.setAdbrixTag("firstTimeExperience","loading_2_complete")
    Functions.callJavaFuc(function()            
        NativeUtil:javaCallHanler({command = "setTargetData",customUserDataKey = "server", customUserData = NetWork.serverId})
    end)
    
   	--初始化底部按钮
   	self:initDownBtState_()

    --初始化滑动层
    self:initScrollState_()

    --初始化ui动画
    self:initUiAnima_()

    --初始化界面显示数据
    self:initUiDisplay_()

    --初始化界面Title状态
    self:initUiTitleState_()

    --初始化体力相关状态
    self:initPowerState_()
    
    --初始化聊天
    self.chatView = require("app.ui.popViews.ChatPopView").new()
    self.chatView:LoadSelfView()
    self.view_t:addChild(self.chatView)
  
    --新手引导
    -- PromptManager:openNewGuide(self._zhaomuBt_t, "测试代码输出")
    if not G_IsUseSDK then
	    scheduler.performWithDelayGlobal(function()
	            NoticeManager:openNotice(self, { type = NoticeManager.SYSTEM_INFO } )
	        end, 0.1)
	end

end
--@auto code view display func end

function MainViewController:onReceiveChildCtlData(data)
end

function MainViewController:initDownBtState_()

	if G_CurrentLanguage == "ch" then
    	-- 隐藏韩国帮助按钮
    	-- self._serviceBt_t:setVisible(false)
    end

	--初始化底部按钮组
    local bts = self._downBtPanel_t:getChildren()
    self._rightDownBts = {}
    for i=1, 8 do
        self._rightDownBts[i] = self._downBtPanel_t:getChildByTag(i)
    end
    self._zoomPanel = self._downBtPanel_t:getChildByTag(9)
    self._isHidingBt = false
    self._isBtHide = false

    --取消右下面板吞噬触摸
    self._downBtPanel_t:setSwallowTouches(false)

    if PlayerData.eventAttr.m_level < g_csOpen.JiangHun.level then
    	self._btJiangh_t:setVisible(false)
    end
end

function MainViewController:initScrollState_()

	--设置建筑按钮不吞噬触摸，所以要配置主城按钮的逻辑标签号
    for i=1, 6 do
        local bt = self._MainMid1Panel_t:getChildByTag(i)
        if bt then
            bt:setSwallowTouches(false)
        end
    end

    for i=1, 5 do
        local bt = self._MainFrontPanel_t:getChildByTag(i)
        if bt then
            bt:setSwallowTouches(false)
        end
    end

    --添加滑动层监听
    self.backPanelSpeed = 0.7
    self.midPanelSpeed = 0.5
    self.mid1PanelSpeed = 0.3

--    self.old_midPanelPos = self._MainMidPanel_t:getPositionX()
    self.old_mid1PanelPos = self._MainMid1Panel_t:getPositionX()
    self.old_BackPanelPos = self._MainBackPanel_t:getPositionX()

    local onScrollView = function(event)
        if event.name == "SCROLLING" then
            self:updateScrollViewFunc()
        end
    end
    self._ScrollView_t:onEvent(onScrollView)

    --initScrollView
    self._ScrollView_t:getInnerContainer():setPositionX(-800)
    self:updateScrollViewFunc()

end

function MainViewController:initPowerState_()

	--初始化相关文本
    self._nextPowerTitle_t:setString(LanguageConfig.ui_MainView_1)
    self._recAllPowerTitle_t:setString(LanguageConfig.ui_MainView_2)
    self._recTimeTitle_t:setString(LanguageConfig.ui_MainView_3)
    self._buyPowerTitle_t:setString(LanguageConfig.ui_MainView_4)

	--初始化体力恢复
    local  onPower_btClick = function(event)
	    if event.name == "began" then
	    	TimerManager:sendServerTimeRequest()
	    	self._power_panel_t:setVisible(true)
	    elseif event.name == "ended" then
	    	self._power_panel_t:setVisible(false)
	    elseif event.name == "cancelled" then
	    	self._power_panel_t:setVisible(false)
	    end
	    
	end

	local onPowerChange = function()
		self._buyPowerCount_t:setString(tostring(PlayerData.eventAttr.m_buyEnergyCount) .. "/" .. tostring(g_VipCgf.BugEnergy[VipData.eventAttr.m_vipLevel]))
	   	Functions.bindUiWithModelAttr(self._buyPowerCount_t, PlayerData, "m_buyEnergyCount", function()
					self._buyPowerCount_t:setString(tostring(PlayerData.eventAttr.m_buyEnergyCount) .. "/" .. tostring(g_VipCgf.BugEnergy[VipData.eventAttr.m_vipLevel]))
				end)
	   	Functions.bindUiWithModelAttr(self._buyPowerCount_t, VipData, "m_vipLevel", function()
					self._buyPowerCount_t:setString(tostring(PlayerData.eventAttr.m_buyEnergyCount) .. "/" .. tostring(g_VipCgf.BugEnergy[VipData.eventAttr.m_vipLevel]))
				end)

	    self._power_bt_t:onTouch(Functions.createClickListener(onPower_btClick, "select"))
	    self._powerRecoverTime_t:setString(string.format(LanguageConfig["tili_minute"], g_csBaseCfg.EnergyMaintainCD/60))

	    if g_csBaseCfg.MaxBaseEnergy > PlayerData.eventAttr.m_energy then
	        local powerTimeHf = function()
	            local nextTime = g_csBaseCfg.EnergyMaintainCD - (TimerManager:getCurrentSecond() - PlayerData.eventAttr.m_energyTime)%g_csBaseCfg.EnergyMaintainCD

			    local allTime = g_csBaseCfg.EnergyMaintainCD * (g_csBaseCfg.MaxBaseEnergy - PlayerData.eventAttr.m_energy - 1) + nextTime
			    
			    self._freePowerTime_t:setString(TimerManager:formatOverTime("%02d:%02d", nextTime))
			    self._allFreePowerTime_t:setString(TimerManager:formatOverTime("%02d:%02d:%02d", allTime))
			end
			powerTimeHf()
			if self.powerTimeHandler then
				Functions.removeEventListenerByView(self.view_t, GameEventCenter, self.powerTimeHandler)
			end
			self.powerTimeHandler = Functions.bindEventListener(self.view_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, powerTimeHf)
		else
			self._freePowerTime_t:setString(LanguageConfig["language_8_59"])
			self._allFreePowerTime_t:setString("")
			if self.powerTimeHandler then
				Functions.removeEventListenerByView(self.view_t, GameEventCenter, self.powerTimeHandler)
			end
		end
	end
	onPowerChange()
	Functions.bindUiWithModelAttr(self.view_t, PlayerData, "m_energy", onPowerChange)
end

function MainViewController:openBgMusic()
    Audio.playMusic("sound/main2.mp3",true)
end

function MainViewController:hideRightDownBtHandler_(isHide)

    local moveY = 0
    if isHide then
        moveY = -100 
    else
        moveY = 100
    end
    self._isHidingBt = true 
    local delayMul = 0.15

    local moveY_top = 0 
    if isHide then
    	moveY_top = -200
    else
    	moveY_top = 200
    end

    for i=1, #self._rightDownBts do
        local index = i
        if not isHide then
            index = #self._rightDownBts + 1 - i
        end

        if i == #self._rightDownBts then
            transition.execute(self._rightDownBts[index], cc.MoveBy:create(delayMul,cc.p(0, moveY)), {
                delay = delayMul * (i-1),
                onComplete = function()
                    self._isHidingBt = false
                    self._isBtHide = isHide

                    --隐藏重生按钮
    				-- transition.execute(self._btChongs_t, cc.MoveBy:create(0.3,cc.p(0, moveY_top)))
                end
            })
        else
            transition.execute(self._rightDownBts[index], cc.MoveBy:create(delayMul,cc.p(0, moveY)), {
                delay = delayMul * (i-1)
            })
        end
    end

    self._zoomPanel:rotateBy({ time = 0.5, rotation = 180 })

end

function MainViewController:initUiDisplay_()

	--隐藏限时神将
    if ActivityData.eventAttr.isEnableActivityHero == 1 then 
   		Functions.setEnabledBt(self._limitTimeHeroBt_t, true)
    else
    	Functions.setEnabledBt(self._limitTimeHeroBt_t, false)
    end

    Functions.bindUiWithModelAttr(self._limitTimeHeroBt_t, ActivityData, "isEnableActivityHero",function(event)
      	if event.data == 1 then 
   			Functions.setEnabledBt(self._limitTimeHeroBt_t, true)
	    else
	    	Functions.setEnabledBt(self._limitTimeHeroBt_t, false)
	    end
	end)

    --隐藏首充大礼包
    if PlayerData.eventAttr.m_vipFirstFlag == 2 then
    	self._scdlbBt_t:setVisible(false)
    else
    	self._scdlbBt_t:setVisible(true)
    end

    local mmm = TimerManager:getCurrentSecond()
     
    local ppp = PlayerData.eventAttr.jrth_st
    local ooo = PlayerData.eventAttr.xffl_st
    local iii = PlayerData.eventAttr.zhzb_st
    local uuu = PlayerData.eventAttr.jrth_et
    local yyy = PlayerData.eventAttr.xffl_et
    local ttt = PlayerData.eventAttr.zhzb_et
    --隐藏节日狂欢
    if ((TimerManager:getCurrentSecond() > PlayerData.eventAttr.jrth_st) and (TimerManager:getCurrentSecond() < PlayerData.eventAttr.jrth_et)) 
        or ((TimerManager:getCurrentSecond() > PlayerData.eventAttr.xffl_st) and (TimerManager:getCurrentSecond() < PlayerData.eventAttr.xffl_et))
        or ((TimerManager:getCurrentSecond() > PlayerData.eventAttr.zhzb_st) and (TimerManager:getCurrentSecond() < PlayerData.eventAttr.zhzb_et)) then
    	self._jrkhBt_t:setVisible(true)
    else
        self._jrkhBt_t:setVisible(false)
    end

    --隐藏七日狂欢
    if PlayerData.eventAttr.et < TimerManager:getCurrentSecond() then
    	self._sevenAwardBt_t:setVisible(false)
    end

    --隐藏选秀活动
    Functions.setEnabledBt(self._xuanxBt_t, ActivityData.eventAttr.sg_sys_isOpenSelectGirl)
    
    --充值活动
    local onCzbxChange = function(event)
    	if event.data == 0 then
    		self._czbxBt_t:setVisible(false)
    		Functions.removeModelAtrrEvent(DiscountData, "remainTimeStr")
    	else
    		self._czbxBt_t:setVisible(true)
            Functions.initLabelOfString( self._czbx_time_t, DiscountData.eventAttr.remainTimeStr)
            Functions.bindUiWithModelAttr(self._czbx_time_t,  DiscountData, "remainTimeStr")
    	end
    end
    Functions.bindUiWithModelAttr(self._czbxBt_t,  DiscountData, "DiscountDataBZ", onCzbxChange)
    onCzbxChange({ data = DiscountData.eventAttr.DiscountDataBZ })

    --初始化全局数据显示
    Functions.bindMGSDisplay( {moneyObj = self._coinText_t, goldObj = self._moneyText_t, powerObj = self._powerText_t} )

    self._vipLevel_t:setString(tonumber(VipData.eventAttr.m_vipLevel))
    Functions.bindUiWithModelAttr(self._vipLevel_t, VipData, "m_vipLevel")
  
    --初始化人物显示信息
    self._levelText_t:setString(tostring(PlayerData.eventAttr.m_level))
    Functions.bindUiWithModelAttr(self._levelText_t, PlayerData, "m_level")

    --初始化战斗力
    self._fightPower_t:setString(EmbattleData.eventAttr.zhanLiDis)
    Functions.bindUiWithModelAttr(self._fightPower_t, EmbattleData, "zhanLiDis")

    self._heroNameText_t:setString(tostring(PlayerData.eventAttr.m_name))
    Functions.bindUiWithModelAttr(self._heroNameText_t, PlayerData, "m_name")

    local onHeroHeadChange = function(event)
        Functions.initLordHeadOfId(self._topHead_t:getChildByName("model"), event.data)
    end
    Functions.bindUiWithModelAttr(self._topHead_t, PlayerData, "m_imgID", onHeroHeadChange)
    Functions.initLordHeadOfId(self._topHead_t:getChildByName("model"), PlayerData.eventAttr.m_imgID)
    --初始化界面提醒
    Functions.registerStateListenerOfBt(self._loginRewardBt_t, RewardStateData, "loginRewardFlag") --登陆领奖
    Functions.registerStateListenerOfBt(self._SignRewardBt_t, RewardStateData, "signRewardFlag") --签到领奖
    Functions.registerStateListenerOfBt(self._chengjiuBt_t, TaskData, "chengJiuRewardFalg") --成就
    Functions.registerStateListenerOfBt(self._taskBt_t, TaskData, "taskRewardFalg") --任务
    Functions.registerStateListenerOfBt(self._mailTitil_t, MailData, "mailBZ") --邮箱
    Functions.registerStateListenerOfBt(self._vipBt_t, VipData, "vipRewardFlag") --vip标志
    Functions.registerStateListenerOfBt(self._upLevelBt_t, SoldiersData, "SoldiersBZ") --士兵神级标志
    Functions.registerStateListenerOfBt(self._zhaomText_t, EnlistData, "EnlistDataBZ") --招募提醒标志
    Functions.registerStateListenerOfBt(self._libaoBt_t, ActivityData, "m_onlinePrizeState") --在线领奖
    Functions.registerStateListenerOfBt(self._upLevelBt_t, SoldiersData, "SoldiersBZ") --士兵升级
    Functions.registerStateListenerOfBt(self._hechengBt_t, CompoundData, "CompoundBZ") --士兵升级
    Functions.registerStateListenerOfBt(self._mainCityTitil_t, CityData, "cityDataBZ") --主城标志
    Functions.registerStateListenerOfBt(self._fuliBt_t, ActivityData, "fuLiDataBZ") --福利标志
    Functions.registerStateListenerOfBt(self._limitTimeHeroBt_t, ActivityData, "freeTakeHeroFlag") --限时神将
    Functions.registerStateListenerOfBt(self._sevenAwardBt_t, CarnivalData, "kuangHuanDataBZ") --七日狂欢
    Functions.registerStateListenerOfBt(self._jrkhBt_t, HolidayData, "XiaoFeiBZ")--节日狂欢

    --初始化主城建筑触摸区
    -- self._tiantiBt_t:ignoreContentAdaptWithSize(false)
    -- self._tiantiBt_t:setSize({ width = self._tiantiBt_t:getSize().width,height = self._tiantiBt_t:getSize().height*0.8 })
    --打开邮件刷新
    MailData:openRefreshMail()

end

function MainViewController:initUiTitleState_()
   
   	--血战
	Functions.setGraySprite(self._xuezTitle_t, not ModelManager:isModelOpenOfName("xueZhan"))
	Functions.bindUiWithModelAttr(self._xuezTitle_t, PlayerData, "m_level", function()
			Functions.setGraySprite(self._xuezTitle_t, not ModelManager:isModelOpenOfName("xueZhan"))
		end)
   	--七星坛
	Functions.setGraySprite(self._sevenStarTitle_t, not ModelManager:isModelOpenOfName("sevenStar"))
	Functions.bindUiWithModelAttr(self._sevenStarTitle_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._sevenStarTitle_t, not ModelManager:isModelOpenOfName("sevenStar"))
			end)
   	--天梯
	Functions.setGraySprite(self._tiantTitle_t, not ModelManager:isModelOpenOfName("tianTi"))
	Functions.bindUiWithModelAttr(self._tiantTitle_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._tiantTitle_t, not ModelManager:isModelOpenOfName("tianTi"))
			end)
   	--工会
	Functions.setGraySprite(self._tinkerText_t, not ModelManager:isModelOpenOfName("union"))
	Functions.bindUiWithModelAttr(self._tinkerText_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._tinkerText_t, not ModelManager:isModelOpenOfName("union"))
			end)
	--英雄试炼
	Functions.setGraySprite(self._heroShilianTitle_t, not ModelManager:isModelOpenOfName("shiLian"))
   	Functions.bindUiWithModelAttr(self._heroShilianTitle_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._heroShilianTitle_t, not ModelManager:isModelOpenOfName("shiLian"))
			end)
   	--主城
   	Functions.setGraySprite(self._mainCityTitil_t, not ModelManager:isModelOpenOfName("city"))
   	Functions.bindUiWithModelAttr(self._mainCityTitil_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._mainCityTitil_t, not ModelManager:isModelOpenOfName("city"))
			end)

	if G_CurrentLanguage == "ch" or G_CurrentLanguage == "hk" then
		--工会战
		Functions.setGraySprite(self._gvgTitle_t, not ModelManager:isModelOpenOfName("guildBattle"))
		Functions.bindUiWithModelAttr(self._gvgTitle_t, PlayerData, "m_level", function()
					Functions.setGraySprite(self._gvgTitle_t, not ModelManager:isModelOpenOfName("guildBattle"))
				end)
	end

	--过关斩将
   	Functions.setGraySprite(self._heroKillTitile_t, not ModelManager:isModelOpenOfName("heroKill"))
   	Functions.bindUiWithModelAttr(self._heroKillTitile_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._heroKillTitile_t, not ModelManager:isModelOpenOfName("heroKill"))
			end)

   	--过关斩将
   	Functions.setGraySprite(self._guoZhanTitile_t, not ModelManager:isModelOpenOfName("war"))
   	Functions.bindUiWithModelAttr(self._guoZhanTitile_t, PlayerData, "m_level", function()
				Functions.setGraySprite(self._guoZhanTitile_t, not ModelManager:isModelOpenOfName("war"))
			end)

	
end

function MainViewController:moveBtCenter(button)
	local pos = button:getWorldPos()
	local size = button:getSize()

	local movePanel = self._ScrollView_t:getInnerContainer()
	if pos.x <= size.width/2 then
		movePanel:setPositionX(movePanel:getPositionX() + (size.width/2 - pos.x + 100))
		self:updateScrollViewFunc()
	elseif pos.x >= (display.width - size.width/2) then
		movePanel:setPositionX(movePanel:getPositionX() + (display.width - size.width/2 - pos.x - 100 ))
		self:updateScrollViewFunc()
	end
end


function MainViewController:updateScrollViewFunc()
    local pos = self._ScrollView_t:getInnerContainer():getPositionX()
    self._MainBackPanel_t:setPositionX(self.old_BackPanelPos+ -1*pos*self.backPanelSpeed)
    self._MainMid1Panel_t:setPositionX(self.old_mid1PanelPos+ -1*pos*self.mid1PanelSpeed)
end

function MainViewController:initUiAnima_()

    --战鼓
    Functions.playAnimaOfUI(self._drumWave_anima_t, "drumWave_plist", 0.8)

    --七星塔
    Functions.playAnimaOfUI(self._sevenStar_anima_t, "sevenStar_plist", 1)

    --招募
    Functions.playAnimaOfUI(self._stars_anima_1_t, "stars_plist", 1.5)
    Functions.playAnimaOfUI(self._stars_anima_2_t, "stars_plist", 1.3)

    --主城
    Functions.playAnimaOfUI(self._lantern_anima_t, "lantern_plist", 0.3, false)

    --火动画
    Functions.playAnimaOfUI(self._fire_anima_t, "mainUIFire_plist", 0, false)

    --宝箱动画
    Functions.playAnimaOfUI(self._czbx_anima_t, "czbx_plist", 0, false)

    --出战特效
    local seqAction = cc.Sequence:create(cc.FadeTo:create(1, 0), cc.FadeTo:create(1, 100)) 
    Functions.playActionOfUI(self._mainGate_anima_t, seqAction, 0.5, false)

    --任务bg外发光
    Functions.playActionWithBackCall(self._taskBg_t, UIActionTool:createBlinkAction(0.8))

end

return MainViewController