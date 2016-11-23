--玩家基础属性相关的配置

g_PlayerBaseConfig = 
{
	AutoFightLevel = 5,				--自动战斗功能可见等级
	PassExpRatio = 100,					--关卡中卡片得到经验的比例，采用百分比
	MoneyRatio = 1000,					--比例
	MaxSchoolLevel = 130,				--最高学校等级
	MaxBaseEnergy = 120,				--基础体力值
	EnergyMaintainCD = 10*60,				--体力值恢复CD，秒
	StudyAmount = 10,					--每日可学习次数
	SLRoleLevel = 0,					--学校等级限制角色卡最高等级配置
	SLEquipLevel = 5,					--学校等级限制装备卡最高等级配置
	SLRoleExpRatio = 					--强化学生卡升级的经验比例
		{
			[1] = {[1]={20,48},[2]={30,30},[3]={45,14.4},[4]={55,7.8},[5]={70,4.32},[6]={90,2.34},[7]={100,1.5},},						--配置方法：初级强化，1到40级为50%，41到60级为50%，61到100级为20%
			[2] = {[1]={20,64},[2]={30,40},[3]={45,19.2},[4]={55,10.4},[5]={70,5.76},[6]={90,3.12},[7]={100,2},},						--中级强化
			[3] = {[1]={20,80},[2]={30,50},[3]={45,24},[4]={55,13},[5]={70,7.2},[6]={90,3.9},[7]={100,2.5},},						--高级强化
			
		},
	SLRoleSelect = 						--学校等级开启角色卡强化选项配置
		{[1]=1,[2]=5,[3]=15,},
	
	

	--好友随机加友配置: 0>=并且<0.3,0.3>=并且<0.5,...
	RandomAddFrd = {{0.3,50},{0.5,40},{0.7,30},{0.9,10},{1,3},},
	
	----------------vip相关-------------------
	VipReward = 						--vip礼包对应的物品id
		{[1]=13,[2]=14,[3]=15,[4]=16,[5]=17,[6]=18,[7]=19,[8]=20,[9]=21,[10]=22,},
	VipMoney = 							--vip礼包对应的金钱加成
		{[1]=2,[2]=5,[3]=15,[4]=20,[5]=25,[6]=30,[7]=35,[8]=40,[9]=45,[10]=50,},
	VipPassPrice = {1,10},				--vip刷新副本挑战的价格
	VipBasePassCount = 1,				--0级vip刷新副本挑战的每日总次数
	VipPassCount = 						--vip等级对应刷新副本挑战的每日总次数
		{[1]=2,[2]=4,[3]=10,[4]=12,[5]=14,[6]=16,[7]=18,[8]=20,[9]=22,[10]=24,},
	VipBaseTrainCount = 5,				--0级vip培养学生免费刷新次数
	VipTrainCount = 					--vip等级对应培养学生免费刷新次数
		{[1]=6,[2]=7,[3]=12,[4]=14,[5]=16,[6]=18,[7]=20,[8]=22,[9]=24,[10]=26,},
	VipBaseMarketCount = 5,				--0级vip人才市场免费刷新次数
	VipMarketCount = 					--vip等级对应人才市场免费刷新次数
		{[1]=6,[2]=7,[3]=12,[4]=14,[5]=16,[6]=18,[7]=20,[8]=22,[9]=24,[10]=26,},
	VipEnegryCount = 					--vip等级体力上限
		{[1]=35,[2]=40,[3]=45,[4]=50,[5]=50,[6]=50,[7]=50,[8]=50,[9]=50,[10]=50,},
	VipAutoFightLevel = 20,				--vip限制自动战斗功能开启的玩家等级
	VipEnegryItemLimitCount = 			--vip等级体力道具额外使用次数
		{[1]=0,[2]=0,[3]=2,[4]=3,[5]=4,[6]=4,[7]=4,[8]=4,[9]=4,[10]=4,},
	VipPvpPrice = {1,10},				--vip刷新pvp挑战的价格
	VipBasePvpCount = 1,				--0级vip刷新PVP挑战的每日总次数
	VipPvpCount = 						--vip等级对应刷新PVP挑战的每日总次数
		{[0]=1,[1]=1,[2]=2,[3]=2,[4]=3,[5]=3,[6]=3,[7]=4,[8]=4,[9]=4,[10]=5,},
	VipBaseSampleCount = 1, 				--vip0级对应高级抽卡掉落组
	VipSampleCount = 						--vip等级对应高级抽卡掉落组
		{[1]=2,[2]=3,[3]=4,[4]=5,[5]=6,[6]=7,[7]=8,[8]=9,[9]=10,[10]=11,},
	VipBaseBox1Count = 1, 				--vip0级对应金箱子掉落组
	VipBox1Count = 						--vip等级对应金箱子掉落组
		{[1]=2,[2]=3,[3]=4,[4]=5,[5]=6,[6]=7,[7]=8,[8]=9,[9]=10,[10]=11,},
	VipBaseBox2Count = 1, 				--vip0级对应银箱子掉落组
	VipBox2Count = 						--vip等级对应银箱子掉落组
		{[1]=2,[2]=3,[3]=4,[4]=5,[5]=6,[6]=7,[7]=8,[8]=9,[9]=10,[10]=11,},
	VipBaseEMRefreshCount = 1,			--vip0级对应兑换金币免费刷新数
	VipExchangeMoneyCount = 			--vip等级对应兑换金币免费刷新数
		{[1]=2,[2]=3,[3]=4,[4]=5,[5]=6,[6]=7,[7]=8,[8]=9,[9]=10,[10]=11,},
	VipBaseEGRefreshCount = 5,			--vip0级对应兑换元宝免费刷新数
	VipExchangeGoldCount = 				--vip等级对应兑换元宝免费刷新数
		{[1]=6,[2]=7,[3]=12,[4]=14,[5]=16,[6]=18,[7]=20,[8]=22,[9]=24,[10]=26,},
	---新加的---------------------------------------------------------------------------------------------------------
	-----------------------------------
	AddFighterCntLv = { 3, 8, 11,},		-- 升级时增加战斗可上场人数的等级
	MaxUpgradingBuilding = 1,			-- 最大同时升级建筑数
	ResolveItemID = 30,					--分解装备消耗的道具id
	ResolveItemResRatio = 0.8,			--分解装备获得资源比例
	ImpartItemID = 29,					--传功消耗的道具id
	ImpartExpRatio = 0.8,				--传功获得资源比例
	SampleType1Level = 1, 				--低级抽卡等级限制
	ResolveCardQuality = 10,			--装备卡分解需要道具起始品质
	ImpartCardQuality = 3,				--传承需要道具起始品质
	RandomFrdLevel = 3,					--随机添加好友开启等级,>=
	RandomFindFrdCount = 50,			--随机添加好友,查寻在线好友是否符合条件的次数=
	RandomFrdFightRank = 0.15,			--随机添加好友,战斗力范围>=,<=
	RandomFrdLevelRank = 5,				--随机添加好友,等级范围>=,<=
	RoleCardToFrag = {					--角色卡转化为碎片
		[1]={[1]={0,100},},
		[2]={[1]={2, 90},[2]={3, 10},},
		[3]={[1]={3, 10},[2]={4, 80},[3]={5, 10},},
		[4]={[1]={6, 16},[2]={7, 16},[3]={8, 20},[4]={9, 20},[5]={10, 20},[6]={11, 20},},
		[5]={[1]={15, 12},[2]={16, 12},[3]={17, 12},[4]={18, 12},[5]={19, 12},[6]={20, 12},[7]={21, 10},[8]={22, 6},[9]={23, 6},[10]={24, 6},},
		},	
	
	DirectLevel = 3,				--目的性指引提示开启等级
	
	--------------功能开启相关配置-------------
	ExchangeGoldOpen = {level=1,},	--兑换元宝活动 已取消，现在用建筑等级控制
	MarketOpen = {level=1,},		--人才市场活动 已取消，现在用建筑等级控制
	
	TrainOpen = {level=1,},  --培养
	BuildResOpen = {level=1,},   -- {pass={1,1},},  收资源，等级，关卡配一个
	PVPOpen = {level=1,},	--PVP
	BuildLevelUpOpen = {level=1,},    --{pass={1,5},},   建筑升级
	LoginSampleOpen = {level=1,},	--登陆领奖
	SampleCardOpen = {level=1,},	--抽卡
	
	GetEnergyOpen = {level=2,},		--领取体力活动
	FriendOpen = {level=3,},		--好友开启
	
	------------------jjdsg

	
	

}
--g_PlayerBaseConfig