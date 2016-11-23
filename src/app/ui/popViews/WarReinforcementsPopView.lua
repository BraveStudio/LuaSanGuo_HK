--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local WarReinforcementsPopView = class("WarReinforcementsPopView", BasePopView)

local Functions = require("app.common.Functions")

WarReinforcementsPopView.csbResPath = "lk/csb"
WarReinforcementsPopView.debug = true
WarReinforcementsPopView.studioSpriteFrames = {"CB_unionTankuang","UnionUI","RankUI","WarUI_Text","WarUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #WarReinforcementsPopView.studioSpriteFrames > 0 then
    WarReinforcementsPopView.spriteFrameNames = WarReinforcementsPopView.spriteFrameNames or {}
    table.insertto(WarReinforcementsPopView.spriteFrameNames, WarReinforcementsPopView.studioSpriteFrames)
end
function WarReinforcementsPopView:onInitUI()

    --output list
    self._Panel_player_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Panel_player")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_icon_bai"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_close btFunc
function WarReinforcementsPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self.close(self)
end
--@auto code Button_close btFunc end

--@auto button backcall end


--@auto code output func
function WarReinforcementsPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function WarReinforcementsPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
    self.bigID = data.bigID
    self:showList()
end

function WarReinforcementsPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function WarReinforcementsPopView:showList()
    Functions.printInfo(self.debug,"showList")
    
        local listHandler = function(index, widget, model, data)
        Functions.initTextColor(model:getChildByName("Text_player_guan_zhi"),widget:getChildByName("Text_player_guan_zhi"))
        Functions.initTextColor(model:getChildByName("Text_num"),widget:getChildByName("Text_num"))
        Functions.initTextColor(model:getChildByName("Text_player"),widget:getChildByName("Text_player"))
        Functions.initTextColor(model:getChildByName("Text_player_level"),widget:getChildByName("Text_player_level"))
        widget:setTouchEnabled(false)

        widget:getChildByName("Text_player_guan_zhi"):setString(data.offer)
        widget:getChildByName("Text_num"):setString(data.fight)
        widget:getChildByName("Text_player"):setString(data.name)
        widget:getChildByName("Text_player_level"):setString(data.level)

        local onClickOK = function(event)
            --点击同意
            WarData:sendApplyOk (self.bigID, data.uid, handler(self, self.onRefresh))
        end
         widget:getChildByName("Button_OK"):onTouch(Functions.createClickListener(onClickOK, "zoom"))

         local onClickNO = function(event)
            --点击拒绝
            WarData:sendApplyNo (self.bigID, data.uid, handler(self, self.onRefresh))
        end
         widget:getChildByName("Button_NO"):onTouch(Functions.createClickListener(onClickNO, "zoom"))
    end

    local CheckFriend = WarData:getCheckFriend()
    Functions.bindTableViewWithData(self._Panel_player_t,{ firstData = CheckFriend },{handler = listHandler},{direction = false, col = 1, firstSegment = 0, segment = 2 }) 
end


function WarReinforcementsPopView:onRefresh()
    Functions.printInfo(self.debug,"onRefresh")
    self:showList()
end


return WarReinforcementsPopView