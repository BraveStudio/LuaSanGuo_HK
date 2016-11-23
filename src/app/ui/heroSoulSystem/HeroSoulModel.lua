local BaseModel = require("app.baseMVC.BaseModel")

local HeroSoulModel = class("HeroSoulModel", BaseModel)

HeroSoulModel.debug = false
--事件属性
HeroSoulModel.eventAttr = {}
--事件名称


function HeroSoulModel:ctor(param)
    --parent init
    self.index = param.index
    self.id = param.id 
    self.mark = param.mark
    self.level = param.level
    self.exp = param.exp
    if param.atkFormFlag ~= nil then
        if param.atkFormFlag > 0 and param.atkFormFlag <= 10 then 
           self.atkFormFlag = 1 
        elseif param.atkFormFlag > 10 and param.atkFormFlag <= 20 then
           self.atkFormFlag = 2 
        elseif param.atkFormFlag > 20 and param.atkFormFlag <= 30 then
           self.atkFormFlag = 3 
        else
            self.atkFormFlag = 0
        end
    else
        self.atkFormFlag = 0
    end
    self:init()  
end

function HeroSoulModel:init()
    self.super.init(self)
end


return HeroSoulModel