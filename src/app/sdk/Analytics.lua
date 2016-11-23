Analytics = {}

local analytics_plugin = nil

function Analytics:init()
	analytics_plugin = AgentManager:getInstance():getAnalyticsPlugin()
end

function Analytics:startSession()
	if analytics_plugin ~= nil then
	    analytics_plugin:startSession()
	end
end

function Analytics:stopSession()
	if analytics_plugin ~= nil then
	    analytics_plugin:stopSession()
	end
end

function Analytics:logError(errID, errMsg)
	if analytics_plugin ~= nil then
	    analytics_plugin:logError(errID, errMsg)
	end
end
--自定事件	
function Analytics:logEvent(eventID, paramMap)
	if analytics_plugin ~= nil then
		if paramMap == nil then
	    	analytics_plugin:logEvent(eventID)
	    else
	    	analytics_plugin:logEvent(eventID, paramMap)
	    end
	end
end

function Analytics:logTimedEventBegin(eventID)
	if analytics_plugin then
		analytics_plugin:logTimedEventBegin(eventID)
	end
end

function Analytics:logTimedEventEnd(eventID)
	if analytics_plugin then
		analytics_plugin:logTimedEventEnd(eventID)
	end
end

function Analytics:setAccount()
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("setAccount") then
			local paramMap = {
					Account_Id = tostring(PlayerData.eventAttr.m_uid),
					Account_Name = GameState.storeAttr.NaverUserName_s,
					Account_Type = tostring(AccountType.ANONYMOUS),
					Account_Level = tostring(PlayerData.eventAttr.m_level),
					Account_Age = "1",
					Account_Operate = tostring(AccountOperate.LOGIN),
					Account_Gender = tostring(PlayerData.eventAttr.m_sex),
					Server_Id = tostring(NetWork.serverId),
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("setAccount", data)
		end
	end
end

function Analytics:onChargeRequest(index,data)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onChargeRequest") then
			GameState.storeAttr.paymentSeq_s = PluginChannel:getOrderId()
			local paramMap = {
					Order_Id = GameState.storeAttr.paymentSeq_s,
					Product_Name = PluginChannel:getProductName(index) or "10000",
					Currency_Amount = tostring(data.money),
					Currency_Type = "CNY",
					Payment_Type = "1",
					Virtual_Currency_Amount = tostring(data.gold),
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onChargeRequest", data)
		end
	end
end

function Analytics:onChargeOnlySuccess(productInf)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onChargeOnlySuccess") then
			local paramMap = {
					Order_Id = productInf.Order_Id,
					Product_Name = productInf.Product_Name,
					Currency_Amount = productInf.Product_Name.Currency_Amount,
					Currency_Type = "CNY",
					Payment_Type = "1",
					Virtual_Currency_Amount = tostring(100),
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onChargeOnlySuccess", data)
		end
	end
end

function Analytics:onChargeSuccess()
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onChargeSuccess") then
			local data = PluginParam:create(GameState.storeAttr.paymentSeq_s)
			analytics_plugin:callFuncWithParam("onChargeSuccess", data)
		end
	end
	GameState.storeAttr.paymentSeq_s = ""
end
--充值失败时
function Analytics:onChargeFail()
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onChargeFail") then
			local paramMap = {
					Order_Id = GameState.storeAttr.paymentSeq_s,
					Fail_Reason = "default",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onChargeFail", data)
		end
	end
	GameState.storeAttr.paymentSeq_s = ""
end
--item = {3,4,2} currency:单价  消耗元宝时
function Analytics:onPurchase(item,currency)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onPurchase") then
			local paramMap = {
					Item_Id = tostring(item[1]),
					Item_Type =  tostring(item[2]),
					Item_Count = tostring(item[3]),
					Virtual_Currency = tostring(math.abs(currency)),
					Currency_Type = PluginChannel:getChannelId(),
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onPurchase", data)
		end
	end
end
--使用道具时
function Analytics:onUse(item,useReason)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onUse") then
			local paramMap = {
					Item_Id = tostring(item[1]),
					Item_Type = tostring(item[2]),
					Item_Count = tostring(item[3]),
					Use_Reason = useReason or "1",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onUse", data)
		end
	end
end
--item = {-2,4,200} useReason:用途  赠送道具时
function Analytics:onReward(item,useReason)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("onReward") then
			local paramMap = {
					Item_Id = tostring(item[1]),
					Item_Type =  tostring(item[2]),
					Item_Count = tostring(item[3]),
					Use_Reason = "1",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("onReward", data)
		end
	end
end
--开始关卡
function Analytics:startLevel(levelId, seqNum)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("startLevel") then
			local paramMap = {
					Level_Id = levelId,
					Seq_Num = seqNum or "1",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("startLevel", data)
		end
	end
end
--完成关卡
function Analytics:finishLevel(levelId)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("finishLevel") then
			local data = PluginParam:create("123456")
			analytics_plugin:callFuncWithParam("finishLevel", data)
		end
	end
end
--关卡失败
function Analytics:failLevel(levelId,reason)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("failLevel") then
			local paramMap = {
					Level_Id = levelId,
					Fail_Reason = reason or "default",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("failLevel", data)
		end
	end
end
--任务开始
function Analytics:startTask(taskId)
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("startTask") then
			local paramMap = {
					Task_Id = taskId,
					Task_Type = tostring(TaskType.OTHER),
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("startTask", data)
		end
	end
end
--任务完成
function Analytics:finishTask()
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("finishTask") then
			local data = PluginParam:create("123456")
			analytics_plugin:callFuncWithParam("finishTask", data)
		end
	end
end
--任务失败
function Analytics:failTask()
	if analytics_plugin ~= nil then
		if analytics_plugin:isFunctionSupported("failTask") then
			local paramMap = {
					Task_Id = "123456",
					Fail_Reason = "test",
				}
			local data = PluginParam:create(paramMap)
			analytics_plugin:callFuncWithParam("failTask", data)
		end
	end
end
return Analytics