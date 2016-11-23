--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local CountryFightPopView = class("CountryFightPopView", BasePopView)

local Functions = require("app.common.Functions")

CountryFightPopView.csbResPath = "cs/csb"
CountryFightPopView.debug = true
CountryFightPopView.studioSpriteFrames = {"CountryFightUI_Text" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #CountryFightPopView.studioSpriteFrames > 0 then
    CountryFightPopView.spriteFrameNames = CountryFightPopView.spriteFrameNames or {}
    table.insertto(CountryFightPopView.spriteFrameNames, CountryFightPopView.studioSpriteFrames)
end
function CountryFightPopView:onInitUI()

    --output list
    self._fightWinPanel_t = self.csbNode:getChildByName("fightWinPanel")
	self._fightFailPanel_t = self.csbNode:getChildByName("fightFailPanel")
	self._fightInvalidPanel_t = self.csbNode:getChildByName("fightInvalidPanel")
	self._errorCode_t = self.csbNode:getChildByName("fightInvalidPanel"):getChildByName("errorCode")
	
    --label list
    
    --button list
    self._winSureBt_t = self.csbNode:getChildByName("fightWinPanel"):getChildByName("winSureBt")
	self._winSureBt_t:onTouch(Functions.createClickListener(handler(self, self.onWinsurebtClick), ""))

	self._failSureBt_t = self.csbNode:getChildByName("fightFailPanel"):getChildByName("failSureBt")
	self._failSureBt_t:onTouch(Functions.createClickListener(handler(self, self.onFailsurebtClick), ""))

	self._invalidSureBt_t = self.csbNode:getChildByName("fightInvalidPanel"):getChildByName("invalidSureBt")
	self._invalidSureBt_t:onTouch(Functions.createClickListener(handler(self, self.onInvalidsurebtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Winsurebt btFunc
function CountryFightPopView:onWinsurebtClick()
    Functions.printInfo(self.debug,"Winsurebt button is click!")

    self:quitCombat()
end
--@auto code Winsurebt btFunc end

--@auto code Winsurebt btFunc
function CountryFightPopView:onWinsurebtClick()
    Functions.printInfo(self.debug,"Winsurebt button is click!")

    self:quitCombat()
end
--@auto code Winsurebt btFunc end

--@auto code Failsurebt btFunc
function CountryFightPopView:onFailsurebtClick()
    Functions.printInfo(self.debug,"Failsurebt button is click!")

    self:quitCombat()
end
--@auto code Failsurebt btFunc end

--@auto code Invalidsurebt btFunc
function CountryFightPopView:onInvalidsurebtClick()
    Functions.printInfo(self.debug,"Invalidsurebt button is click!")

    self:quitCombat()
end
--@auto code Invalidsurebt btFunc end

--@auto button backcall end


--@auto code output func
function CountryFightPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function CountryFightPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")

    self._fightFailPanel_t:setVisible(false)
    self._fightWinPanel_t:setVisible(false)
    self._fightInvalidPanel_t:setVisible(false)

    local scheduler = require("app.common.scheduler")
    if data.result == CombatCenter.FightResult.WIN then
        scheduler.performWithDelayGlobal(function()
            Audio.playSound("sound/game_win.mp3")
        end, 0.4)
    else
        scheduler.performWithDelayGlobal(function()
            Audio.playSound("sound/game_lose.mp3")
        end, 0.4)
    end

    --给服务器发送消息
    self.currentType  = data.combatType
    self.combatResult = data.result
    self.combatInfo = data.combatInfo
    
    local elist   = CombatCenter:getAiEventList()
    local clist   = CombatCenter:getAiCreatureList()
    local baseMsg = { idx = { 1, 2 }, data = { res = data.result, elist = elist, clist = clist } }

    baseMsg.btype = data.combatType
    local hps = CombatCenter:getHeroHpList()
    for i=1, 6 do
        baseMsg.data["hero" .. tostring(i)] = hps[i]
    end

    baseMsg.data.big = self.combatInfo.big
    baseMsg.data.small = self.combatInfo.small
    
    NetWork:addNetWorkListener({ 1, 2}, handler(self, self.onServerResponse))
    NetWork:sendToServer(baseMsg)

end

function CountryFightPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function CountryFightPopView:onServerResponse(data)
    
    if data.ret == 1 and  data.result == CombatCenter.FightResult.WIN then
        self._fightFailPanel_t:setVisible(false)
        self._fightWinPanel_t:setVisible(true)
        self._fightInvalidPanel_t:setVisible(false)
    elseif data.ret == 1 and  data.result == CombatCenter.FightResult.FAILE  then
        self._fightFailPanel_t:setVisible(true)
        self._fightWinPanel_t:setVisible(false)
        self._fightInvalidPanel_t:setVisible(false)
    else    
        self._errorCode_t:setString(ConfigHandler:getServerErrorCode(data.ret))
        self._fightFailPanel_t:setVisible(false)
        self._fightWinPanel_t:setVisible(false)
        self._fightInvalidPanel_t:setVisible(true)
    end
    
    self:getController().m_combatCount = data.plusCount
    return true
end

function CountryFightPopView:quitCombat()
    local controller = self._controller_t
    self:close()
    controller:quitCombat()
end

return CountryFightPopView