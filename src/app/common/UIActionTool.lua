local UIActionTool = {}
UIActionTool.easeType={
    easeBounceIn = 1, 
}
function UIActionTool:createBlinkAction(time)
	local fadeAction = cc.FadeOut:create(time)
    return cc.RepeatForever:create(cc.Sequence:create(fadeAction, fadeAction:reverse()))
end
function UIActionTool:createBlinkNoGradientAction(time)
    local hideAction = cc.Hide:create()
    local showAction = cc.Show:create()
    return cc.RepeatForever:create(cc.Sequence:create(showAction,cc.DelayTime:create(time), hideAction,cc.DelayTime:create(time)))
end

function UIActionTool:createAddHpAction()
    local pAddMove = cc.MoveBy:create(0.3, cc.p(0, 50))
    local pAddEaseOut = cc.EaseElasticOut:create(pAddMove)
    return pAddEaseOut
end

--战斗动作
function UIActionTool:createHpPTAction()

    local speedScale = cc.EaseOut:create(cc.ScaleBy:create(0.5, 1.5), 0.5)
    local speedMove = cc.EaseOut:create(cc.MoveBy:create(0.5, cc.p(0, 30)), 0.5)
    local fadein = cc.FadeIn:create(0.5)
    local move_scale = cc.Spawn:create(speedScale, speedMove, fadein)
    

    local afterMove = cc.EaseOut:create(cc.MoveBy:create(0.5, cc.p(0, 50)), 1)
    local fade     = cc.FadeOut:create(0.5)
    local move_fade = cc.Spawn:create(afterMove, fade)

    local setScaleFunc = function(target)
        target:setVisible(true)
        target:setOpacity(0)
    end
    local sequence = cc.Sequence:create(cc.CallFunc:create(setScaleFunc), move_scale, move_fade)
    return sequence
end

function UIActionTool:createHpBaojiAction()
    return self:hpActionHandler(2)
end

function UIActionTool:hpActionHandler(scale)
    local speedScale = cc.EaseElasticOut:create(cc.ScaleBy:create(0.8, scale))
    local speedMove = cc.EaseElasticOut:create(cc.MoveBy:create(0.8, cc.p(0, 60)))
    local move_scale = cc.Spawn:create(speedScale, speedMove)
    
    local afterMove = cc.EaseOut:create(cc.MoveBy:create(0.5, cc.p(0, 90)), 0.5)
    local fade     = cc.FadeOut:create(0.5)
    local move_fade = cc.Spawn:create(afterMove, fade)

    local setScaleFunc = function(target)
        target:setVisible(true)
    end
    
    local sequence = cc.Sequence:create(cc.CallFunc:create(setScaleFunc), move_scale, move_fade)
    return sequence
end

function UIActionTool:createUpFateAction()

    local pAddMove = cc.MoveBy:create(0.3, cc.p(0, 50))
    local pAddEaseOut = cc.EaseElasticOut:create(pAddMove)
    return pAddEaseOut

end

function UIActionTool:createCritAction()

	local scale = cc.ScaleBy:create(0.3, 1.5)
    local easeOut = cc.EaseElasticOut:create(scale)
    local move = cc.MoveBy:create(0.3, cc.p(0, 50))
    local move_scale = cc.Spawn:create(easeOut, move)
	local delay = cc.DelayTime:create(0.1)

    local bjMove = cc.MoveBy:create(0.3, cc.p(0, 30))
    local bjMoveEaseOut = cc.EaseElasticOut:create(bjMove)

	local critAction = cc.Sequence:create({ move_scale, delay })
	return critAction 
end

function UIActionTool:createLoopFunc(delay, loopFunc)

    --循环执行函数
    local action = nil
    local loopFunc_ = function(target)
        if loopFunc then
            if loopFunc() then
                target:stopAction(action)
            end
        end
    end

    local delayAction = cc.DelayTime:create(delay)
    local actionSe = cc.Sequence:create(delayAction, cc.CallFunc:create(loopFunc_))
    action = cc.RepeatForever:create(actionSe)
    return action
    
end

--让节点播放一个弹出动画
--@param: format { target = , beginScale = , endScale = , maxScale = , time = , onComplete = }
function UIActionTool:playPopAction(param)
    assert(param and param.target and type(param.target) == "userdata", "param is error")
    
    param.target:setScale(param.beginScale)
    local scaleTo1 = cc.ScaleTo:create(param.time, param.maxScale)
    local scaleTo2 = cc.ScaleTo:create(param.time, param.endScale) 
    local seq = cc.Sequence:create(scaleTo1, scaleTo2 )

    transition.execute(param.target, seq, { onComplete = param.onComplete })
end

function UIActionTool:createScaleAction(param)
    assert(param and param.minScale and param.maxScale and param.time, "param is error")
    local actionSe = cc.Sequence:create(cc.ScaleTo:create(param.time, param.minScale), cc.ScaleTo:create(param.time, param.maxScale))
    return cc.RepeatForever:create(actionSe)
end

--tyj begin 
--让一个节点播放一个移动动作，可以选择运动曲线
--@param:table
--#node: 播放动作节点
--#startPos: 起始坐标
--#endPos: 结束坐标
--#easeType:曲线类型
--#dur:持续时间
--*handler:播放完回调
--*repeatNum: delfault Value is 1 ,0 为永久播放
function UIActionTool:playMoveActionWithEase(param)
    assert(param and param.dur and param.node and param.startPos and param.endPos and param.easeType, "param is error")
    param.node:setPosition(param.startPos)
    local moveByAction = self:createMoveToAction({x = param.endPos.x,y = param.endPos.y, dur = param.dur})

    -- local easeAciton = self:createEaseBounceOutAction({actionElement = moveByAction})
    local actionList = {}
    EaseActionFunc[param.easeType](self,{actionList = actionList,actionElement = moveByAction})
    if param.handler ~= nil then 
        self:createCallFuncAction({actionList = actionList,handler = param.handler})   
    end
    Functions.playSequenceAction(param.node,actionList,0,param.repeatNum or 1)
end
--让一个节点播放一个缩放动作，可以选择缩放曲线
--@param:table
--#node: 播放动作节点
--#startRate: {x,y}
--#endRate: {x,y}
--#easeType:曲线类型
--#dur:持续时间
--*handler:播放完回调
--*repeatNum: delfault Value is 1 ,0 为永久播放
function UIActionTool:playSacleActionWithEase(param)
    assert(param and param.dur and param.node and param.startRate and param.endRate and param.easeType, "param is error")
    param.node:setScaleX(param.startRate.x)
    param.node:setScaleY(param.startRate.y)
    local moveByAction = self:createScaleToAction({sx = param.endRate.x,sy = param.endRate.y, dur = param.dur})

    local actionList = {}
    EaseActionFunc[param.easeType](self,{actionList = actionList,actionElement = moveByAction})
    if param.handler ~= nil then 
        self:createCallFuncAction({actionList = actionList,handler = param.handler})   
    end
    Functions.playSequenceAction(param.node,actionList,0,param.repeatNum or 1)
end
--让一个节点播放一个旋转动作，可以选择旋转曲线
--@param:table
--#node: 播放动作节点
--#startDstAngle: 
--#endDstAngle: 
--#easeType:曲线类型
--#dur:持续时间
--*handler:播放完回调
--*repeatNum: delfault Value is 1 ,0 为永久播放
function UIActionTool:playRotationActionWithEase(param)
    assert(param and param.dur and param.node and param.startDstAngle, "param is error")
    param.node:setRotation(param.startDstAngle)
    local moveByAction = self:createRotateToAction({dstAngle = param.endDstAngle, dur = param.dur})
    local actionList = {}
    EaseActionFunc[param.easeType](self,{actionList = actionList,actionElement = moveByAction})
    if param.handler ~= nil then 
        self:createCallFuncAction({actionList = actionList,handler = param.handler})   
    end
    Functions.playSequenceAction(param.node,actionList,0,param.repeatNum or 1)
end
--让一个节点播放一个倾斜动作，可以选择倾斜曲线
--@param:table
--#node: 播放动作节点
--#startSkew:{x,y} 
--#endSkew:{x,y} 
--#easeType:曲线类型
--#dur:持续时间
--*handler:播放完回调
--*repeatNum: delfault Value is 1 ,0 为永久播放
function UIActionTool:playSkewActionWithEase(param)
    assert(param and param.dur and param.node and param.startSkew and param.endSkew, "param is error")
    param.node:setSkewX(param.startSkew.x)
    param.node:setSkewY(param.startSkew.y)
    local moveByAction = self:createSkewToAction({sx = param.endSkew.x, sy = param.endSkew.y, dur = param.dur})
    local actionList = {}
    EaseActionFunc[param.easeType](self,{actionList = actionList,actionElement = moveByAction})
    if param.handler ~= nil then 
        self:createCallFuncAction({actionList = actionList,handler = param.handler})   
    end
    Functions.playSequenceAction(param.node,actionList,0,param.repeatNum or 1)
end
---------------------------------------------------------------------------------------
--create a moveBy action Element,support 8 driections
--@param:table
--#dir: UP,DOWN,LEFT,RIGHT,RIGHT_UP,RIGHT_DOWN,LEFT_UP,LEFT_DOWN
--#dis: move direction
--#dur: duration
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createMoveByActionWithDirection(param)
    assert(param and param.dir and param.dis and param.dur, "param is error")
    local moveByAction = nil 
    if param.dir == "UP" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(0,-param.dis))
    elseif param.dir == "DOWN" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(0,param.dis))
    elseif param.dir == "RIGHT" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(param.dis,0))
    elseif param.dir == "LEFT" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(-param.dis,0))
    elseif param.dir == "RIGHT_UP" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(param.dis,param.dis))
    elseif param.dir == "LEFT_UP" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(-param.dis,param.dis))
    elseif param.dir == "LEFT_DOWN" then 
        moveByAction = cc.MoveBy:create(param.dur,cc.p(-param.dis,-param.dis))
    end
    assert(moveByAction, "create Action failed")
    local actionElement = {actionName = moveByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a moveBy action Element
--@param:table
--#x: x轴位置
--#y: y轴位置
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createMoveByAction(param)
    assert(param and param.dur and param.x and param.y, "param is error")
    local moveByAction = nil 
    moveByAction = cc.MoveBy:create(param.dur,cc.p(param.x,param.y))
    assert(moveByAction, "create Action failed")
    local actionElement = {actionName = moveByAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a moveTo action Element
--@param:table
--#x: x轴位置
--#y: y轴位置
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createMoveToAction(param)
    assert(param and param.dur and param.x and param.y, "param is error")
    local moveToAction = nil 
    moveToAction = cc.MoveTo:create(param.dur,cc.p(param.x,param.y))
    assert(moveToAction, "create Action failed")
    local actionElement = {actionName = moveToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a scaleBy action Element
--@param:table
--#sx: x轴相对缩放比例 
--#sy: y轴相对缩放比例 
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createScaleByAction(param)
    assert(param and param.dur and param.sx and param.sy, "param is error")
    local scaleByAction = nil 
    scaleByAction = cc.ScaleBy:create(param.dur, param.sx, param.sy)
    assert(scaleByAction, "create Action failed")
    local actionElement = {actionName = scaleByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a scaleTo action Element
--@param:table
--#sx: x轴缩放比例 
--#sy: y轴缩放比例 
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createScaleToAction(param)
    assert(param and param.dur and param.sx and param.sy, "param is error")
    local scaleToAction = nil 
    scaleToAction = cc.ScaleTo:create(param.dur, param.sx, param.sy)
    assert(scaleToAction, "create Action failed")
    local actionElement = {actionName = scaleToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a RotateBy action Element
--@param:table
--#dstAngle: 旋转角度 0-360
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createRotateByAction(param)
    assert(param and param.dur and param.dstAngle, "param is error")
    local rotateByAction = nil 
    rotateByAction = cc.RotateBy:create(param.dur, param.dstAngle)
    assert(rotateByAction, "create Action failed")
    local actionElement = {actionName = rotateByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a RotateTo action Element
--@param:table
--#dstAngle: 旋转角度 0-360
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createRotateToAction(param)
    assert(param and param.dur and param.dstAngle, "param is error")
    local rotateToAction = nil 
    rotateToAction = cc.RotateTo:create(param.dur, param.dstAngle)
    assert(rotateToAction, "create Action failed")
    local actionElement = {actionName = rotateToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a RotateBy action Element
--@param:table
--#dstAngle: 旋转角度 0-360
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createRotateByAction(param)
    assert(param and param.dur and param.dstAngle, "param is error")
    local rotateByAction = nil 
    rotateByAction = cc.RotateBy:create(param.dur, param.dstAngle)
    assert(rotateByAction, "create Action failed")
    local actionElement = {actionName = rotateByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a SkewBy action Element ,创建一个倾斜SkewBy
--@param:table
--#sx: 相对倾斜角度 0-360
--#sy: 相对倾斜角度 0-360
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createSkewByAction(param)
    assert(param and param.dur and param.sx and param.sy, "param is error")
    local skewByAction = nil 
    skewByAction = cc.SkewBy:create(param.dur, param.sx, param.sy)
    assert(skewByAction, "create Action failed")
    local actionElement = {actionName = skewByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a SkewTo action Element ,创建一个倾斜SkewTo
--@param:table
--#sx: 倾斜到角度 0-360
--#sy: 倾斜到角度 0-360
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createSkewToAction(param)
    assert(param and param.dur and param.sx and param.sy, "param is error")
    local skewToAction = nil 
    skewToAction = cc.SkewTo:create(param.dur, param.sx, param.sy)
    assert(skewToAction, "create Action failed")
    local actionElement = {actionName = skewToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a JumpBy action Element ,创建一个跳跃JumpBy
--@param:table
--#pos: {x=,y=} 调到目标的位置
--#height: 跳跃高度
--#jumps: 跳跃次数
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createJumpByAction(param)
    assert(param and param.dur and param.pos and param.height and param.jumps, "param is error")
    local jumpByAction = nil 
    jumpByAction = cc.JumpBy:create(param.dur, cc.p(param.pos.x,param.pos.y), param.height, param.jumps)
    assert(jumpByAction, "create Action failed")
    local actionElement = {actionName = jumpByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a JumpTo action Element ,创建一个跳跃JumpTo
--@param:table
--#pos: {x=,y=} 调到目标的位置
--#height: 跳跃高度
--#jumps: 跳跃次数
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createJumpToAction(param)
    assert(param and param.dur and param.pos and param.height and param.jumps, "param is error")
    local jumpToAction = nil 
    jumpToAction = cc.JumpTo:create(param.dur, cc.p(param.pos.x,param.pos.y), param.height, param.jumps)
    assert(jumpToAction, "create Action failed")
    local actionElement = {actionName = jumpToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a BezierBy action Element ,创建一个贝塞尔曲线 BezierBy
--@param:table
--#ctrPointOne: {x=,y=} 控制点1位置
--#ctrPointTwo: {x=,y=} 控制点2位置
--#endPoint:  {x=,y=} 结束位置
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createBezierByAction(param)
    assert(param and param.dur and param.ctrPointOne and param.ctrPointTwo and param.endPoint, "param is error")
    local bezierByAction = nil 
    bezierByAction = cc.BezierBy:create(param.dur, {cc.p(param.ctrPointOne.x,param.ctrPointOne.y), 
        cc.p(param.ctrPointTwo.x,param.ctrPointTwo.y), cc.p(param.endPoint.x,param.endPoint.y)})
    assert(bezierByAction, "create Action failed")
    local actionElement = {actionName = bezierByAction ,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a BezierTo action Element ,创建一个贝塞尔曲线 BezierTo
--@param:table
--#ctrPointOne: {x=,y=} 控制点1位置
--#ctrPointTwo: {x=,y=} 控制点2位置
--#endPoint:  {x=,y=} 结束位置
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createBezierToAction(param)
    assert(param and param.dur and param.ctrPointOne and param.ctrPointTwo and param.endPoint, "param is error")
    local bezierToAction = nil 
    bezierToAction = cc.BezierTo:create(param.dur, {cc.p(param.ctrPointOne.x,param.ctrPointOne.y), 
        cc.p(param.ctrPointTwo.x,param.ctrPointTwo.y), cc.p(param.endPoint.x,param.endPoint.y)})
    assert(bezierToAction, "create Action failed")
    local actionElement = {actionName = bezierToAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end

--create a FadeIn action Element ,创建一个渐变出现Action FadeIn
--@param:table
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createFadeInAction(param)
    assert(param and param.dur, "param is error")
    local fadeInAction = nil 
    fadeInAction = cc.FadeIn:create(param.dur)
    assert(fadeInAction, "create Action failed")
    local actionElement = {actionName = fadeInAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a FadeOut action Element ,创建一个渐变消失Action FadeOut
--@param:table
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createFadeOutAction(param)
    assert(param and param.dur, "param is error")
    local fadeOutAction = nil 
    fadeOutAction = cc.FadeOut:create(param.dur)
    assert(fadeOutAction, "create Action failed")
    local actionElement = {actionName = fadeOutAction ,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end

--create a TintTo action Element ,创建一个色彩变化Action TintTo
--@param:table
--#rgb: {r=,g=,b=} 颜色分量 ,红绿蓝通道值 0-255
--#dur: 持续时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createTintToAction(param)
    assert(param and param.dur and param.rgb, "param is error")
    local tintToAction = nil 
    tintToAction = cc.TintTo:create(param.dur, param.rgb.r, param.rgb.g, param.rgb.b)
    assert(tintToAction, "create Action failed")
    local actionElement = {actionName = tintToAction,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a TintBy action Element ,创建一个色彩变化Action TintBy
--@param:table
--#rgb: {r=,g=,b=} 颜色分量 ,红绿蓝通道值 0-255
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createTintByAction(param)
    assert(param and param.dur and param.rgb, "param is error")
    local tintByAction = nil 
    tintByAction = cc.TintBy:create(param.dur, param.rgb.r, param.rgb.g, param.rgb.b)
    assert(tintByAction, "create Action failed")
    local actionElement = {actionName = tintByAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end

--create a Blink action Element ,创建一个闪烁Action Blink
--@param:table
--#blinks: 闪烁次数
--#dur: 持续时间
--*repeatNum: delfault Value is 1
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createBlinksAction(param)
    assert(param and param.dur and param.blinks, "param is error")
    local blinkAction = nil 
    blinkAction = cc.Blink:create(param.dur, param.blinks)
    assert(blinkAction, "create Action failed")
    local actionElement = {actionName = blinkAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end

--create a DelayTime action Element ,创建一个延时Action DelayTime
--@param:table
--#delayTime: 延时时间
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createDelayTimeAction(param)
    assert(param and param.delayTime, "param is error")
    local delayAction = nil 
    delayAction = cc.DelayTime:create(param.delayTime)
    assert(delayAction, "create Action failed")
    local actionElement = {actionName = delayAction,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a CallFunc action Element ,创建一个延时Action CallFunc
--@param:table
--#handler: 回调函数
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createCallFuncAction(param)
    assert(param and param.handler, "param is error")
    local callbackAction = nil 
    callbackAction = cc.CallFunc:create(param.handler)
    assert(callbackAction, "create Action failed")
    local actionElement = {actionName = callbackAction,repeatNum = 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--create a Follow action Element ,创建一个闪烁Action Follow
--@param:table
--followedNode: 被跟踪的目标节点
--#rect: 追踪的边界{x=,y=,width=,height},超过这个边界不跟踪
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createFollowAction(param)
    assert(param and param.rect and param.followedNode, "param is error")
    local followAction = nil 
    followAction = cc.Follow:create(param.followedNode, param.rect)
    assert(followAction, "create Action failed")
    local actionElement = {actionName = followAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
--------------------------------------------------------------------------------------------
--create a EaseBounceIn action Element ,让目标动作缓慢开始 Action EaseBounceIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBounceInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBounceInAction = nil 
    easeBounceInAction = cc.EaseBounceIn:create(param.actionElement.actionName)
    assert(easeBounceInAction, "create Action failed")
    local actionElement = {actionName = easeBounceInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseBounceOut action Element ,让目标动作赋予反弹力，且以目标动作结束位子开始反弹 Action EaseBounceOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBounceOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBounceOutAction = nil 
    easeBounceOutAction = cc.EaseBounceOut:create(param.actionElement.actionName)
    assert(easeBounceOutAction, "create Action failed")
    local actionElement = {actionName = easeBounceOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseBounceInOut action Element ,让目标动作赋予反弹力，且以目标动作起始与结束位子开始反弹 Action EaseBounceInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBounceInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBounceInOutAction = nil 
    easeBounceInOutAction = cc.EaseBounceInOut:create(param.actionElement.actionName)
    assert(easeBounceInOutAction, "create Action failed")
    local actionElement = {actionName = easeBounceInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseBackIn action Element ,让目标动作赋予回力 ， 且以目标动作起点位置作为回力点 Action EaseBackIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBackInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBackInAction = nil 
    easeBackInAction = cc.EaseBackIn:create(param.actionElement.actionName)
    assert(easeBackInAction, "create Action failed")
    local actionElement = {actionName = easeBackInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseBackOut action Element ,让目标动作赋予回力 ， 且以目标动作终点位置作为回力点 Action EaseBackOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBackOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBackOutAction = nil 
    easeBackOutAction = cc.EaseBackOut:create(param.actionElement.actionName)
    assert(easeBackOutAction, "create Action failed")
    local actionElement = {actionName = easeBackOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseBackInOut action Element ,让目标动作赋予回力 ， 且以目标动作起点和终点位置作为回力点 Action EaseBackInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseBackInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeBackInOutAction = nil 
    easeBackInOutAction = cc.EaseBackInOut:create(param.actionElement.actionName)
    assert(easeBackInOutAction, "create Action failed")
    local actionElement = {actionName = easeBackInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseElasticIn action Element ,让目标动作赋予弹性 ，且以目标动作起点位子赋予弹性 Action EaseElasticIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseElasticInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeElasticInAction = nil 
    easeElasticInAction = cc.EaseElasticIn:create(param.actionElement.actionName)
    assert(easeElasticInAction, "create Action failed")
    local actionElement = {actionName = easeElasticInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseElasticOut action Element ,让目标动作赋予弹性 ，且以目标动作终点位子赋予弹性 Action EaseElasticOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseElasticOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeElasticOutAction = nil 
    easeElasticOutAction = cc.EaseElasticOut:create(param.actionElement.actionName)
    assert(easeElasticOutAction, "create Action failed")
    local actionElement = {actionName = easeElasticOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseElasticInOut action Element ,让目标动作赋予弹性 ，且以目标动作起点和终点位子赋予弹性 Action EaseElasticInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseElasticInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeElasticInOutAction = nil 
    easeElasticInOutAction = cc.EaseElasticInOut:create(param.actionElement.actionName)
    assert(easeElasticInOutAction, "create Action failed")
    local actionElement = {actionName = easeElasticInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseExponentialIn action Element ,让目标动作缓慢开始 Action EaseExponentialIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseExponentialInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeExponentialInAction = nil 
    easeExponentialInAction = cc.EaseExponentialIn:create(param.actionElement.actionName)
    assert(easeExponentialInAction, "create Action failed")
    local actionElement = {actionName = easeExponentialInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseExponentialOut action Element ,让目标动作缓慢中止 Action EaseExponentialOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseExponentialOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeExponentialOutAction = nil 
    easeExponentialOutAction = cc.EaseExponentialOut:create(param.actionElement.actionName)
    assert(easeExponentialOutAction, "create Action failed")
    local actionElement = {actionName = easeExponentialOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseExponentialInOut action Element ,让目标动作缓慢开始和中止 Action EaseExponentialInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseExponentialInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeExponentialInOutAction = nil 
    easeExponentialInOutAction = cc.EaseExponentialInOut:create(param.actionElement.actionName)
    assert(easeExponentialInOutAction, "create Action failed")
    local actionElement = {actionName = easeExponentialInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseRateAction action Element ,设置目标动作速率 Action EaseRateAction
--@param:table
--actionElement: 
--rate:速率 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseRateActionAction(param)
    assert(param and param.actionElement and param.rate , "param is error")
    local easeRateActionAction = nil 
    easeRateActionAction = cc.EaseRateAction:create(param.actionElement.actionName, param.rate)
    assert(easeRateActionAction, "create Action failed")
    local actionElement = {actionName = easeRateActionAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a Speed action Element ,让目标动作运行速度加倍 Action Speed
--@param:table
--actionElement: 
--rate:倍率 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createSpeedAction(param)
    assert(param and param.actionElement and param.rate , "param is error")
    local speedAction = nil 
    speedAction = cc.Speed:create(param.actionElement.actionName, param.rate)
    assert(speedAction, "create Action failed")
    local actionElement = {actionName = speedAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseSineIn action Element ,动作由慢到快 Action EaseSineIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseSineInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeSineInAction = nil 
    easeSineInAction = cc.EaseSineIn:create(param.actionElement.actionName)
    assert(easeSineInAction, "create Action failed")
    local actionElement = {actionName = easeSineInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseSineOut action Element ,动作由快到慢 Action EaseSineOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseSineOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeSineOutAction = nil 
    easeSineOutAction = cc.EaseSineOut:create(param.actionElement.actionName)
    assert(easeSineOutAction, "create Action failed")
    local actionElement = {actionName = easeSineOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseSineInOut action Element ,动作由慢到快再快到慢 Action EaseSineInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseSineInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeSineInOutAction = nil 
    easeSineInOutAction = cc.EaseSineInOut:create(param.actionElement.actionName)
    assert(easeSineInOutAction, "create Action failed")
    local actionElement = {actionName = easeSineInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseQuadraticActionIn action Element ,按二次函数缓动进入的动作 Action EaseQuadraticActionIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseQuadraticActionInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeQuadraticActionInAction = nil 
    easeQuadraticActionInAction = cc.EaseQuadraticActionIn:create(param.actionElement.actionName)
    assert(easeQuadraticActionInAction, "create Action failed")
    local actionElement = {actionName = easeQuadraticActionInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseQuadraticActionOut action Element ,按二次函数缓动退出的动作 Action EaseQuadraticActionOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseQuadraticActionOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeQuadraticActionOutAction = nil 
    easeQuadraticActionOutAction = cc.EaseQuadraticActionOut:create(param.actionElement.actionName)
    assert(easeQuadraticActionOutAction, "create Action failed")
    local actionElement = {actionName = easeQuadraticActionOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseQuadraticActionInOut action Element ,按二次函数缓动进入并退出的动作 Action EaseQuadraticActionInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseQuadraticActionInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeQuadraticActionInOutAction = nil 
    easeQuadraticActionInOutAction = cc.EaseQuadraticActionInOut:create(param.actionElement.actionName)
    assert(easeQuadraticActionInOutAction, "create Action failed")
    local actionElement = {actionName = easeQuadraticActionInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCircleActionIn action Element ,按圆形曲线缓动进入的动作  Action EaseCircleActionIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCircleActionInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCircleActionInAction = nil 
    easeCircleActionInAction = cc.EaseCircleActionIn:create(param.actionElement.actionName)
    assert(easeCircleActionInAction, "create Action failed")
    local actionElement = {actionName = easeCircleActionInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCircleActionOut action Element ,按圆形曲线缓动退出的动作  Action EaseCircleActionOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCircleActionOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCircleActionOutAction = nil 
    easeCircleActionOutAction = cc.EaseCircleActionOut:create(param.actionElement.actionName)
    assert(easeCircleActionOutAction, "create Action failed")
    local actionElement = {actionName = easeCircleActionOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCircleActionInOut action Element ,按圆形曲线缓动进入并退出的动作  Action EaseCircleActionInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCircleActionInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCircleActionInOutAction = nil 
    easeCircleActionInOutAction = cc.EaseCircleActionInOut:create(param.actionElement.actionName)
    assert(easeCircleActionInOutAction, "create Action failed")
    local actionElement = {actionName = easeCircleActionInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCubicActionIn action Element ,按三次函数缓动进入的动作 Action EaseCubicActionIn
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCubicActionInAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCubicActionInAction = nil 
    easeCubicActionInAction = cc.EaseCubicActionIn:create(param.actionElement.actionName)
    assert(easeCubicActionInAction, "create Action failed")
    local actionElement = {actionName = easeCubicActionInAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCubicActionOut action Element ,按三次函数缓动退出的动作 Action EaseCubicActionOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCubicActionOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCubicActionOutAction = nil 
    easeCubicActionOutAction = cc.EaseCubicActionOut:create(param.actionElement.actionName)
    assert(easeCubicActionOutAction, "create Action failed")
    local actionElement = {actionName = easeCubicActionOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a EaseCubicActionInOut action Element ,按三次函数缓动进入并退出的动作 Action EaseCubicActionInOut
--@param:table
--actionElement: 
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createEaseCubicActionInOutAction(param)
    assert(param and param.actionElement, "param is error")
    local easeCubicActionInOutAction = nil 
    easeCubicActionInOutAction = cc.EaseCubicActionInOut:create(param.actionElement.actionName)
    assert(easeCubicActionInOutAction, "create Action failed")
    local actionElement = {actionName = easeCubicActionInOutAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end
--create a Reverse action Element ,创建一个反转 Reverse ，需要传人的action支持reverse
--@param:table
--#actionElement: {x=,y=} 控制点1位置
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createReverseAction(param)
    assert(param and param.actionElement, "param is error")
    local reverseAction = nil 
    reverseAction = param.actionElement.actionName:reverse()
    assert(reverseAction, "create Action failed")
    local actionElement = {actionName = reverseAction ,repeatNum = param.actionElement.repeatNum}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList + 1] = actionElement
    else
        return actionElement
    end
end
------------------------------------------3D特效--------------------------------------------------
--create a Shaky3D action Element ,按三次函数缓动进入并退出的动作 Action Shaky3D
--@param:table
--#dur: 持续时间
--#gridSize:网格大小
--#range:摇晃范围
--*isShakeZ:是否在X
--*actionList: table,函数添加actionElement到这个actionList末尾,为空则直接返回 actionElement
--$return: actionElement =  {actionName = ,repeatNum = }
function UIActionTool:createShaky3DAction(param)
    assert(param and param.dur and param.range,"param is error")
    local shaky3DAction = nil 
    shaky3DAction = cc.Shaky3D:create(param.dur,param.gridSize,param.range,param.isShakeZ or true)
    assert(shaky3DAction, "create Action failed")
    local actionElement = {actionName = shaky3DAction,repeatNum = param.repeatNum or 1}
    if param.actionList ~= nil  then 
        param.actionList[#param.actionList+1] = actionElement
    else
        return actionElement
    end
end

--tyj end


return UIActionTool