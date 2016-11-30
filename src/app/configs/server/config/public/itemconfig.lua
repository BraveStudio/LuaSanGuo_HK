
--基础配置
g_ItemCommonConfig = 
{
	BagBaseSize = 250,					--包裹基础容量，最大背包数为255
	ItemOverlapMax = 9999,				--物品最大可叠加数，叠加数最大为16位无符号整数65535
}

--物品配置表
g_newFormation = {}
g_RoleCardConfig = {}
g_EquipConfig = {}
g_SkillCardConfig = {}
g_ItemConfig = {}

--其他配置表
g_SoldierConfig = {}
g_PassConfig = {}
g_XzlyPassConfig = {}
g_DebrisData = {}
--洗练相关配置
g_sophistication = {}

--图鉴表:根据相关配置表生成零时表
g_RoleBook = {}
g_RoleHandBook = {}
g_EquipHandBook = {}
g_SkillHandBook = {}
g_ItemHandBook = {}

--全角色列表
g_RoleCardList = {}	--分阵营
g_RoleCardAllList = {}	--不分阵营

--战斗配置
g_SpellConfig = {}
g_PassiveSpellConfig = {}

--宝箱配置
g_SilverBoxConfig = {}			--白银宝箱
g_GoldBoxConfig = {}			--元宝宝箱
g_RoldCardChipBoxConfig = {}	--卡牌碎片宝箱
g_MysticalBoxConfig = {}		--神秘宝箱
g_WhiteBoxConfig = {}			--白色宝箱
g_SpWhiteBoxConfig = {}			--特殊白宝箱 做新手指引用，只能开出白色武器
g_BlueBoxConfig = {}			--蓝色宝箱
g_PurPleBoxConfig = {}			--紫色宝箱	
g_OrangeBoxConfig = {}			--橙色宝箱
g_RedBoxConfig = {}				--红色宝箱
g_heroBoxConfig = {}			--英雄宝箱
g_FixBoxConfig = {}				--能开出固定英雄的宝箱
g_qhBoxConfig1 = {}             --器魂宝箱1
g_qhBoxConfig2 = {}				--器魂宝箱2
g_qhBoxConfig3 = {}				--器魂宝箱3
g_qhBoxConfig4 = {}				--器魂宝箱4
g_qhBoxConfig5 = {}				--器魂宝箱5
g_cjspBoxconfig = {}            --超时碎片宝箱
g_dwBoxconfig = {}				--帝王宝箱
g_redBag = {}               --红色锻造包
g_OrangeBag = {}            --橙色锻造包

--商店
g_ShopConfig = {}				--商店
g_ShopVip1Config = {}			--vip1段配置
g_ShopVip2Config = {}			--vip2段配置
g_shoptem1 = {}
g_shoptem2 = {}
g_shoptem3 = {}
g_ShopSix = {}					--六星神将配置
g_ShopPvpConfig = {}			--pvp商店配置
g_ShopGuildConfig = {}			--公会商店
g_gzInitshop = {}
g_gzRandomshop = {}
g_gzshop = {}


--血战英雄配置
g_npcConfig = {}				--血战npc配置
g_xzlyrewards = {}				--血战奖励配置
--英雄试炼敌人配置
g_npcHeroTrail = {}	
g_SJHeroTrail = {}				--英雄试炼神将来临NPC配置	
g_PTHeroTrail = {}				--英雄试炼普通通关卡牌配置		


--活动限时神将
g_XssjConfig = {}

--主角升级奖励
g_heroLvUpReward = {}
--配置相关的工具函数
g_soldiersStreng = {}
--服务器语言文字表
g_serverLanguage = {}
--韩文非法字符
g_KoreanIllegalityChar = {}
g_KoreanIllegalityCharNoSpalce = {}
--中文非法字符
g_IllegalityChar_ch = {}
g_IllegalityCharNoSpalce_ch = {}
--错误代码
g_errorCode = {}
--公会战相关
g_bigCity = {}
g_bigTemCity = {}
g_smallCity = {}
g_gvgNpc = {}
--攻城掠地相关
g_gcldInfo = {}
g_gcldNpc = {}
--国战配置
g_gznpc = {}
g_gzidhehe = {}
--将魂
g_jhconfig = {}
--英雄之旅
g_heroTravelconfig = {}
--成就
g_cjconfig = {}
--活跃达人配置
g_hydrconfig = {}
--姓名
g_randomName = {}



local function ReadNewFormation()
	local title = {
		{'id', tonumber},				-- 序号
		{'name', tostring},				-- 名称
	}
	local count = 0
	LoadConfig('data/formation.txt', title,
		function (row)
			count = count + 1
			g_newFormation[row.id] = row
		end)
end

local function ReadRoleCardConfig()
	local relation = {}
	local relationTitle = {
		{'id', tonumber},				-- 序号
		{'relatedID1', tonumber},		-- 缘分武将1ID
		{'name1', tostring},			-- 缘分名字1
		{'effectName1', tostring},		-- 缘分效果描述1
		{'relatedID2', tonumber},		-- 缘分武将2ID
		{'name2', tostring},			-- 缘分名字2ID
		{'effectName2', tostring},		-- 缘分效果描述2
		{'type1', tonumber},			-- 缘分1效果类型 ( 1:生命, 2:攻击, 3:法术, 4:法防)
		{'value1', tonumber},			-- 缘分1效果值  ( 百分比，小数表示)
		{'type2', tonumber},			-- 缘分2效果类型
		{'value2', tonumber},			-- 缘分2效果值
	}

	LoadConfig('data/relation.txt', relationTitle,
		function (row)
			relation[row.id] = row
			-- row.name1 = nil
			-- row.effectName1 = nil
			-- row.name2 = nil
			-- row.effectName2 = nil
		end)

	local classAttrs = {}
	local classTableTitle = {
		{'id', tonumber},               --序号
		{'class', tonumber},			--阶级
		{'disName', tostring},			--显示名称
		{'spellId', tostring},			--主动技能ID
		{'passiveSpellId1', tonumber},	--被动技能1ID
		{'passiveSpellId2', tonumber},	--被动技能2ID
		{'passiveSpellId3', tonumber},	--被动技能3ID
		{'passiveSpellId4', tonumber},	--被动技能4ID
		{'passiveSpellId5', tonumber},	--被动技能5ID
		{'passiveSpellId6', tonumber},	--被动技能6ID
        {'passiveSpellId7', tonumber},  --被动技能7ID
        {'passiveSpellId8', tonumber},  --被动技能8ID
        {'passiveSpellId9', tonumber},  --被动技能9ID
        
	}
	LoadConfig('data/heroclass.txt', classTableTitle,
		function (row)
			local spellHandler = function(row)
				row.mSpellId = string.split(row.spellId, ",")
				for k, v in pairs(row.mSpellId) do
				   row.mSpellId[k] = tonumber(v)
				end
				row.spellId = nil

				return row
			end

			if classAttrs[row.id] and type(classAttrs[row.id]) == "table" then
				if not classAttrs[row.id][row.class] then
					classAttrs[row.id][row.class] = spellHandler(row)
				else
					AddLog("Load heroClass error " .. row.disName .. " line")
					return
				end
			else
				classAttrs[row.id] = {}
				classAttrs[row.id][row.class] = spellHandler(row)
			end
		end)


	local title = {
		{'id', tonumber},				-- 序号
		{'name', tostring},				-- 姓名
		{'wuli', tonumber},				-- 武力
		{'zhili', tonumber},			-- 智力
		{'tongyu', tonumber},			-- 统御
		{'attackSpeed', tonumber},		-- 攻击速度
		{'movedSpeed', tonumber},		-- 移动速度
		{'attackDistance', tonumber},	-- 攻击距离
		{'attackView', tonumber},		-- 攻击范围
		{'imgID', tostring},			-- 资源id
		{'volume', tonumber},			-- 体积
		{'effectRes', tostring}, 		-- 技能特效资源
		{'effectScale', tonumber}, 		-- 特效缩放比例
		{'quality', tonumber},			-- 品质
		{'camp', tonumber},				-- 阵营ID
		{'ctype', tonumber},			-- 类型
		{'describe', tostring},			-- 描述
		{'formationId', tostring},		-- 阵型id
		{'formation', tostring},		-- 阵型
		{'destiny', tonumber},			-- 缘分id
		{'sell', tonumber},				-- 分解获得
		{'heroHead', tostring},		    -- 头像【服务器不需要】
		{'heroCard', tostring},		    -- 卡【服务器不需要】
		{'heroCard1', tostring},   		-- 卡牌1
		{'heroCard2', tostring},   		-- 卡牌2
		{'heroCard3', tostring},   		-- 卡牌3
		{'heroCard4', tostring},   		-- 卡牌4
		{'heroCard5', tostring},   		-- 卡牌5
		{'heroCard6', tostring},   		-- 卡牌6
		{'heroCard7', tostring},   		-- 卡牌7
		{'heroCard8', tostring},   		-- 卡牌8
		{'heroCard9', tostring},   		-- 卡牌9
		{'heroCard10', tostring},   	-- 卡牌10
		{'dialogueHead', tostring},     -- 战场对话头像
		{'heroSound', tostring},		-- 声效【服务器不需要】
		{'pjAddEx', tonumber}           --偏将加成
	}

	local count = 0
	LoadConfig('data/hero.txt', title,
		function (row)
			count = count + 1
			row.relation = relation[row.destiny]
			row.destiny = nil
            
            if classAttrs[row.id] then
                row.classAttrs = classAttrs[row.id]
            else
                AddLog("Load hero table is error, hero id:" .. row.id)
                return
            end
			
            -- if row.formation ~= "0"  then
    			-- local ss = string.find(row.formation,"/")
    			-- local ee = string.find(row.formation,".tmx")
    			-- local ff = string.sub(row.formation,ss+1,ee-1)
    			-- row.formation = ff
				-- row.formation = g_newFormation[tonumber(row.formationId)].name
    		-- else
-- --                print(row.id .. "hero not formation ")
    		-- end
			row.formation = g_newFormation[tonumber(row.formationId)].name

			if #row.effectRes == 0 then
				row.effectRes = nil
			end
			
			g_RoleCardConfig[row.id] = row
			--if row.id <=5000 then	--ID限制全为主角卡
			--	g_RoleHandBook[row.id] = count
			--end
		end)
	AddLog("Load RoleCard Count: " .. tostring(count))
	--table.show(g_RoleCardConfig)
end


local function ReadSoldierConfig()
	local title = {
		{'id', tonumber},				-- 序号
		{'name', tostring},				-- 姓名
		{'stype', tonumber},			-- 类型
		{'origAttack', tonumber},		-- 初始攻击
		{'origHP', tonumber},			-- 初始生命
		{'origFas', tonumber},          -- 初始法术
		{'origFaf', tonumber},          -- 初始法防
		{'growAttack', tonumber},       -- 攻击成长
		{'growHp', tonumber},           -- 生命成长
		{'growFas', tonumber},          -- 法术成长
		{'growFaf', tonumber},          -- 法防成长
		{'attackSpeed', tonumber},		-- 攻击速度
		{'movedSpeed', tonumber},		-- 移动速度
		{'attackView', tonumber},		-- 攻击距离
		{'skillID', tonumber},			-- 技能ID
		{'View', tonumber},				-- 视野
		{'volume', tonumber},			-- 体积
		{'priority1', tonumber},		-- 优先兵种1
		{'select', tonumber},			-- 选取规则
		{'path', tonumber},				-- 寻路规则
		{'restrainType', tonumber},		-- 兵种克制
		{'restrainDes', tostring},		-- 兵种克制描述
		{'restrainVal', tonumber},		-- 克制数值
		{'makeMoney', tonumber},		-- 生产消耗铜钱
		{'upgradePay', tonumber},		-- 升级消耗武魂
		{'imgID', tostring},			-- 资源ID
		{'class', tonumber},			-- 阶数
		{'classto', tonumber},			-- 升阶指向ID
		{'itemID1', tonumber},			-- 升阶道具1ID
		{'itemNum1', tonumber},			-- 升阶道具1数量
		{'itemID2', tonumber},			-- 升阶道具2ID
		{'itemNum2', tonumber},			-- 升阶道具2数量
		{'itemID3', tonumber},			-- 升阶道具3ID
		{'itemNum3', tonumber},			-- 升阶道具3数量
		{'itemID4', tonumber},			-- 升阶道具4ID
		{'itemNum4', tonumber},			-- 升阶道具4数量
		{'modelID', tonumber},			-- 模型id
		{'head', tostring},		-- 头像
		{'card', tostring},		-- 卡片
		{'heroSoul', tostring},		-- 亲和将魂
	}

	local count = 0
	LoadConfig('data/soldierconfig.txt', title,
		function (row)
			count = count + 1
			row.item = {}
			if row.itemNum1 > 0 then
				table.insert(row.item,{row.itemID1,4,row.itemNum1,})
			end
			if row.itemNum2 > 0 then
				table.insert(row.item,{row.itemID2,4,row.itemNum2,})
			end
			if row.itemNum3 > 0 then
				table.insert(row.item,{row.itemID3,4,row.itemNum3,})
			end
			if row.itemNum4 > 0 then
				table.insert(row.item,{row.itemID4,4,row.itemNum4,})
			end
			row.itemNum1 = nil
			row.itemNum2 = nil
			row.itemNum3 = nil
			row.itemNum4 = nil
			row.itemID1 = nil
			row.itemID2 = nil
			row.itemID3 = nil
			row.itemID4 = nil
			if table.empty(row.item) then
				row.item = nil
			end
			g_SoldierConfig[row.id] = row
		end)
	AddLog("Load soldier Count: " .. tostring(count))
	--table.show(g_SoldierConfig)
end

local function ReadEquipConfig ()
	local title1 = {  -- 装备配置表
		{'id', tonumber},					--序号
		{'name', tostring},                 --名字
		{'ctype', tonumber}, 				--类型
		{'quality', tonumber},				--品质
		{'attrType', tonumber},             --属性类型
		{'attrValue', tonumber},            --属性值
		{'randomAttr1', tonumber},          --随机属性概率1
		{'randomAttr2', tonumber},          --随机属性概率2
		{'randomAttr3', tonumber},          --随机属性概率3
		{'randomAttr4', tonumber},          --随机属性概率4
		{'randomAttr5', tonumber},			--随机属性概率5
		{'randomAttr6', tonumber},			--随机属性概率6
		{'sellPrice', tonumber},			--价格
		{'imgID', tostring},				--资源
		{'describe', tostring},				--描述
		{'strEngMater',tostring},			--强化材料
		{'strEngToId',tonumber},			--强化id
		{'strEngProb',tonumber},			--强化概率
		{'CompoundMater',tostring},			--合成材料
		{'CompoundId',tonumber},			--合成id
		{'refreshAttr',tostring},			--洗练材料
	}
	
	local count = 0
	LoadConfig('data/equipconfig.txt', title1,
		function (row)
			count = count + 1
			g_EquipConfig[row.id] = row
		end)
	-- AddLog('Load EquipCard Count: '..tostring(count))
end

----洗练
local function ReadSophistication ()
	local title1 = {  -- 洗练配置表
		{'id', tonumber},					--序号
		{'name', tostring},                 --名字
		{'ctype', tonumber}, 				--类型
		{'quality', tonumber},				--品质
		{'attrType',tonumber},				--属性
		{'attrValue',tonumber},				--属性值
		{'randomAttr1', tonumber},          --随机属性概率1
		{'randomAttr2', tonumber},          --随机属性概率2
		{'randomAttr3', tonumber},          --随机属性概率3
		{'randomAttr4', tonumber},          --随机属性概率4
		{'randomAttr5', tonumber},			--随机属性概率5
		{'randomAttr6', tonumber},			--随机属性概率6
		{'randomAttr7', tonumber},			--随机属性概率5
		{'randomAttr8', tonumber},			--随机属性概率6
	}
	
	local count = 0
	LoadConfig('data/sophistication.txt', title1,
		function (row)
			count = count + 1
			g_sophistication[row.id] = row
		end)
	-- AddLog('Load EquipCard Count: '..tostring(count))
end

local function ReadItemConfig ()
	local title = {
		{'id', tonumber},				--序号
		{'quality', tonumber},			--品质
		{'name', tostring},				--名称
		{'script', tonumber},			--使用脚本
		{'type', tonumber},             --道具类型
		{'describe', tostring},			--道具描述
		{'imgID', tostring},			--icon图片id
		{'limitIdx', tonumber},			--使用限制索引
		{'limitCount', tonumber},		--每日使用次数
		{'limitLevel', tonumber},		--使用等级限制
		{'gkid', tostring},				--关卡ID1
		{'gkid2', tonumber},			--关卡ID2
		{'gkid3', tonumber},			--关卡ID3
		{'gkid4', tonumber},			--关卡ID4
		{'drop', tostring},				--描述1
		{'sellType', tonumber},		     --类型
		{'price',tonumber},			--卖出价格
	}
	--[=[
	local file = io.open('data/itemconfig.txt', 'r')
	if file == nil then
		file = io.open('script/data/itemconfig.txt', 'r')
		if file == nil then
			AddLog("can't find data/itemconfig.txt" )
			return
		end
	end
	file:read()  -- 第一行丢弃
	local count = 0
	for line in file:lines() do
		count = count + 1
		local cells = string.split(line, '\t')
		local temp = {}
		for k, v in ipairs(title) do
			temp[v[1]] = v[2](cells[k])
		end
		g_ItemConfig[temp.id] = temp
		g_ItemHandBook[temp.id] = count
	end
	file:close()
	--]=]
	local count = 0
	LoadConfig('data/itemconfig.txt',title,
		function(row)

			local strs = string.split(row.gkid, ",")
			row.gkid = strs

			g_ItemConfig[row.id] = row
			count = count + 1
			g_ItemHandBook[row.id] = count
		end
		)
	
	-- AddLog("Load Item Count: " .. tostring(count))
end



local function ReadPassConfig ()
	local title = {
		--{'id', tonumber},					--大关卡号
		--{'pdes', tostring},				--大关卡描述
		--{'ptitle', tostring},				--大关卡标题
		{'pid', tonumber},					--小关卡号
		{'title', tostring},				--小关卡标题
		{'des', tostring},					--小关卡对话1
		{'dailyCountMax', tonumber},		--每日最多攻打次数
		{'pass', tostring},					--前置完成关卡
		{'levelLimit', tostring},			--等级限制
		{'energy', tonumber},				--每次扣除体力
		{'soul', tonumber},					--武魂
		{'money', tonumber},				--铜钱奖励
		{'cdailyLimit', tonumber},			--未过回复次数
		{'item', tostring},					--奖励道具
		{'map', tostring},		      		--士兵分布图
		{'mainId',tonumber},				--主将ID
		{'mainLevel', tonumber},			--主将等级
		{'mianClass', tonumber}, 			--主将阶级
		{'lieutenantId1',tonumber},			--副将1ID
		{'lieutenantLevel1', tonumber},		--副将1等级
		{'lieutenantClass1', tonumber}, 	--副将1阶级
		{'lieutenantId2', tonumber},		--副将2ID
		{'lieutenantLevel2', tonumber},		--副将2等级
		{'lieutenantClass2', tonumber}, 	--副将2阶级
		{'soldierId1',tonumber},			--士兵1ID
		{'soldierLevel1', tonumber},		--士兵1等级
		{'soldierId2',tonumber},			--士兵2ID
		{'soldierLevel2', tonumber},		--士兵2等级
		{'soldierId3',tonumber},			--士兵3ID
		{'soldierLevel3', tonumber},		--士兵3等级
		{'soldierNumLevel', tonumber},      --士兵数量等级
		{'buff', tonumber},					--特殊增益比例
		{'eliteBuff', tonumber},			--精英副本增益比例
		{'reback', tonumber},				--未过返还体力
		{'exp', tonumber},					--exp
		{'guilditem', tostring},			--guilditem
	}
	--[=[
	local file = io.open('data/passconfig.txt', 'r')
	if file == nil then
		file = io.open('script/data/passconfig.txt', 'r')
		if file == nil then
			AddLog("can't find data/passconfig.txt" )
			return
		end
	end
	file:read()  -- 第一行丢弃
	
	
	local count = 0
	local passid = 0
	for line in file:lines() do
		count = count + 1
		local cells = string.split(line, '\t')
		local temp = {}
		for k, v in ipairs(title) do
			temp[v[1]] = v[2](cells[k])
		end
		if count%10==1 then
			passid = passid + 1
		end
		temp.id = passid
		if g_PassConfig[temp.id] == nil then
			g_PassConfig[temp.id] = {}
			--g_PassConfig[temp.id].ptitle = temp.ptitle
			--g_PassConfig[temp.id].pdes = temp.pdes
			g_PassConfig[temp.id].ppass = {}
		end
		temp.pid = temp.pid - (passid-1)*10
		
		--处理血战洛阳
		if temp.pid==5 or temp.pid==10 then
			table.insert(g_XzlyPassConfig,{temp.id,temp.pid})
		end
		
		g_PassConfig[temp.id].ppass[temp.pid] = {}
		g_PassConfig[temp.id].ppass[temp.pid].title = temp.title
		g_PassConfig[temp.id].ppass[temp.pid].des = temp.des
		g_PassConfig[temp.id].ppass[temp.pid].dailyCountMax = temp.dailyCountMax
		
		g_PassConfig[temp.id].ppass[temp.pid].condition = {}
		g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {}
		if string.len(temp.pass)>0 then
			local pass = string.split(temp.pass, ',')
			if tonumber(pass[2]) then
				g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {tonumber(pass[1]),tonumber(pass[2])}
			else
				g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {}
			end
		end
		local levelLimit = string.split(temp.levelLimit,',')
		g_PassConfig[temp.id].ppass[temp.pid].condition.levelLimit = {tonumber(levelLimit[1]), tonumber(levelLimit[2])}
		
		g_PassConfig[temp.id].ppass[temp.pid].consume = {}
		g_PassConfig[temp.id].ppass[temp.pid].consume.dailyLimit = 1
		g_PassConfig[temp.id].ppass[temp.pid].consume.energy = temp.energy
		
		g_PassConfig[temp.id].ppass[temp.pid].compensate = {}
		g_PassConfig[temp.id].ppass[temp.pid].compensate.dailyLimit = 1
		g_PassConfig[temp.id].ppass[temp.pid].compensate.energy = temp.energy
		g_PassConfig[temp.id].ppass[temp.pid].compensate.item = {}
		
		g_PassConfig[temp.id].ppass[temp.pid].reward = {}
		g_PassConfig[temp.id].ppass[temp.pid].reward.exps = temp.exp
		g_PassConfig[temp.id].ppass[temp.pid].reward.money = temp.money
		g_PassConfig[temp.id].ppass[temp.pid].reward.soul = temp.soul
		g_PassConfig[temp.id].ppass[temp.pid].reward.item = {}
		if string.len(temp.item)>0 then
			local item = string.split(temp.item, ',')
			local cfglen = 5
			local icount = #item/cfglen
			for k=1,icount do
				g_PassConfig[temp.id].ppass[temp.pid].reward.item[k] = {tonumber(item[(k-1)*cfglen+1]),tonumber(item[(k-1)*cfglen+2]),tonumber(item[(k-1)*cfglen+3]),tonumber(item[(k-1)*cfglen+4]),tonumber(item[(k-1)*cfglen+5]),}
			end
			--table.show(g_PassConfig[temp.id].ppass[temp.pid].reward.item)
		end
		g_PassConfig[temp.id].ppass[temp.pid].monster = temp.map
		
	end
	file:close()
	--]=]
	
	local count = 0
	local passid = 0
	LoadConfig('data/passconfig.txt',title,
		function(row)
			count = count + 1
			local cells = string.split(line, '\t')
			local temp = row
			if count%10==1 then
				passid = passid + 1
			end
			temp.id = passid
			if g_PassConfig[temp.id] == nil then
				g_PassConfig[temp.id] = {}
				--g_PassConfig[temp.id].ptitle = temp.ptitle
				--g_PassConfig[temp.id].pdes = temp.pdes
				g_PassConfig[temp.id].ppass = {}
			end
			temp.pid = temp.pid - (passid-1)*10
			
			--处理血战洛阳
			if temp.pid==5 or temp.pid==10 then
				table.insert(g_XzlyPassConfig,{temp.id,temp.pid})
			end
			
			g_PassConfig[temp.id].ppass[temp.pid] = {}
			g_PassConfig[temp.id].ppass[temp.pid].title = temp.title
			g_PassConfig[temp.id].ppass[temp.pid].des = temp.des
			g_PassConfig[temp.id].ppass[temp.pid].dailyCountMax = temp.dailyCountMax
			g_PassConfig[temp.id].ppass[temp.pid].dailyCountElite = g_pveEliteLimit
			
			
			g_PassConfig[temp.id].ppass[temp.pid].condition = {}
			g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {}
			if string.len(temp.pass)>0 then
				local pass = string.split(temp.pass, ',')
				if tonumber(pass[2]) then
					g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {tonumber(pass[1]),tonumber(pass[2])}
				else
					g_PassConfig[temp.id].ppass[temp.pid].condition.pass = {}
				end
			end
			local levelLimit = string.split(temp.levelLimit,',')
			g_PassConfig[temp.id].ppass[temp.pid].condition.levelLimit = {tonumber(levelLimit[1]), tonumber(levelLimit[2])}
			
			g_PassConfig[temp.id].ppass[temp.pid].consume = {}
			g_PassConfig[temp.id].ppass[temp.pid].consume.dailyLimit = 1
			g_PassConfig[temp.id].ppass[temp.pid].consume.energy = temp.energy
			
			g_PassConfig[temp.id].ppass[temp.pid].compensate = {}
			g_PassConfig[temp.id].ppass[temp.pid].compensate.dailyLimit = 1
			g_PassConfig[temp.id].ppass[temp.pid].compensate.energy = temp.energy
			g_PassConfig[temp.id].ppass[temp.pid].compensate.item = {}
			
			g_PassConfig[temp.id].ppass[temp.pid].reward = {}
			g_PassConfig[temp.id].ppass[temp.pid].reward.exps = temp.exp
			g_PassConfig[temp.id].ppass[temp.pid].reward.money = temp.money
			g_PassConfig[temp.id].ppass[temp.pid].reward.soul = temp.soul
			g_PassConfig[temp.id].ppass[temp.pid].reward.item = {}
			
			--武将属性
			g_PassConfig[temp.id].ppass[temp.pid].mainID = temp.mainId
			g_PassConfig[temp.id].ppass[temp.pid].mainLevel = temp.mainLevel
			g_PassConfig[temp.id].ppass[temp.pid].mianClass = temp.mianClass
			
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantId1 = temp.lieutenantId1
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantLevel1 = temp.lieutenantLevel1
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantClass1 = temp.lieutenantClass1
			
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantId2 = temp.lieutenantId2
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantLevel2 = temp.lieutenantLevel2
			g_PassConfig[temp.id].ppass[temp.pid].lieutenantClass2 = temp.lieutenantClass2
			
			if string.len(temp.item)>0 then
				local item = string.split(temp.item, ',')
				local cfglen = 5
				local icount = #item/cfglen
				for k=1,icount do
					g_PassConfig[temp.id].ppass[temp.pid].reward.item[k] = {tonumber(item[(k-1)*cfglen+1]),tonumber(item[(k-1)*cfglen+2]),tonumber(item[(k-1)*cfglen+3]),tonumber(item[(k-1)*cfglen+4]),tonumber(item[(k-1)*cfglen+5]),}
				end
				--table.show(g_PassConfig[temp.id].ppass[temp.pid].reward.item)
			end
			
			g_PassConfig[temp.id].ppass[temp.pid].guilditem = {}
			if string.len(temp.guilditem)>1 then
				local item = string.split(temp.guilditem, ',')
				local cfglen = 4
				local icount = #item/cfglen
				for k=1,icount do
					g_PassConfig[temp.id].ppass[temp.pid].guilditem[k] = {tonumber(item[(k-1)*cfglen+1]),tonumber(item[(k-1)*cfglen+2]),tonumber(item[(k-1)*cfglen+3]),tonumber(item[(k-1)*cfglen+4]),}
				end
			end
			
			g_PassConfig[temp.id].ppass[temp.pid].monster = temp.map
		end
		)
		
	-- AddLog("Load g_PassConfig Count: " .. tostring(count))
	--table.show(g_XzlyPassConfig)
end

local function ReadRoleCardList()
	local title = {
		{'group', tonumber},		--品质
		{'id', tonumber},			--武将ID
		{'prob', tonumber},			--概率
	}
	local count = 0
	LoadConfig('data/rolecardlist.txt',title,
		function(row)
			count = count + 1
			local temp = row
			--[[
			if g_RoleCardList[temp.group] == nil then
				g_RoleCardList[temp.group] = {}
			end
			if g_RoleCardList[temp.group][temp.camp] == nil then
				g_RoleCardList[temp.group][temp.camp] = {}
			end
		
			table.insert(g_RoleCardList[temp.group][temp.camp],temp.id)
			--]]
			if g_RoleCardAllList[temp.group] == nil then
				g_RoleCardAllList[temp.group] = {}
			end
			table.insert(g_RoleCardAllList[temp.group],{temp.id,temp.prob})
			--g_RoleHandBook[temp.id] = count
			
		end
		)
	--[=[
	local file = io.open('data/rolecardlist.txt', 'r')
	if file == nil then
		file = io.open('script/data/rolecardlist.txt', 'r')
		if file == nil then
			AddLog("can't find data/rolecardlist.txt" )
			return
		end
	end
	file:read()  -- 第一行丢弃

	l
	local count = 0
	for line in file:lines() do
		count = count + 1
		local cells = string.split(line, '\t')
		local temp = {}
		for k, v in ipairs(title) do
			temp[v[1]] = v[2](cells[k])
		end
		if g_RoleCardList[temp.group] == nil then
			g_RoleCardList[temp.group] = {}
		end
		if g_RoleCardList[temp.group][temp.camp] == nil then
			g_RoleCardList[temp.group][temp.camp] = {}
		end
		table.insert(g_RoleCardList[temp.group][temp.camp],temp.id)
		if g_RoleCardAllList[temp.group] == nil then
			g_RoleCardAllList[temp.group] = {}
		end
		table.insert(g_RoleCardAllList[temp.group],temp.id)
		g_RoleHandBook[temp.id] = count
	end
	file:close()
	--]=]
	-- AddLog("Load rolecardlist Count: " .. tostring(count))
end

local ReadPassiveSpellConfig = function()
	local title = {
		{'id', tonumber},				-- 序号
		{'name', tostring},				-- 姓名
		{'describe', tostring},			-- 描述
		{'hpPercent', tonumber},	    -- 生命加成
		{'attackPercent', tonumber},    -- 攻击加成
		{'fasPercent', tonumber},       -- 法术加成
		{'fafPercent', tonumber},       -- 法防加成
		{'range', tonumber},		    -- 技能范围
		{'pos', tonumber},         -- 技能基准点
		{'skillFrdly', tonumber},       -- 阵营选择
	 	{'skillCond', tonumber},		-- 值条件(条件)
	 	{'skillPCond', tonumber},    -- 百分比条件(条件)
	 	{'skillProb', tonumber},         -- 几率(条件)
	 	{'skillVal', tonumber},           -- 值(条件)
	 	{'skillval_pct', tonumber},       -- 百分比(条件)
	 	{'delay', tonumber},           -- 延迟时间
		{'interval', tonumber},           -- 间隔时间
		{'totalTime', tonumber},            -- 总时间
		{'effect', tonumber},           -- 效果选择
		{'spc', tonumber},           -- 作用属性
		{'state', tonumber},           -- 效果状态
		{'effectVal_pct', tonumber},            -- 百分比
		{'baseDamage', tonumber},           -- 基础伤害
		{'damageType', tonumber},        -- 技能伤害类型   
		{'delayType', tonumber},           -- 延时类型
		{'triggerPoint', tonumber},       -- 触发点
		{'triggerValue', tonumber},       -- 触发值
		{'skillAnima',tostring},          -- 技能片动画
		{'buffName', tostring},           -- 效果描述
		{'soundName', tostring},          -- 技能声音
		{'param1', tonumber},             -- 参数1
		{'param2', tonumber},             -- 参数2
		{'param3', tonumber},             -- 参数3
		{'param4', tonumber},             -- 参数4
	}

	local count = 0
	LoadConfig('data/passivespell.txt', title,
		function (row)
			count = count + 1
			g_PassiveSpellConfig[row.id] = row
		end)
	-- AddLog("Load passiveSpell Count: " .. tostring(count))
	--table.show(g_SoldierConfig)
end

--白银宝箱
local ReadSilverBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},					-- 概率
	}

	local count = 0
	LoadConfig('data/silverboxconfig.txt', title,
		function (row)
			count = count + 1
			g_SilverBoxConfig[count] = row
		end)
	-- AddLog("Load SilverBox Count: " .. tostring(count))
end



--元宝宝箱
local ReadGoldBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/goldboxconfig.txt', title,
		function (row)
			count = count + 1
			g_GoldBoxConfig[count] = row
		end)
	-- AddLog("Load GoldBox Count: " .. tostring(count))
end

--卡牌碎片宝箱
local ReadRoldCardChipBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/roldcardchipboxconfig.txt', title,
		function (row)
			count = count + 1
			g_RoldCardChipBoxConfig[count] = row
		end)
	-- AddLog("Load roldcardchipbox Count: " .. tostring(count))
end

--神秘宝箱
local ReadMysticalBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/mysticalboxconfig.txt', title,
		function (row)
			count = count + 1
			g_MysticalBoxConfig[count] = row
		end)
	-- AddLog("Load mysticalbox Count: " .. tostring(count))
end

--白色宝箱
local ReadWhiteBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/whiteboxconfig.txt', title,
		function (row)
			count = count + 1
			g_WhiteBoxConfig[count] = row
		end)
	-- AddLog("Load WhiteBox Count: " .. tostring(count))
end

--特殊白宝箱 新手任务用
local ReadSpWhiteBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},			-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},					-- 概率
	}

	local count = 0
	LoadConfig('data/spwhiteboxconfig.txt', title,
		function (row)
			count = count + 1
			g_SpWhiteBoxConfig[count] = row
		end)
	-- AddLog("Load SpWhiteBox Count: " .. tostring(count))
end

--蓝色宝箱
local ReadBlueBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/blueboxconfig.txt', title,
		function (row)
			count = count + 1
			g_BlueBoxConfig[count] = row
		end)
	-- AddLog("Load BlueBox Count: " .. tostring(count))
end

--紫色宝箱
local ReadPurPleBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/PurPleboxconfig.txt', title,
		function (row)
			count = count + 1
			g_PurPleBoxConfig[count] = row
		end)
	-- AddLog("Load PurPleBox Count: " .. tostring(count))
end

--橙色宝箱
local ReadOrangeBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/orangeboxconfig.txt', title,
		function (row)
			count = count + 1
			g_OrangeBoxConfig[count] = row
		end)
	-- AddLog("Load PurPleBox Count: " .. tostring(count))
end

--红色宝箱
local ReadRedBoxConfig = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/redboxconfig.txt', title,
		function (row)
			count = count + 1
			g_RedBoxConfig[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--卡牌宝箱
local ReadheroBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				-- 概率
	}

	local count = 0
	LoadConfig('data/heroBoxconfig.txt', title,
		function (row)
			count = count + 1
			g_heroBoxConfig[count] = row
		end)
	-- AddLog("Load PurPleBox Count: " .. tostring(count))
end
--开出固定东西的宝箱
local ReadFixBoxConfig = function()
	local title = {
		{'itemId',tonumber},				-- 对应的道具id
		{'items',tostring},				-- 类型
	}

	local count = 0
	LoadConfig('data/FixedBoxcfg.txt', title,
		function (row)
			count = count + 1
			local tem = row
			g_FixBoxConfig[tem.itemId] = tem.items
		end)
end

--超级碎片宝箱
local ReadCJSPBoxConfig = function()
	local title = {
		{'id', tonumber},				-- 道具id
		{'goodtype', tonumber},		    -- 类型
		{'num', tonumber},				-- 数量
		{4,tonumber},				    -- 概率
	}
	local count = 0
	LoadConfig('data/cjspbox.txt', title,
		function (row)
			count = count + 1
			g_cjspBoxconfig[count] = row
		end)
end

--魂器1
local ReadHQBoxConfig1 = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/qihun1.txt', title,
		function (row)
			count = count + 1
			g_qhBoxConfig1[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--魂器2
local ReadHQBoxConfig2 = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/qihun2.txt', title,
		function (row)
			count = count + 1
			g_qhBoxConfig2[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--魂器3
local ReadHQBoxConfig3 = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/qihun3.txt', title,
		function (row)
			count = count + 1
			g_qhBoxConfig3[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--魂器4
local ReadHQBoxConfig4 = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/qihun4.txt', title,
		function (row)
			count = count + 1
			g_qhBoxConfig4[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--魂器5
local ReadHQBoxConfig5 = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/qihun5.txt', title,
		function (row)
			count = count + 1
			g_qhBoxConfig5[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end

--帝王宝箱
local ReadDWBoxConfig = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/diwbox.txt', title,
		function (row)
			count = count + 1
			g_dwBoxconfig[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end
--红色锻造包
local ReadRedBagConfig = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/cailiaobox1.txt', title,
		function (row)
			count = count + 1
			g_redBag[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end
--橙色锻造包
local ReadOrangeBagConfig = function()
	local title = {
		{'id', tonumber},					-- 道具id
		{'goodtype', tonumber},				-- 类型
		{'num', tonumber},					-- 数量
		{4,tonumber},						-- 概率
	}

	local count = 0
	LoadConfig('data/cailiaobox2.txt', title,
		function (row)
			count = count + 1
			g_OrangeBag[count] = row
		end)
	-- AddLog("Load RedBox Count: " .. tostring(count))
end
--普通商店配置
local ReadShopConfig = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},			-- 类型
		{'goodnum', tonumber},				-- 数量
		{4,tonumber},					-- 概率
		{'pricetype',tonumber},			-- 货币类型
		{'price',tonumber},				-- 价格
	}

	local count = 0
	LoadConfig('data/shop.txt', title,
		function (row)
			count = count + 1
			g_ShopConfig[count] = row
			g_shoptem1[count] = row
		end)
	g_shopLen = count
	-- AddLog("Load Shop Count: " .. tostring(count))
	
end
--vip1段配置
local ReadShopVip1Config = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},			-- 类型
		{'goodnum', tonumber},				-- 数量
		{4,tonumber},					-- 概率
		{'pricetype',tonumber},			-- 货币类型
		{'price',tonumber},				-- 价格
	}

	local count = 0
	LoadConfig('data/shopvip1.txt', title,
		function (row)
			count = count + 1
			g_ShopVip1Config[count] = row
			g_shoptem2[count] = row
		end)
	g_shopVip1Len = count
	-- AddLog("Load Shop Count: " .. tostring(count))
	
end
--vip2段配置
local ReadShopVip2Config = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},			-- 类型
		{'goodnum', tonumber},				-- 数量
		{4,tonumber},					-- 概率
		{'pricetype',tonumber},			-- 货币类型
		{'price',tonumber},				-- 价格
	}

	local count = 0
	LoadConfig('data/shopvip2.txt', title,
		function (row)
			count = count + 1
			g_ShopVip2Config[count] = row
			g_shoptem3[count] = row
		end)
	g_shopVip2Len = count
	-- AddLog("Load Shop Count: " .. tostring(count))
	
end
--商店贩卖六星神将总配置
local ReadShopSixConfig = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},			-- 类型
		{'goodnum', tonumber},				-- 数量
		{4,tonumber},					-- 概率
		{'pricetype',tonumber},			-- 货币类型
		{'price',tonumber},				-- 价格
	}

	local count = 0
	LoadConfig('data/shopsix.txt', title,
		function (row)
			count = count + 1
			g_ShopSix[count] = row
		end)
	-- AddLog("Load Shop Count: " .. tostring(count))
end

local ReadShopPvpConfig = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},				-- 类型
		{'goodnum', tonumber},				-- 数量
		{'price',tonumber},					-- 价格
	}

	local count = 0
	LoadConfig('data/shoppvp.txt', title,
		function (row)
			count = count + 1
			g_ShopPvpConfig[count] = row
		end)
	-- AddLog("Load ShopPvp Count: " .. tostring(count))
end

local ReadShopGuildConfig = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},				-- 类型
		{'goodnum', tonumber},				-- 数量
		{'price',tonumber},					-- 价格
		{'needlevel',tonumber},				-- 所需等级
		{'flag',tonumber},					-- 唯一标识
	}

	local count = 0
	LoadConfig('data/shopguild.txt', title,
		function (row)
			count = count + 1
			local temp = row
			g_ShopGuildConfig[temp.flag] = row
		end)
	-- AddLog("Load ShopPvp Count: " .. tostring(count))
end
--国战商店
local ReadShopGZConfig = function()
	local title = {
		{'goodid', tonumber},				-- 物品id
		{'goodtype', tonumber},				-- 类型
		{'goodnum', tonumber},				-- 数量
		{'price',tonumber},					-- 价格
		{'gettype',tonumber},				-- 获得类型
	}

	local initcount = 0
	local randomcount = 0
	local allcount = 0
	LoadConfig('data/shopgz.txt', title,
		function (row)
			local temp = row
			if temp.gettype == 0 then
				initcount = initcount + 1
				g_gzInitshop[initcount] = temp
			else
				randomcount = randomcount + 1
				g_gzRandomshop[randomcount] = temp
			end
			allcount = allcount + 1
			g_gzshop[allcount] = temp
		end)
	-- AddLog("Load ShopPvp Count: " .. tostring(count))
end


local ReadXssjconfig = function()
		local title = {
		{'group', tonumber},		--品质
		{'id', tonumber},			--武将ID
		{'prob', tonumber},			--概率
	}
	local count = 0
	LoadConfig('data/rolecardlistactivity.txt',title,
		function(row)
			count = count + 1
			local temp = row
			if g_XssjConfig[temp.group] == nil then
				g_XssjConfig[temp.group] = {}
			end
			table.insert(g_XssjConfig[temp.group],{temp.id,temp.prob})
		end
		)
end


ReadNpcConfig = function()
	local title = {
		{'mainHeroId', tonumber},				--主将id
		{'mainHeroClass', tonumber},			--主将阶级
		{'mainHeroLevel',tonumber},				--主将等级
		{'viceHero1Id',tonumber},				--副将1id
		{'viceHero1Class',tonumber},			--副将1阶级
		{'viceHero1Level',tonumber},			--副将1等级
		{'viceHero2Id',tonumber},				--副将2id
		{'viceHero2Class',tonumber},			--副将2阶级
		{'viceHero2Level',tonumber},			--副将2等级
		{'soldier1Id',tonumber},				--士兵1id
		{'soldier2Id',tonumber},				--士兵2id
		{'soldier3Id',tonumber},				--士兵3id
		{'soldierLevel',tonumber},				--士兵等级
	}
	local count = 0
	LoadConfig('data/xzheroconfig.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_npcConfig[count] = row
		end
		)
end

ReadXzlyrewards = function()
	local title = {
		{'diff', tonumber},					--难度
		{'passid',tonumber},				--关卡
		{'base', tostring},					--基础
		{'extra',tostring},					--额外
		
	}
	local count = 0
	LoadConfig('data/xzreward.txt',title,
		function(row)
			count = count + 1
			local temp = row
			if g_xzlyrewards[temp.diff] == nil then
				g_xzlyrewards[temp.diff] = {}
			end
			table.insert(g_xzlyrewards[temp.diff],{passid = temp.passid,base = temp.base,extra = temp.extra})
		end
		)
end

ReadNpcHeroTrail = function()
	local title = {
		{'playerLevel',tonumber},				--玩家等级
		{'mainHeroId', tonumber},				--主将id
		{'mainHeroClass', tonumber},			--主将阶级
		{'mainHeroLevel',tonumber},				--主将等级
		{'viceHero1Id',tonumber},				--副将1id
		{'viceHero1Class',tonumber},			--副将1阶级
		{'viceHero1Level',tonumber},			--副将1等级
		{'viceHero2Id',tonumber},				--副将2id
		{'viceHero2Class',tonumber},			--副将2阶级
		{'viceHero2Level',tonumber},			--副将2等级
		{'soldier1Id',tonumber},				--士兵1id
		{'soldier2Id',tonumber},				--士兵2id
		{'soldier3Id',tonumber},				--士兵3id
		{'soldierLevel',tonumber},				--士兵等级
	}
	local count = 0
	LoadConfig('data/herotrail.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_npcHeroTrail[temp.playerLevel] = row
		end
		)
end

ReadSJHeroTrail = function()
	local title = {
		{'id', tonumber},			--武将ID
		{2, tonumber},			--概率
	}
	local count = 0
	LoadConfig('data/herotairl_SJ_cfg.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_SJHeroTrail[count] = temp
		end
		)
end


ReadPTHeroTrail = function()
		local title = {
		{'group', tonumber},		--品质
		{'id', tonumber},			--武将ID
		{3 , tonumber},				--概率
	}
	local count = 0
	LoadConfig('data/herotairl_PT_cfg.txt',title,
		function(row)
			count = count + 1
			local temp = row
			if g_PTHeroTrail[temp.group] == nil then
				g_PTHeroTrail[temp.group] = {}
			end
			table.insert(g_PTHeroTrail[temp.group],{temp.id,temp[3]})
		end
		)
end
--主角升级奖励配置表
ReadheroLvUpReward = function()
		local title = {
		{'level', tonumber},				--等级
		{'goods', tostring},				--物品
	}
	local count = 0
	LoadConfig('data/herolevelupreward.txt',title,
		function(row)
			count = count + 1
			local temp = row
			--g_heroLvUpReward[temp.level] = temp
			--if g_heroLvUpReward[temp.level] == nil then
			--	g_heroLvUpReward[temp.level] = {}
			--end
			local goodcomd = loadstring("return".. temp.goods)()
			table.insert(g_heroLvUpReward,temp.level,{level = temp.level,goods = goodcomd})
		end
		)
end

--卡片图鉴

ReadRoleHandBook = function()
	local title = {
		{'id', tonumber},				--等级
	}
	local count = 0
	LoadConfig('data/gethero.txt',title,
		function(row)
		count = count + 1
			local temp = row
			g_RoleBook[temp.id] = temp.id
			g_RoleHandBook[temp.id] = temp.id
		end
		)
end

--士兵强化所需道具配置
ReadsoldiersStreng = function()
		local title = {
		{'level', tonumber},				--等级
		{'money', tonumber},				--物品
		{'goodnum', tonumber},				--数量
	}
	local count = 0
	LoadConfig('data/soldiersStrengcfg.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_soldiersStreng[temp.level] = temp
		end
		)
end

--服务器语言文字
ReadserverLanguage = function()
local title = {
		{'index', tonumber},				--索引
		{1, tostring},						--中文
		{2, tostring},						--韩文
		{3, tostring}						--港澳台
	}
	local count = 0
	LoadConfig('data/serverlanguage.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_serverLanguage[temp.index] = temp
		end
		)
end
--韩文版非法字符
ReadKoreanIllegalityChar = function()
	local title = {
		{'index', tonumber},				--索引
		{'var', tostring},					--内容
	}
	local count = 0
	LoadConfig('data/IllicitumChar.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_KoreanIllegalityChar[temp.index] = temp
		end
		)
end
--没有空格的
ReadKoreanIllegalityCharNoSpalce = function()
	local title = {
		{'index', tonumber},				--索引
		{'var', tostring},					--内容
	}
	local count = 0
	LoadConfig('data/IllicitumCharNoSpalce.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_KoreanIllegalityCharNoSpalce[temp.index] = temp
		end
		)
end

--中文版非法字符
ReadIllegalityChar_ch = function()
	local title = {
		{'index', tonumber},				--索引
		{'var', tostring},					--内容
	}
	local count = 0
	LoadConfig('data/IllicitumChar_ch.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_IllegalityChar_ch[temp.index] = temp
		end
		)
end
--没有空格的
ReadIllegalityCharNoSpalce_ch = function()
	local title = {
		{'index', tonumber},				--索引
		{'var', tostring},					--内容
	}
	local count = 0
	LoadConfig('data/IllicitumCharNoSpalce_ch.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_IllegalityCharNoSpalce_ch[temp.index] = temp
		end
		)
end

--错误代码
ReaderrorCode = function()
	local title = {
		{'index', tonumber},				    --数字索引
		{'english', tostring},					--英文标注
		{'china',tostring},						--中文
		{'korean',tostring},					--韩文
		{'GAT',tostring},						--港澳台
	}
	local count = 0
	LoadConfig('data/CSerrorcode.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_errorCode[temp.english] = temp.index
		end
		)
end

--大城配置
ReadBigCity = function()
	local title = {
		{'id', tonumber},				    	--大城id
		{'name', tostring},						--名称
		{'baseprice',tonumber},					--竞标底价
		{'startbidTime',tostring},				--开始金标时间
		{'bidContinueTime',tonumber},			--竞标持续时间
		{'fightplanTime',tonumber},				--战斗准备时间
		{'fightTime',tonumber},					--战斗时间
		{'everydayReward',tostring},			--每日奖励
		{'needlevel',tonumber}					--需要的公会等级
	}
	local count = 0
	LoadConfig('data/bigcityconfig.txt',title,
		function(row)
			count = count + 1
			local temp = row
			local goods = loadstring("return" .. temp.everydayReward)()
			temp.everydayReward = goods
			g_bigCity[temp.id] = temp
			g_bigTemCity[temp.id] = temp
		end
		)
end
--
ReadSmallCity = function()
	local title = {
		{'bigid', tonumber},				    --对应大城id
		{'smallid', tostring},					--据点id
		{'smallname',tostring},					--据点名称
		{'smallicon',tostring},					--据点图标
		{'NpcLevel',tonumber},					--守将等级
		{'mainHeroId', tonumber},				--主将id
		{'mainHeroClass', tonumber},			--主将阶级
		{'mainHeroLevel',tonumber},				--主将等级
		{'viceHero1Id',tonumber},				--副将1id
		{'viceHero1Class',tonumber},			--副将1阶级
		{'viceHero1Level',tonumber},			--副将1等级
		{'viceHero2Id',tonumber},				--副将2id
		{'viceHero2Class',tonumber},			--副将2阶级
		{'viceHero2Level',tonumber},			--副将2等级
		{'soldier1Id',tonumber},				--士兵1id
		{'soldier2Id',tonumber},				--士兵2id
		{'soldier3Id',tonumber},				--士兵3id
		{'soldierLevel',tonumber},				--士兵等级
	}
	local count = 0
	LoadConfig('data/smallcityconfig.txt',title,
		function(row)
			count = count + 1
			local temp = row
			if g_smallCity[temp.bigid]  == nil and temp.bigid then
				g_smallCity[temp.bigid] = {}
			end
			if g_smallCity[temp.bigid] then
				table.insert(g_smallCity[temp.bigid],temp.smallid,temp)
			end
		end
		)
end
--公会战英雄出现概率配置
ReadgvgNpc = function()
	local title = {
		{'id', tonumber},			--武将id
		{'star',tonumber},			--星级
		{3, tonumber},				--概率
	}
	local count = 0
	LoadConfig('data/gvpnpccfg.txt',title,
		function(row)
			count = count + 1
			local temp = row
			g_gvgNpc[count] = temp
		end
		)
end

--大城配置
ReadGCLDInfo = function()
	local title = {
		{'id', tonumber},				    	--大城id
		{'name', tostring},						--名称
		{'everyReward1',tostring},				--每日奖励1
		{'everyReward2',tostring},				--每日奖励2
		{'everyReward3',tostring},				--每日奖励3
		{'everyReward4',tostring},				--每日奖励4
		{'star1',tostring},						--星星奖励1
		{'star2',tostring}						--星星奖励2
	}
	local count = 0
	LoadConfig('data/gcldconfig.txt',title,
		function(row)
			count = count + 1
			local temp = row
			temp.everyReward1 = loadstring("return" .. temp.everyReward1)()
			temp.everyReward2 = loadstring("return" .. temp.everyReward2)()
			temp.everyReward3 = loadstring("return" .. temp.everyReward3)()
			temp.everyReward4 = loadstring("return" .. temp.everyReward4)()
			temp.star1 = loadstring("return" .. temp.star1)()
			temp.star2 = loadstring("return" .. temp.star2)()
			g_gcldInfo[temp.id] = temp
		end
		)
end

--g_gcldNpc
ReadGCLDNpcConfig = function()
	local title = {
		{'cityid', tonumber},					--城池id
		{'mainHeroId', tonumber},				--主将id
		{'mainHeroClass', tonumber},			--主将阶级
		{'mainHeroLevel',tonumber},				--主将等级
		{'viceHero1Id',tonumber},				--副将1id
		{'viceHero1Class',tonumber},			--副将1阶级
		{'viceHero1Level',tonumber},			--副将1等级
		{'viceHero2Id',tonumber},				--副将2id
		{'viceHero2Class',tonumber},			--副将2阶级
		{'viceHero2Level',tonumber},			--副将2等级
		{'soldier1Id',tonumber},				--士兵1id
		{'soldier2Id',tonumber},				--士兵2id
		{'soldier3Id',tonumber},				--士兵3id
		{'soldierLevel',tonumber},				--士兵等级
		{'money',tonumber},						--钱币
		{'id1',tonumber},						--id
		{'type1',tonumber},						--类型
		{'num1',tonumber},						--数量
		{'prob1',tonumber},						--概率
		{'id2',tonumber},						--id
		{'type2',tonumber},						--类型
		{'num2',tonumber},						--数量
		{'prob2',tonumber},						--概率
		{'id3',tonumber},						--id
		{'type3',tonumber},						--类型
		{'num3',tonumber},						--数量
		{'prob3',tonumber},						--概率
		{'id4',tonumber},						--id
		{'type4',tonumber},						--类型
		{'num4',tonumber},						--数量
		{'prob4',tonumber},						--概率
		{'id5',tonumber},						--id
		{'type5',tonumber},						--类型
		{'num5',tonumber},						--数量
		{'prob5',tonumber},						--概率
		{'expend',tonumber},					--消耗的能力
	}
	local count = 0
	LoadConfig('data/gcldfbconfig.txt',title,
		function(row)
			count = count + 1
			local temp = row
			local id = math.floor(temp.cityid / 10)
			local index = math.floor(temp.cityid % 10)
			if not g_gcldNpc[id] then
				g_gcldNpc[id] = {}
			end
			table.insert(g_gcldNpc[id],index,temp)
		end
		)
end

--国战npc配置
ReadGZNPCInfo = function()
	local title = {
		{'min', tonumber},				    	--大城id
		{'max', tonumber},						--名称
		{'mainHeroId', tonumber},				--主将id
		{'mainHeroClass', tonumber},			--主将阶级
		{'mainHeroLevel',tonumber},				--主将等级
		{'viceHero1Id',tonumber},				--副将1id
		{'viceHero1Class',tonumber},			--副将1阶级
		{'viceHero1Level',tonumber},			--副将1等级
		{'viceHero2Id',tonumber},				--副将2id
		{'viceHero2Class',tonumber},			--副将2阶级
		{'viceHero2Level',tonumber},			--副将2等级
		{'soldier1Id',tonumber},				--士兵1id
		{'soldier2Id',tonumber},				--士兵2id
		{'soldier3Id',tonumber},				--士兵3id
		{'soldierLevel',tonumber},				--士兵等级
	}
	local count = 0
	LoadConfig('data/gznpc.txt',title,
		function(row)
            local temp = row
			count = count + 1
			g_gznpc[count] = temp
		end
		)
end

--国战npc id配置 呵呵
ReadGZIDInfo = function()
	local title = {
		{'id', tonumber},				    	--呵呵
	}
	local count = 0
	LoadConfig('data/gzid.txt',title,
		function(row)
            local temp = row
            count = count + 1
			g_gzidhehe[count] = temp
		end
		)
end

--将魂
ReadJHConfig = function()
	local title = {
		{'id', tonumber},				    	--id
		{'name', tostring},						--名字
		{'type', tonumber},						--类型
		{'quality', tonumber},					--品质
		{'atrrAddType', tonumber},              --属性改变类型
		{'base', tonumber},						--基础属性值
		{'addvalue', tonumber},					--增长值
		{'kindType',tonumber},					--亲和类型
		{'kindRate',tonumber},					--亲和百分比
		{'kindSoldier',tonumber},				--亲和士兵
		{'imgID',tostring},						--资源
		{'describe',tostring},					--描述
	}
	local count = 0
	LoadConfig('data/jhconfig.txt',title,
		function(row)
            local temp = row
            count = count + 1

            if temp.atrrAddType == 2 then
            	temp.base = temp.base/100
            	temp.addvalue = temp.addvalue/100
            end
            if temp.kindRate ~= nil then
                temp.kindRate = temp.kindRate/100
            end

			g_jhconfig[temp.id] = temp
		end
		)
end
--英雄之旅
--条件id对应：
-- 1、角色等级达X级
-- 2、拥有美铝卡牌数量X张
-- 3、拥有紫色装备及以上品种的装备数量
-- 4、通关章节第X章
-- 5、武将进阶到X阶
-- 6、血战挑战层数到X层
-- 7、加入公会
-- 8、成功参加X次公会战
-- 9、成功充值任意金额X次
-- 10、加入国家
-- 11、天梯名次达到前X名
-- 12、参加X次国战
-- 13、获得X件紫色品质及以上品种将魂

ReadHeroTravelConfig = function()
	local title = {
		{'id', tonumber},				    	--id
		{'day', tonumber},						--天数
		{'tj', tonumber},						--条件类型
		{'tjnum', tonumber},					--条件完成基本数量
		{'id1', tonumber}, 						--从这里开始往下是奖励	
		{'type1', tonumber},					
		{'num1',tonumber},					
		{'id2',tonumber},					
		{'type2',tonumber},					
		{'num2',tonumber},				
		{'id3', tonumber},						
		{'type3', tonumber},					
		{'num3',tonumber},					
		{'id4', tonumber},						
		{'type4', tonumber},					
		{'num4',tonumber},					
	}
	local count = 0
	LoadConfig('data/herotravel.txt',title,
		function(row)
            local temp = row
            count = count + 1
            local goods = {}
            if temp.id1 and temp.type1 and temp.type1 then
            	table.insert(goods,{temp.id1,temp.type1,temp.num1})
            end
			if temp.id2 and temp.type2 and temp.type2 then
            	table.insert(goods,{temp.id2,temp.type2,temp.num2})
            end
            if temp.id3 and temp.type3 and temp.type3 then
            	table.insert(goods,{temp.id3,temp.type3,temp.num3})
            end
			if temp.id4 and temp.type4 and temp.type4 then
            	table.insert(goods,{temp.id4,temp.type4,temp.num4})
            end
			g_heroTravelconfig[temp.id] = {id = temp.id,day = temp.day,tj=temp.tj,tjnum=temp.tjnum,goods = goods, bz = 0}
		end
		)
end

ReadCJConfig = function()
	local title = {
		{'id', tonumber},				    	--id
		{'tj', tonumber},						--条件类型
		{'tjnum', tonumber},					--条件完成基本数量
		{'id1', tonumber}, 						--从这里开始往下是奖励	
		{'type1', tonumber},					
		{'num1',tonumber},					
		{'id2',tonumber},					
		{'type2',tonumber},					
		{'num2',tonumber},				
		{'id3', tonumber},						
		{'type3', tonumber},					
		{'num3',tonumber},					
		{'id4', tonumber},						
		{'type4', tonumber},					
		{'num4',tonumber},
        --{'bz',tonumber},	成就领取标志				
	}
	local count = 0
	LoadConfig('data/herocjconfig.txt',title,
		function(row)
            local temp = row
            count = count + 1
            local goods = {}
            if temp.id1 and temp.type1 and temp.type1 then
            	table.insert(goods,{temp.id1,temp.type1,temp.num1})
            end
			if temp.id2 and temp.type2 and temp.type2 then
            	table.insert(goods,{temp.id2,temp.type2,temp.num2})
            end
            if temp.id3 and temp.type3 and temp.type3 then
            	table.insert(goods,{temp.id3,temp.type3,temp.num3})
            end
			if temp.id4 and temp.type4 and temp.type4 then
            	table.insert(goods,{temp.id4,temp.type4,temp.num4})
            end
			g_cjconfig[temp.id] = {id = temp.id,tj=temp.tj,tjnum=temp.tjnum,goods = goods, bz = 0}
		end
		)
end

--活跃达人
ReadHYDRConfig = function()
	local title = {
		{'id', tonumber},				    	--id
		{'day',tonumber},						--天数
		{'tj', tonumber},						--条件类型
		{'tjnum', tonumber},					--条件完成基本数量
		{'id1', tonumber}, 						--从这里开始往下是奖励	
		{'type1', tonumber},					
		{'num1',tonumber},					
		{'id2',tonumber},					
		{'type2',tonumber},					
		{'num2',tonumber},				
		{'id3', tonumber},						
		{'type3', tonumber},					
		{'num3',tonumber},					
		{'id4', tonumber},						
		{'type4', tonumber},					
		{'num4',tonumber},					
	}
	local count = 0
	LoadConfig('data/hydrconfig.txt',title,
		function(row)
            local temp = row
            count = count + 1
            local goods = {}
            if temp.id1 and temp.type1 and temp.type1 then
            	table.insert(goods,{temp.id1,temp.type1,temp.num1})
            end
			if temp.id2 and temp.type2 and temp.type2 then
            	table.insert(goods,{temp.id2,temp.type2,temp.num2})
            end
            if temp.id3 and temp.type3 and temp.type3 then
            	table.insert(goods,{temp.id3,temp.type3,temp.num3})
            end
			if temp.id4 and temp.type4 and temp.type4 then
            	table.insert(goods,{temp.id4,temp.type4,temp.num4})
            end
			g_hydrconfig[temp.id] = {id = temp.id,day=temp.day,tj=temp.tj,tjnum=temp.tjnum,goods = goods, bz = 0}
		end
		)
end


--随机姓名

ReadRandomNameCfg = function()
	local title = {
		{'xing', tostring},				    	
		{'ming',tostring},						
	}
	local count = 0
    g_randomName.xing = {}
    g_randomName.ming = {}
	LoadConfig('data/randomname.txt',title,
		function(row)
            local temp = row
            if temp.xing and  temp.xing ~= "" then
            	table.insert(g_randomName.xing,temp.xing)
            end
            if temp.ming then
            	table.insert(g_randomName.ming,temp.ming)
            end
		end
		)
end





ReadNewFormation()
ReadPassConfig()
ReadRoleCardConfig()
ReadEquipConfig()
ReadSophistication()
ReadItemConfig()
ReadSoldierConfig()
ReadRoleCardList()
ReadPassiveSpellConfig()
ReadSilverBoxConfig()
ReadGoldBoxConfig()
ReadRoldCardChipBoxConfig()
ReadMysticalBoxConfig()
ReadWhiteBoxConfig()
ReadSpWhiteBoxConfig()
ReadBlueBoxConfig()
ReadPurPleBoxConfig()
ReadOrangeBoxConfig()
ReadRedBoxConfig()
ReadheroBoxConfig()
ReadFixBoxConfig()
ReadCJSPBoxConfig()
ReadHQBoxConfig1()
ReadHQBoxConfig2()
ReadHQBoxConfig3()
ReadHQBoxConfig4()
ReadHQBoxConfig5()
ReadDWBoxConfig()
ReadRedBagConfig()
ReadOrangeBagConfig()

ReadShopConfig()
ReadShopVip1Config()
ReadShopVip2Config()
ReadShopSixConfig()
ReadShopPvpConfig()
ReadShopGuildConfig()
ReadShopGZConfig()
ReadXssjconfig()
ReadNpcConfig()
ReadXzlyrewards()
ReadNpcHeroTrail()
ReadPTHeroTrail()
ReadSJHeroTrail()
ReadheroLvUpReward()
ReadRoleHandBook()
ReadsoldiersStreng()
ReadserverLanguage()
ReadKoreanIllegalityChar()
ReadKoreanIllegalityCharNoSpalce()
ReadIllegalityChar_ch()
ReadIllegalityCharNoSpalce_ch()
ReaderrorCode()
ReadBigCity()
ReadSmallCity()
ReadgvgNpc()
ReadGCLDInfo()
ReadGCLDNpcConfig()
ReadGZNPCInfo()
ReadGZIDInfo()
ReadJHConfig()
ReadHeroTravelConfig()
ReadCJConfig()
ReadHYDRConfig()
ReadRandomNameCfg()

g_EquipCardConfig = g_EquipConfig