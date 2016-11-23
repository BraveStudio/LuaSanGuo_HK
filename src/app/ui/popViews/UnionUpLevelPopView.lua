--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local UnionUpLevelPopView = class("UnionUpLevelPopView", BasePopView)

local Functions = require("app.common.Functions")

UnionUpLevelPopView.csbResPath = "lk/csb"
UnionUpLevelPopView.debug = true
UnionUpLevelPopView.studioSpriteFrames = {"UnionUI_Text","CB_unionTankuang","UnionUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #UnionUpLevelPopView.studioSpriteFrames > 0 then
    UnionUpLevelPopView.spriteFrameNames = UnionUpLevelPopView.spriteFrameNames or {}
    table.insertto(UnionUpLevelPopView.spriteFrameNames, UnionUpLevelPopView.studioSpriteFrames)
end
function UnionUpLevelPopView:onInitUI()

    --output list
    self._Text_mo_bai_num_t = self.csbNode:getChildByName("Panel_god_4"):getChildByName("Text_mo_bai_num")
	self._Text_mo_bai_num_money_t = self.csbNode:getChildByName("Panel_god_4"):getChildByName("Text_mo_bai_num_money")
	
    --label list
    
    --button list
    self._Button_up_level_t = self.csbNode:getChildByName("Panel_god_4"):getChildByName("Button_up_level")
	self._Button_up_level_t:onTouch(Functions.createClickListener(handler(self, self.onButton_up_levelClick), "zoom"))

	self._Button_close_t = self.csbNode:getChildByName("Panel_god_4"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function UnionUpLevelPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self:close(self)
end
--@auto code Button_close btFunc end

--@auto code Button_up_level btFunc
function UnionUpLevelPopView:onButton_up_levelClick()
    Functions.printInfo(self.debug,"Button_up_level button is click!")
    
    local onUPInfo = function(event)
        if  event.reqtype == 38 then
            if event.ret == 1 then
                local UnionInfo = UnionData:getUnionInfoData()
                local data = event.data
                UnionInfo[1].eventAttr.guild_level = data.guild_level
                UnionInfo[1].eventAttr.allActif = data.allActif
                
                --公会等级提升的监听
                GameEventCenter:dispatchEvent({ name = UnionData.UNION_LV_EVENT, data = {} })
                
                self:uiShow()
            else
                --弹出报错信息
                PromptManager:openTipPrompt(ConfigHandler:getServerErrorCode(event.ret))
                --PromptManager:openTipPrompt(g_csErrorString[event.ret])
            end
            return true
        end

    end
    NetWork:addNetWorkListener({ 7, 1 }, onUPInfo)
    NetWork:sendToServer({ idx = { 7, 1 }, reqtype = 38})
    
    
    
end
--@auto code Button_up_level btFunc end

--@auto button backcall end


--@auto code output func
function UnionUpLevelPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function UnionUpLevelPopView:onDisplayView()
	Functions.printInfo(self.debug,"pop action finish ")
    self:uiShow()
end

function UnionUpLevelPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function UnionUpLevelPopView:uiShow()
    Functions.printInfo(self.debug,"uiShow ")
    local UnionInfo = UnionData:getUnionInfoData()

    local upLevel = UnionInfo[1].eventAttr.guild_level
    local oooo = #g_csBaseCfg.guildUpLevelNeedExp
    if upLevel < #g_csBaseCfg.guildUpLevelNeedExp then
        upLevel = UnionInfo[1].eventAttr.guild_level + 1
    end
    local strLv = "lv "..tostring(UnionInfo[1].eventAttr.guild_level).."－lv "..tostring(upLevel)
    local strExp = tostring(UnionInfo[1].eventAttr.allActif).."/"..tostring(g_csBaseCfg.guildUpLevelNeedExp[upLevel])
    Functions.initLabelOfString(self._Text_mo_bai_num_t, strLv, self._Text_mo_bai_num_money_t, strExp)
end

return UnionUpLevelPopView