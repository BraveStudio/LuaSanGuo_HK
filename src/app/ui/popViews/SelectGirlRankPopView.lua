--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local SelectGirlRankPopView = class("SelectGirlRankPopView", BasePopView)

local Functions = require("app.common.Functions")

SelectGirlRankPopView.csbResPath = "tyj/csb"
SelectGirlRankPopView.debug = true
SelectGirlRankPopView.studioSpriteFrames = {"CB_unionTankuang","SelectGirl" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #SelectGirlRankPopView.studioSpriteFrames > 0 then
    SelectGirlRankPopView.spriteFrameNames = SelectGirlRankPopView.spriteFrameNames or {}
    table.insertto(SelectGirlRankPopView.spriteFrameNames, SelectGirlRankPopView.studioSpriteFrames)
end
function SelectGirlRankPopView:onInitUI()

    --output list
    self._rankPanel_t = self.csbNode:getChildByName("Panel_140"):getChildByName("rankPanel")
	
    --label list
    
    --button list
    self._closeBt_t = self.csbNode:getChildByName("Panel_140"):getChildByName("closeBt")
	self._closeBt_t:onTouch(Functions.createClickListener(handler(self, self.onClosebtClick), ""))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Closebt btFunc
function SelectGirlRankPopView:onClosebtClick()
    Functions.printInfo(self.debug,"Closebt button is click!")
    self:close()
end
--@auto code Closebt btFunc end

--@auto button backcall end


--@auto code output func
function SelectGirlRankPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
end

function SelectGirlRankPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
    local girlMark = data.girlMark
    ActivityData:requestSelectGirlRank(girlMark,handler(self,self.initDisplayUI))
end

function SelectGirlRankPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end
function SelectGirlRankPopView:initDisplayUI(data)
    local listHandler = function(index, widget, model, data)
        local rankNode = widget:getChildByName("rankNum")
        local playerNameNode = widget:getChildByName("playerName")
        local voteNumNode = widget:getChildByName("voteNum")
        local percentNode = widget:getChildByName("percent")
        Functions.initTextColor(model:getChildByName("playerName"),playerNameNode)
        Functions.initTextColor( model:getChildByName("voteNum"),voteNumNode)
        Functions.initTextColor(model:getChildByName("percent"),percentNode)        
        rankNode:setString(tostring(index))
        playerNameNode:setString(tostring(data.playerName))
        voteNumNode:setString(tostring(data.voteNum))
        percentNode:setString(tostring(data.percent) .. "%")
    end
    Functions.bindTableViewWithData(self._rankPanel_t,{firstData = data,
                                     secondData =data},
                                     {handler = listHandler,},
                                     {direction = true,col = 1,firstSegment = 10,segment = 10,segmentY = 20})
    
end
return SelectGirlRankPopView